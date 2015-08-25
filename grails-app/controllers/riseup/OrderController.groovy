package riseup

import java.text.NumberFormat

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class OrderController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConfOrder.list(params), model:[orderInstanceCount: ConfOrder.count()]
    }

    def show(ConfOrder orderInstance) {
        respond orderInstance
    }

    def create() {
        respond new ConfOrder(params)
    }

    def register() {
        def formatter = NumberFormat.currencyInstance

        if(session.confOrder){
            def buyer = Buyer.get(session.buyer.id)
            def confOrder = ConfOrder.get(session.confOrder.id)

            [buyer: buyer,
             confOrder: confOrder,
             attendees: confOrder?.attendees,
             amount: formatter.format(confOrder?.attendees*.ticketType*.price?.sum()),
             number: confOrder?.attendees?.size()]
        } else {
            [buyer: new Buyer(params)]
        }
    }

    def saveRegistration() {
        println "OrderController:saveRegistration... ${params}"
        def buyer
        def order 
        if (session.buyer){
            buyer = Buyer.get(session.buyer.id)
            order = ConfOrder.findByBuyer(buyer)
            updateBuyerWithParams(buyer, params)
        } else{
            buyer  = new Buyer(firstName: params.pFirstName, 
                               lastName: params.pLastName, 
                               email: params.pEmail?.toLowerCase(), 
                               password: params.pPassword, 
                               address1: params.pAddress1, 
                               address2: params.pAddress2 ?: '', 
                               city: params.pCity, state: params.pState, 
                               zip: params.pZip, phone: params.pPhone)
        }
        if(buyer.save(flush: true)) {
            session.buyer = buyer
            if (!order){
                order = new ConfOrder(buyer: buyer).save()
                session.confOrder = order
            }
            redirect action: "attendees", params: [orderId: order.id]
        } else {
            flash.message = "Sorry, we could not save your information"

            buyer.errors.allErrors.each { println it }

            redirect action: "register"
        }
    }

    private void updateBuyerWithParams(buyer, params){
        if (params.pFirstName){buyer.firstName = params.pFirstName}
        if (params.pLastName){buyer.lastName = params.pLastName}
        if (params.pEmail){buyer.email = params.pEmail.toLowerCase()}
        if (params.pAddress1){buyer.address1 = params.pAddress1}
        if (params.pAddress2){buyer.address2 = params.pAddress2}
        if (params.pCity){buyer.city = params.pCity}
        if (params.pState){buyer.state = params.pState}
        if (params.pZip){buyer.zip = params.pZip}
        if (params.pPhone){buyer.phone = params.pPhone}
        if (params.pPassword){
            if(params.pPassword == params.pConfirm_password){
                buyer.password = params.pPassword
            }
        }
    }

    def attendees() {
        def order = ConfOrder.get(params.orderId)
        def buyer
        def attendees
        if (order){
            attendees = order.attendees
            buyer = order.buyer
        }
        [attendees: attendees, confOrder: order, buyer: buyer]
    }

    def thanks() {
        def buyer = Buyer.get(params.id)
        def order = ConfOrder.findByBuyer(buyer)
        if (params.paymentType == 'check'){
            order.paymentType = "Check"
        }
        order.paid = true
        if (!order.save(flush:true)){
            println "Error saving order for buyer: ${buyer.firstName} ${buyer.lastName} - ${buyer.email}"
            order.errors.allErrors.each{println it}
        }
        return [buyer: buyer, order: order, check: (order.paymentType == "Check"),
                amount: formatter.format(confOrder.calcTotalPrice())]
    }


    @Transactional
    def save(ConfOrder orderInstance) {
        if (orderInstance == null) {
            notFound()
            return
        }

        if (orderInstance.hasErrors()) {
            respond orderInstance.errors, view:'create'
            return
        }

        orderInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ConfOrder.label', default: 'ConfOrder'), orderInstance.id])
                redirect orderInstance
            }
            '*' { respond orderInstance, [status: CREATED] }
        }
    }

    def edit(ConfOrder orderInstance) {
        respond orderInstance
    }

    @Transactional
    def update(ConfOrder orderInstance) {
        if (orderInstance == null) {
            notFound()
            return
        }

        if (orderInstance.hasErrors()) {
            respond orderInstance.errors, view:'edit'
            return
        }

        orderInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ConfOrder.label', default: 'ConfOrder'), orderInstance.id])
                redirect orderInstance
            }
            '*'{ respond orderInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ConfOrder orderInstance) {

        if (orderInstance == null) {
            notFound()
            return
        }

        orderInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ConfOrder.label', default: 'ConfOrder'), orderInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Transactional
    def addAttendee(){
        //println "addAttendee..."
        //params.each{key, val -> println "$key == $val"}
        
        def formatter = java.text.NumberFormat.currencyInstance

        if(!session.buyer){
          session.buyer = new Buyer(firstName: params.pFirstName, lastName: params.pLastName, email: params.pEmail?.toLowerCase(), password: params.pPassword, address1: params.pAddress1, address2: params.pAddress2 ?: '', city: params.pCity, state: params.pState, zip: params.pZip, phone: params.pPhone).save(failOnError:true)
        }
        else if(!session.confOrder){
          def buyer = session.buyer
          session.confOrder = new ConfOrder(buyer: buyer).save()
        }

        def confOrder = ConfOrder.get(session.confOrder?.id)

        def attendee = new Attendee(params)
        confOrder.addToAttendees(attendee)
        attendee?.save(failOnError: true)
        if (!confOrder.save()){
            println "Error in addAttendee at confOrder.save()"
            confOrder.errors.allErrors.each{println it}
        }
        def attendees = ConfOrder.get(confOrder.id)?.attendees

        render template: 'attendeeList', 
               model: [confOrder: confOrder, 
                       attendees: attendees, 
                       amount: formatter.format(confOrder.calcTotalPrice()), 
                       number: attendees?.size(), 
                       allRoomNotes: confOrder.allRoomNotes]
        return false
    }

    @Transactional
    def seminars() {
        def buyer = Buyer.get(params.id)
        def confOrder = ConfOrder.findByBuyer(buyer)
        def attendees = confOrder.attendees

        [attendees: attendees.sort{ it.id }, confOrder: confOrder]
    }
    
    @Transactional
    def saveSeminarSelections() {
        def orderInstance = ConfOrder.get(params.orderId)
        def attendee = Attendee.get(params.attendeeId)

        attendee.with {
            seminar1 = params.seminar1
            seminar2 = params.seminar2
            seminar3 = params.seminar3
            seminar4 = params.seminar4
            save(failOnError: true)
        }

        redirect(action:'seminars', params:[id: orderInstance.id])
    }

    def loadSeminarSelectionForm(){
        println "in loadSeminarSelectionForm id is ${params.id}"
        def attendee = Attendee.get(params.id)
        println "attendee is $attendee"
        def orderInstance = attendee?.confOrder
        def seminar1List = [
            'Love the Word',
            'Love the Assembly',
            'Love Not the World',
            'Love Service for the Lord',
            'Love for the Flock/Shepherd', 
            'Love Young People',
            'Love for Israel',
            'Love My Neighbor',
            'Love Hospitality (Women Only)',
            'N/A - In Children program'
        ]
        def seminar2List = [
            'Love His Appearing',
            'Love the Erring One',
            'Love the Little Children',
            'Love the Lost (Women Only)', 
            'Love Your Family (Women Only)',
            'Love the World (Missions)',
            'Love the Quiet Place', 
            'Love the Home',
            'N/A - In Children program'
        ]
        def seminar3List = [
            'Love the Word',
            'Love Not the World',
            'Love Service for the Lord',
            'Love Hospitality (Women Only)',
            'Love for the Flock/Shepherd',
            'Love His Appearing',
            'Love the Lost (Women Only)',
            'Love the Little Children',
            'N/A - In Children program'
        ]
        def seminar4List = [
            'Love Young People',
            'Love the Quiet Place',
            'Love the Assembly',
            'Love the World (Missions)',
            'Love for Israel',
            'Love My Neighbor',
            'Love the Erring One',
            'Love Your Family (Women Only)',
            'Love the Home',
            'N/A - In Children program'
        ]
        def model = [confOrder: orderInstance, 
                     attendee: attendee,
                     seminar1List: seminar1List, 
                     seminar2List: seminar2List,
                     seminar3List: seminar3List, 
                     seminar4List: seminar4List]
        println "model is $model"
        render(template: 'seminarForm', model: model)
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ConfOrder.label', default: 'ConfOrder'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
