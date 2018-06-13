package prices

import org.springframework.dao.DataIntegrityViolationException

/**
 * PriceVariableDateController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class PriceVariableDateController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [priceVariableDateInstanceList: PriceVariableDate.list(params), priceVariableDateInstanceTotal: PriceVariableDate.count()]
    }

    def create() {
        [priceVariableDateInstance: new PriceVariableDate(params)]
    }

    def save() {
        def priceVariableDateInstance = new PriceVariableDate(params)
        if (!priceVariableDateInstance.save(flush: true)) {
            render(view: "create", model: [priceVariableDateInstance: priceVariableDateInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'priceVariableDate.label', default: 'PriceVariableDate'), priceVariableDateInstance.id])
        redirect(action: "show", id: priceVariableDateInstance.id)
    }

    def show() {
        def priceVariableDateInstance = PriceVariableDate.get(params.id)
        if (!priceVariableDateInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceVariableDate.label', default: 'PriceVariableDate'), params.id])
            redirect(action: "list")
            return
        }

        [priceVariableDateInstance: priceVariableDateInstance]
    }

    def edit() {
        def priceVariableDateInstance = PriceVariableDate.get(params.id)
        if (!priceVariableDateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceVariableDate.label', default: 'PriceVariableDate'), params.id])
            redirect(action: "list")
            return
        }

        [priceVariableDateInstance: priceVariableDateInstance]
    }

    def update() {
        def priceVariableDateInstance = PriceVariableDate.get(params.id)
        if (!priceVariableDateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceVariableDate.label', default: 'PriceVariableDate'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (priceVariableDateInstance.version > version) {
                priceVariableDateInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'priceVariableDate.label', default: 'PriceVariableDate')] as Object[],
                          "Another user has updated this PriceVariableDate while you were editing")
                render(view: "edit", model: [priceVariableDateInstance: priceVariableDateInstance])
                return
            }
        }

        priceVariableDateInstance.properties = params

        if (!priceVariableDateInstance.save(flush: true)) {
            render(view: "edit", model: [priceVariableDateInstance: priceVariableDateInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'priceVariableDate.label', default: 'PriceVariableDate'), priceVariableDateInstance.id])
        redirect(action: "show", id: priceVariableDateInstance.id)
    }

    def delete() {
        def priceVariableDateInstance = PriceVariableDate.get(params.id)
        if (!priceVariableDateInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceVariableDate.label', default: 'PriceVariableDate'), params.id])
            redirect(action: "list")
            return
        }

        try {
            priceVariableDateInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'priceVariableDate.label', default: 'PriceVariableDate'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'priceVariableDate.label', default: 'PriceVariableDate'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
