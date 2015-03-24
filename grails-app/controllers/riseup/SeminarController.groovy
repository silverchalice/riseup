package riseup



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SeminarController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Seminar.list(params), model:[seminarInstanceCount: Seminar.count()]
    }

    def show(Seminar seminarInstance) {
        respond seminarInstance
    }

    def create() {
        respond new Seminar(params)
    }

    @Transactional
    def save(Seminar seminarInstance) {
        if (seminarInstance == null) {
            notFound()
            return
        }

        if (seminarInstance.hasErrors()) {
            respond seminarInstance.errors, view:'create'
            return
        }

        seminarInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'seminar.label', default: 'Seminar'), seminarInstance.id])
                redirect seminarInstance
            }
            '*' { respond seminarInstance, [status: CREATED] }
        }
    }

    def edit(Seminar seminarInstance) {
        respond seminarInstance
    }

    @Transactional
    def update(Seminar seminarInstance) {
        if (seminarInstance == null) {
            notFound()
            return
        }

        if (seminarInstance.hasErrors()) {
            respond seminarInstance.errors, view:'edit'
            return
        }

        seminarInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Seminar.label', default: 'Seminar'), seminarInstance.id])
                redirect seminarInstance
            }
            '*'{ respond seminarInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Seminar seminarInstance) {

        if (seminarInstance == null) {
            notFound()
            return
        }

        seminarInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Seminar.label', default: 'Seminar'), seminarInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'seminar.label', default: 'Seminar'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
