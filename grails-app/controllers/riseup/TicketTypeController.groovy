package riseup



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TicketTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TicketType.list(params), model:[ticketTypeInstanceCount: TicketType.count()]
    }

    def show(TicketType ticketTypeInstance) {
        respond ticketTypeInstance
    }

    def create() {
        respond new TicketType(params)
    }

    @Transactional
    def save(TicketType ticketTypeInstance) {
        if (ticketTypeInstance == null) {
            notFound()
            return
        }

        if (ticketTypeInstance.hasErrors()) {
            respond ticketTypeInstance.errors, view:'create'
            return
        }

        ticketTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ticketType.label', default: 'TicketType'), ticketTypeInstance.id])
                redirect ticketTypeInstance
            }
            '*' { respond ticketTypeInstance, [status: CREATED] }
        }
    }

    def edit(TicketType ticketTypeInstance) {
        respond ticketTypeInstance
    }

    @Transactional
    def update(TicketType ticketTypeInstance) {
        if (ticketTypeInstance == null) {
            notFound()
            return
        }

        if (ticketTypeInstance.hasErrors()) {
            respond ticketTypeInstance.errors, view:'edit'
            return
        }

        ticketTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TicketType.label', default: 'TicketType'), ticketTypeInstance.id])
                redirect ticketTypeInstance
            }
            '*'{ respond ticketTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TicketType ticketTypeInstance) {

        if (ticketTypeInstance == null) {
            notFound()
            return
        }

        ticketTypeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TicketType.label', default: 'TicketType'), ticketTypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticketType.label', default: 'TicketType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
