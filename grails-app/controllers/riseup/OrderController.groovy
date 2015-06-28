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
        render template: 'attendeeList', model: [attendees: confOrder.attendees, amount: formatter.format(confOrder.attendees*.ticketType*.price.sum()), number: session.confOrder.attendees?.size()]
        return false
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
