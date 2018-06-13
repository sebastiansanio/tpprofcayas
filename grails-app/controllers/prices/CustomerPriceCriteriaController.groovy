package prices

import org.springframework.dao.DataIntegrityViolationException

/**
 * CustomerPriceCriteriaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class CustomerPriceCriteriaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [customerPriceCriteriaInstanceList: CustomerPriceCriteria.list(params), customerPriceCriteriaInstanceTotal: CustomerPriceCriteria.count()]
    }

    def create() {
        [customerPriceCriteriaInstance: new CustomerPriceCriteria(params)]
    }

    def save() {
        def customerPriceCriteriaInstance = new CustomerPriceCriteria(params)
        if (!customerPriceCriteriaInstance.save(flush: true)) {
            render(view: "create", model: [customerPriceCriteriaInstance: customerPriceCriteriaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'customerPriceCriteria.label', default: 'CustomerPriceCriteria'), customerPriceCriteriaInstance.id])
        redirect(action: "show", id: customerPriceCriteriaInstance.id)
    }

    def show() {
        def customerPriceCriteriaInstance = CustomerPriceCriteria.get(params.id)
        if (!customerPriceCriteriaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'customerPriceCriteria.label', default: 'CustomerPriceCriteria'), params.id])
            redirect(action: "list")
            return
        }

        [customerPriceCriteriaInstance: customerPriceCriteriaInstance]
    }

    def edit() {
        def customerPriceCriteriaInstance = CustomerPriceCriteria.get(params.id)
        if (!customerPriceCriteriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customerPriceCriteria.label', default: 'CustomerPriceCriteria'), params.id])
            redirect(action: "list")
            return
        }

        [customerPriceCriteriaInstance: customerPriceCriteriaInstance]
    }

    def update() {
        def customerPriceCriteriaInstance = CustomerPriceCriteria.get(params.id)
        if (!customerPriceCriteriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customerPriceCriteria.label', default: 'CustomerPriceCriteria'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (customerPriceCriteriaInstance.version > version) {
                customerPriceCriteriaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'customerPriceCriteria.label', default: 'CustomerPriceCriteria')] as Object[],
                          "Another user has updated this CustomerPriceCriteria while you were editing")
                render(view: "edit", model: [customerPriceCriteriaInstance: customerPriceCriteriaInstance])
                return
            }
        }

        customerPriceCriteriaInstance.properties = params

        if (!customerPriceCriteriaInstance.save(flush: true)) {
            render(view: "edit", model: [customerPriceCriteriaInstance: customerPriceCriteriaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'customerPriceCriteria.label', default: 'CustomerPriceCriteria'), customerPriceCriteriaInstance.id])
        redirect(action: "show", id: customerPriceCriteriaInstance.id)
    }

    def delete() {
        def customerPriceCriteriaInstance = CustomerPriceCriteria.get(params.id)
        if (!customerPriceCriteriaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'customerPriceCriteria.label', default: 'CustomerPriceCriteria'), params.id])
            redirect(action: "list")
            return
        }

        try {
            customerPriceCriteriaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'customerPriceCriteria.label', default: 'CustomerPriceCriteria'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'customerPriceCriteria.label', default: 'CustomerPriceCriteria'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
