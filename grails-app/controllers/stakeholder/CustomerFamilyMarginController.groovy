package stakeholder

import org.springframework.dao.DataIntegrityViolationException

/**
 * CustomerFamilyMarginController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class CustomerFamilyMarginController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [customerFamilyMarginInstanceList: CustomerFamilyMargin.list(params), customerFamilyMarginInstanceTotal: CustomerFamilyMargin.count()]
    }

    def create() {
        [customerFamilyMarginInstance: new CustomerFamilyMargin(params)]
    }

    def save() {
        def customerFamilyMarginInstance = new CustomerFamilyMargin(params)
        if (!customerFamilyMarginInstance.save(flush: true)) {
            render(view: "create", model: [customerFamilyMarginInstance: customerFamilyMarginInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'customerFamilyMargin.label', default: 'CustomerFamilyMargin'), customerFamilyMarginInstance.id])
        redirect(action: "show", id: customerFamilyMarginInstance.id)
    }

    def show() {
        def customerFamilyMarginInstance = CustomerFamilyMargin.get(params.id)
        if (!customerFamilyMarginInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'customerFamilyMargin.label', default: 'CustomerFamilyMargin'), params.id])
            redirect(action: "list")
            return
        }

        [customerFamilyMarginInstance: customerFamilyMarginInstance]
    }

    def edit() {
        def customerFamilyMarginInstance = CustomerFamilyMargin.get(params.id)
        if (!customerFamilyMarginInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customerFamilyMargin.label', default: 'CustomerFamilyMargin'), params.id])
            redirect(action: "list")
            return
        }

        [customerFamilyMarginInstance: customerFamilyMarginInstance]
    }

    def update() {
        def customerFamilyMarginInstance = CustomerFamilyMargin.get(params.id)
        if (!customerFamilyMarginInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customerFamilyMargin.label', default: 'CustomerFamilyMargin'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (customerFamilyMarginInstance.version > version) {
                customerFamilyMarginInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'customerFamilyMargin.label', default: 'CustomerFamilyMargin')] as Object[],
                          "Another user has updated this CustomerFamilyMargin while you were editing")
                render(view: "edit", model: [customerFamilyMarginInstance: customerFamilyMarginInstance])
                return
            }
        }

        customerFamilyMarginInstance.properties = params

        if (!customerFamilyMarginInstance.save(flush: true)) {
            render(view: "edit", model: [customerFamilyMarginInstance: customerFamilyMarginInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'customerFamilyMargin.label', default: 'CustomerFamilyMargin'), customerFamilyMarginInstance.id])
        redirect(action: "show", id: customerFamilyMarginInstance.id)
    }

    def delete() {
        def customerFamilyMarginInstance = CustomerFamilyMargin.get(params.id)
        if (!customerFamilyMarginInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'customerFamilyMargin.label', default: 'CustomerFamilyMargin'), params.id])
            redirect(action: "list")
            return
        }

        try {
            customerFamilyMarginInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'customerFamilyMargin.label', default: 'CustomerFamilyMargin'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'customerFamilyMargin.label', default: 'CustomerFamilyMargin'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
