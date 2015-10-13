package riseup



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AttendeeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Attendee.list(params), model:[attendeeInstanceCount: Attendee.count()]
    }

    def show(Attendee attendeeInstance) {
        respond attendeeInstance
    }

    def create() {
        respond new Attendee(params)
    }

    @Transactional
    def save(Attendee attendeeInstance) {
        if (attendeeInstance == null) {
            notFound()
            return
        }

        if (attendeeInstance.hasErrors()) {
            respond attendeeInstance.errors, view:'create'
            return
        }

        attendeeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'attendee.label', default: 'Attendee'), attendeeInstance.id])
                redirect attendeeInstance
            }
            '*' { respond attendeeInstance, [status: CREATED] }
        }
    }

    def edit(Attendee attendeeInstance) {
        respond attendeeInstance
    }

    @Transactional
    def update(Attendee attendeeInstance) {
        if (attendeeInstance == null) {
            notFound()
            return
        }

        if (attendeeInstance.hasErrors()) {
            respond attendeeInstance.errors, view:'edit'
            return
        }

        attendeeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Attendee.label', default: 'Attendee'), attendeeInstance.id])
                redirect attendeeInstance
            }
            '*'{ respond attendeeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Attendee attendeeInstance) {

        if (attendeeInstance == null) {
            notFound()
            return
        }

        attendeeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Attendee.label', default: 'Attendee'), attendeeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'attendee.label', default: 'Attendee'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
