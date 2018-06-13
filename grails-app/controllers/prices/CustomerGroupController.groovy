package prices

import org.springframework.dao.DataIntegrityViolationException

/**
 * CustomerGroupController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class CustomerGroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [customerGroupInstanceList: CustomerGroup.list(params), customerGroupInstanceTotal: CustomerGroup.count()]
    }

    def create() {
        [customerGroupInstance: new CustomerGroup(params)]
    }

    def save() {
        def customerGroupInstance = new CustomerGroup(params)
        if (!customerGroupInstance.save(flush: true)) {
            render(view: "create", model: [customerGroupInstance: customerGroupInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'customerGroup.label', default: 'CustomerGroup'), customerGroupInstance.id])
        redirect(action: "show", id: customerGroupInstance.id)
    }

    def show() {
        def customerGroupInstance = CustomerGroup.get(params.id)
        if (!customerGroupInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'customerGroup.label', default: 'CustomerGroup'), params.id])
            redirect(action: "list")
            return
        }

        [customerGroupInstance: customerGroupInstance]
    }

    def edit() {
        def customerGroupInstance = CustomerGroup.get(params.id)
        if (!customerGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customerGroup.label', default: 'CustomerGroup'), params.id])
            redirect(action: "list")
            return
        }

        [customerGroupInstance: customerGroupInstance]
    }

    def update() {
        def customerGroupInstance = CustomerGroup.get(params.id)
        if (!customerGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customerGroup.label', default: 'CustomerGroup'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (customerGroupInstance.version > version) {
                customerGroupInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'customerGroup.label', default: 'CustomerGroup')] as Object[],
                          "Another user has updated this CustomerGroup while you were editing")
                render(view: "edit", model: [customerGroupInstance: customerGroupInstance])
                return
            }
        }

        customerGroupInstance.properties = params

        if (!customerGroupInstance.save(flush: true)) {
            render(view: "edit", model: [customerGroupInstance: customerGroupInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'customerGroup.label', default: 'CustomerGroup'), customerGroupInstance.id])
        redirect(action: "show", id: customerGroupInstance.id)
    }

    def delete() {
        def customerGroupInstance = CustomerGroup.get(params.id)
        if (!customerGroupInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'customerGroup.label', default: 'CustomerGroup'), params.id])
            redirect(action: "list")
            return
        }

        try {
            customerGroupInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'customerGroup.label', default: 'CustomerGroup'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'customerGroup.label', default: 'CustomerGroup'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
