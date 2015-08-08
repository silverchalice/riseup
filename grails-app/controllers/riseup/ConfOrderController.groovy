package riseup



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ConfOrderController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConfOrder.list(params), model:[confOrderInstanceCount: ConfOrder.count()]
    }

    def show(ConfOrder confOrderInstance) {
        respond confOrderInstance
    }

    def create() {
        respond new ConfOrder(params)
    }

    @Transactional
    def save(ConfOrder confOrderInstance) {
        if (confOrderInstance == null) {
            notFound()
            return
        }

        if (confOrderInstance.hasErrors()) {
            respond confOrderInstance.errors, view:'create'
            return
        }

        confOrderInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'confOrder.label', default: 'ConfOrder'), confOrderInstance.id])
                redirect confOrderInstance
            }
            '*' { respond confOrderInstance, [status: CREATED] }
        }
    }

    def edit(ConfOrder confOrderInstance) {
        respond confOrderInstance
    }

    @Transactional
    def update(ConfOrder confOrderInstance) {
        if (confOrderInstance == null) {
            notFound()
            return
        }

        if (confOrderInstance.hasErrors()) {
            respond confOrderInstance.errors, view:'edit'
            return
        }

        confOrderInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ConfOrder.label', default: 'ConfOrder'), confOrderInstance.id])
                redirect confOrderInstance
            }
            '*'{ respond confOrderInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ConfOrder confOrderInstance) {

        if (confOrderInstance == null) {
            notFound()
            return
        }

        confOrderInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ConfOrder.label', default: 'ConfOrder'), confOrderInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'confOrder.label', default: 'ConfOrder'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
