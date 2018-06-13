package prices

import org.springframework.dao.DataIntegrityViolationException

/**
 * PriceVariableController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class PriceVariableController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [priceVariableInstanceList: PriceVariable.list(params), priceVariableInstanceTotal: PriceVariable.count()]
    }

    def create() {
        [priceVariableInstance: new PriceVariable(params)]
    }

    def save() {
        def priceVariableInstance = new PriceVariable(params)
        if (!priceVariableInstance.save(flush: true)) {
            render(view: "create", model: [priceVariableInstance: priceVariableInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'priceVariable.label', default: 'PriceVariable'), priceVariableInstance.id])
        redirect(action: "show", id: priceVariableInstance.id)
    }

    def show() {
        def priceVariableInstance = PriceVariable.get(params.id)
        if (!priceVariableInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceVariable.label', default: 'PriceVariable'), params.id])
            redirect(action: "list")
            return
        }

        [priceVariableInstance: priceVariableInstance]
    }

    def edit() {
        def priceVariableInstance = PriceVariable.get(params.id)
        if (!priceVariableInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceVariable.label', default: 'PriceVariable'), params.id])
            redirect(action: "list")
            return
        }

        [priceVariableInstance: priceVariableInstance]
    }

    def update() {
        def priceVariableInstance = PriceVariable.get(params.id)
        if (!priceVariableInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceVariable.label', default: 'PriceVariable'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (priceVariableInstance.version > version) {
                priceVariableInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'priceVariable.label', default: 'PriceVariable')] as Object[],
                          "Another user has updated this PriceVariable while you were editing")
                render(view: "edit", model: [priceVariableInstance: priceVariableInstance])
                return
            }
        }

        priceVariableInstance.properties = params

        if (!priceVariableInstance.save(flush: true)) {
            render(view: "edit", model: [priceVariableInstance: priceVariableInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'priceVariable.label', default: 'PriceVariable'), priceVariableInstance.id])
        redirect(action: "show", id: priceVariableInstance.id)
    }

    def delete() {
        def priceVariableInstance = PriceVariable.get(params.id)
        if (!priceVariableInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceVariable.label', default: 'PriceVariable'), params.id])
            redirect(action: "list")
            return
        }

        try {
            priceVariableInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'priceVariable.label', default: 'PriceVariable'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'priceVariable.label', default: 'PriceVariable'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
