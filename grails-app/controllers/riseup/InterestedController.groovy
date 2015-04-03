package riseup



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class InterestedController {

    static allowedMethods = [ajaxSave: "POST", save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Interested.list(params), model:[interestedInstanceCount: Interested.count()]
    }

    def show(Interested interestedInstance) {
        respond interestedInstance
    }

    def create() {
        respond new Interested(params)
    }

    def ajaxSave() {
        println "the params are: ... $params"
        render template: "thanks"
        return false
    }

    @Transactional
    def save(Interested interestedInstance) {
        if (interestedInstance == null) {
            notFound()
            return
        }

        if (interestedInstance.hasErrors()) {
            respond interestedInstance.errors, view:'create'
            return
        }

        interestedInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'interested.label', default: 'Interested'), interestedInstance.id])
                redirect interestedInstance
            }
            '*' { respond interestedInstance, [status: CREATED] }
        }
    }

    def edit(Interested interestedInstance) {
        respond interestedInstance
    }

    @Transactional
    def update(Interested interestedInstance) {
        if (interestedInstance == null) {
            notFound()
            return
        }

        if (interestedInstance.hasErrors()) {
            respond interestedInstance.errors, view:'edit'
            return
        }

        interestedInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Interested.label', default: 'Interested'), interestedInstance.id])
                redirect interestedInstance
            }
            '*'{ respond interestedInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Interested interestedInstance) {

        if (interestedInstance == null) {
            notFound()
            return
        }

        interestedInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Interested.label', default: 'Interested'), interestedInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'interested.label', default: 'Interested'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
