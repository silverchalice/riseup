package riseup



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
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

    def new_order() {
        respond new ConfOrder(params)
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
