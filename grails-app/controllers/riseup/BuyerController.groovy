package riseup



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BuyerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Buyer.list(params), model:[buyerInstanceCount: Buyer.count()]
    }

    def show(Buyer buyerInstance) {
        respond buyerInstance
    }

    def create() {
        respond new Buyer(params)
    }

    @Transactional
    def save(Buyer buyerInstance) {
        if (buyerInstance == null) {
            notFound()
            return
        }

        if (buyerInstance.hasErrors()) {
            respond buyerInstance.errors, view:'create'
            return
        }

        buyerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'buyer.label', default: 'Buyer'), buyerInstance.id])
                redirect buyerInstance
            }
            '*' { respond buyerInstance, [status: CREATED] }
        }
    }

    def edit(Buyer buyerInstance) {
        respond buyerInstance
    }

    @Transactional
    def update(Buyer buyerInstance) {
        if (buyerInstance == null) {
            notFound()
            return
        }

        if (buyerInstance.hasErrors()) {
            respond buyerInstance.errors, view:'edit'
            return
        }

        buyerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Buyer.label', default: 'Buyer'), buyerInstance.id])
                redirect buyerInstance
            }
            '*'{ respond buyerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Buyer buyerInstance) {

        if (buyerInstance == null) {
            notFound()
            return
        }

        buyerInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Buyer.label', default: 'Buyer'), buyerInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
