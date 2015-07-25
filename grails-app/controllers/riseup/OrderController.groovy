package riseup



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

    def order() {
        def formatter = java.text.NumberFormat.currencyInstance

        if(session.confOrder){
            def buyer = Buyer.get(session.buyer.id)
            def confOrder = ConfOrder.findByBuyer(buyer)

            render view: 'new_order', model: [buyer: buyer,
                                              confOrder: confOrder,
                                              attendees: confOrder?.attendees,
                                              amount: formatter.format(confOrder?.attendees*.ticketType*.price.sum()),
                                              number: confOrder?.attendees?.size()]
        } else {
            render view: 'new_order', model: [buyer: new Buyer(params)]
        }
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
        println "\n\n\n in addAttendee action. params are:\n \n $params\n\n\n"
        def formatter = java.text.NumberFormat.currencyInstance

        if(!session.buyer){
          session.buyer = new Buyer(firstName: params.pFirstName, lastName: params.pLastName, email: params.pEmail?.toLowerCase(), password: params.pPassword, address1: params.pAddress1, address2: params.pAddress2 ?: '', city: params.pCity, state: params.pState, zip: params.pZip, phone: params.pPhone).save(failOnError:true)
        }
        if(!session.confOrder){
          def buyer = session.buyer
          session.confOrder = new ConfOrder(buyer: buyer).save()
        }

        println "the buyer is ${session.buyer}"

        def confOrder = session.confOrder

        def attendee = new Attendee(params)
        attendee?.save(failOnError: true)
        confOrder.addToAttendees(attendee)

        println "there are ${confOrder?.attendees?.size()} attendees. They are ${confOrder.attendees}"
        render template: 'attendeeList', model: [confOrder: confOrder, attendees: confOrder.attendees, amount: formatter.format(confOrder.attendees*.ticketType*.price.sum()), number: session.confOrder.attendees?.size()]
        return false
    }

    @Transactional
    def selectSeminars(){
        def orderInstance = ConfOrder.get(params.id)
        def attendees = orderInstance.attendees
        [attendees: attendees]
    }
    
    @Transactional
    def saveSeminarSelections() {
        def orderInstance = ConfOrder.get(params.orderId)
        def attendee = Attendee.get(params.attendeeId)
        attendee.seminar1 = params.seminar1
        attendee.seminar2 = params.seminar2
        attendee.seminar3 = params.seminar3
        attendee.seminar4 = params.seminar4
        attendee.save(failOnError: true)
        redirect(action:'selectSeminars', params:[id: orderInstance.id])
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
