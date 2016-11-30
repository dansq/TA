package ta



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RegisteredController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Registered.list(params), model:[registeredInstanceCount: Registered.count()]
    }

    def show(Registered registeredInstance) {
        respond registeredInstance
    }

    def create() {
        respond new Registered(params)
    }

    @Transactional
    def save(Registered registeredInstance) {
        if (registeredInstance == null) {
            notFound()
            return
        }

        if (registeredInstance.hasErrors()) {
            respond registeredInstance.errors, view:'create'
            return
        }

        registeredInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'registered.label', default: 'Registered'), registeredInstance.id])
                redirect registeredInstance
            }
            '*' { respond registeredInstance, [status: CREATED] }
        }
    }

    def edit(Registered registeredInstance) {
        respond registeredInstance
    }

    @Transactional
    def update(Registered registeredInstance) {
        if (registeredInstance == null) {
            notFound()
            return
        }

        if (registeredInstance.hasErrors()) {
            respond registeredInstance.errors, view:'edit'
            return
        }

        registeredInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Registered.label', default: 'Registered'), registeredInstance.id])
                redirect registeredInstance
            }
            '*'{ respond registeredInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Registered registeredInstance) {

        if (registeredInstance == null) {
            notFound()
            return
        }

        registeredInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Registered.label', default: 'Registered'), registeredInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'registered.label', default: 'Registered'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
