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

    def mainReport(){
        def orders = ConfOrder.list()
        def paidCount = ConfOrder.countByPaidAndCheckReceived(true, true)
        def count = orders.size()
        [orders:orders, count:count, paidCount:paidCount]
    }

    def show(ConfOrder orderInstance) {
        respond orderInstance
    }

    def create() {
        respond new ConfOrder(params)
    }

    def register() {
        def formatter = NumberFormat.currencyInstance
        def buyer
        def confOrder
        if(session.confOrder){
            buyer = Buyer.get(session.buyer.id)
            confOrder = ConfOrder.get(session.confOrder.id)
            
            return [buyer: buyer,
                    confOrder: confOrder,
                    attendees: confOrder?.attendees,
                    amount: formatter.format(confOrder?.calcTotalPrice()),
                    number: confOrder?.attendees?.size()]
        } else if (params.confOrderId){
            confOrder = ConfOrder.get(params.confOrderId.toInteger())
            buyer = confOrder.buyer
            return [buyer: buyer,
                    confOrder: confOrder,
                    attendees: confOrder?.attendees,
                    amount: formatter.format(confOrder?.calcTotalPrice()),
                    number: confOrder?.attendees?.size()]
        } else {
            buyer = new Buyer(params)
            confOrder = new ConfOrder(buyer: buyer)
            [buyer: buyer, confOrder: confOrder]
        }

    }

    def saveRegistration() {
        def buyerExists = false
        println "OrderController:saveRegistration... ${params}"
        def buyer
        def order 
        if (session.buyer){
            buyer = Buyer.get(session.buyer.id)
            order = ConfOrder.findByBuyer(buyer)
            updateBuyerWithParams(buyer, params)
        } else {
            buyer = Buyer.findByEmail(params.pEmail?.toLowerCase())
            if (buyer){
                buyerExists = true
                buyer.firstName = params.pFirstName 
                buyer.lastName = params.pLastName 
                buyer.email = params.pEmail?.toLowerCase() 
                buyer.password = params.pPassword 
                buyer.address1 = params.pAddress1 
                buyer.address2 = params.pAddress2 ?: '' 
                buyer.city = params.pCity 
                buyer.state = params.pState 
                buyer.zip = params.pZip
                buyer.phone = params.pPhone
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
        }
        if(buyer.save(flush: true, failOnError:true)) {
            session.buyer = buyer
            if (buyerExists){
                order = ConfOrder.findByBuyer(buyer)
            }
            if (!order){
                order = new ConfOrder(buyer: buyer).save(flush:true)
                session.confOrder = order
                println "order #${order?.id} has been saved."
                println "order.buyer is ${order?.buyer}"
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
        def formatter = java.text.NumberFormat.currencyInstance
        def order = ConfOrder.get(params.orderId)
        def buyer
        def attendees
        def amount 
        def number

        if (order){
            attendees = order.attendees
            buyer = order.buyer
            number = attendees?.size() ?: 0
            amount = formatter.format(order.calcTotalPrice())
            /*
            confOrder: confOrder, 
                       attendees: attendees, 
                       amount: formatter.format(confOrder.calcTotalPrice()), 
                       number: attendees?.size(), 
                       allRoomNotes: confOrder.allRoomNotes*/
            println "In attendees action: order is ${order} and buyer is ${buyer}"
        } else{
            flash. message = "No order in progress, please enter buyer information."
            redirect action: 'register'
            return
        }
        [attendees: attendees, confOrder: order, buyer: buyer, number:number, amount:amount]
    }

    def thanks() {
        def formatter = java.text.NumberFormat.currencyInstance
        params.each{key, val -> println "$key == $val"}
        def order = ConfOrder.get(params.id.toInteger())
        def buyer = order.buyer
        if (params.paymentType == 'check'){
            order.paymentType = "Check"
        }
        order.paid = true
        if (!order.save(flush:true)){
            println "Error saving order for buyer: ${buyer.firstName} ${buyer.lastName} - ${buyer.email}"
            order.errors.allErrors.each{println it}
        }
        return [buyer: buyer, order: order, check: (order.paymentType == "Check"),
                amount: formatter.format(order.calcTotalPrice())]
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
    def removeAttendee(){
        def attendee = Attendee.get(params.id)
        def confOrder = ConfOrder.get(params.orderId)
        if (attendee && confOrder){
            confOrder.removeFromAttendees(attendee)
            attendee.delete()
            confOrder.save()
        }
        redirect(action:'attendees', params:[orderId: confOrder.id])
    }

    @Transactional
    def seminars() {
        def confOrder = ConfOrder.get(params.id)
        def buyer = confOrder.buyer
        def attendees = confOrder.attendees
        def formatter = java.text.NumberFormat.currencyInstance

        [attendees: attendees.sort{ it.id }, confOrder: confOrder,
         buyer: buyer, amount: formatter.format(confOrder.calcTotalPrice()),
         number: attendees?.size()]
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
            'Love the Word - Rex Trogdon',
            'Love the Assembly - Brian Gunning',
            'Love Not the World - Scott DeGroff',
            'Love Service for the Lord - Joe Reese',
            'Love the Lord with all Your Mind - Jesse Gentile',
            'Love for the Flock/Shepherd - Steve Price',
            'Love Young People - Nate Bramsen',
            'Love for Israel - Bruce Scott',
            'Love My Neighbor - Robert Brown',
            'Love Hospitality (Women Only) - Nancy Trogdon',
            "Under 13 - In Children's program"
        ]
        def seminar2List = [
            'Love His Appearing - Mike Attwood',
            'Love My Neighbor - Robert Brown',
            'Love the Little Children - Grady Dollar',
            'Love the Lost (Women Only) - Joyce Barinowski',
            'Love Your Family (Women Only) - Marlene Gunning',
            'Love the World (Missions) - Bob Dadd',
            'Love the Word - Rex Trogdon',
            'Love for the Flock/Shepherd - Steve Price',
            'Love Your Muslim Neighbor - Paul Bramsen',
            "Under 13 - In Children's program"
        ]
        def seminar3List = [
            'Love the Quiet Place - Rex Trogdon',
            'Love Not the World - Scott DeGroff',
            'Love Service for the Lord - Joe Reese',
            'Love Hospitality (Women Only) - Nancy Trogdon',
            'Love Your Muslim Neighbor - Paul Bramsen',
            'Love the Home - Steve Price',
            'Love His Appearing - Mike Attwood',
            'Love the Lost (Women Only) - Joyce Barinowski',
            'Love the Little Children',
            "Under 13 - In Children's program"
        ]
        def seminar4List = [
            'Love Young People - Nate Bramsen',
            'Love the Quiet Place - Rex Trogdon',
            'Love the Assembly - Brian Gunning',
            'Love the World (Missions) - Bob Dadd',
            'Love for Israel - Bruce Scott',
            'Love the Lord with all Your Mind - Jesse Gentile',
            'Love Your Family (Women Only) - Marlene Gunning',
            'Love the Home - Steve Price',
            "Under 13 - In Children's program"
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
