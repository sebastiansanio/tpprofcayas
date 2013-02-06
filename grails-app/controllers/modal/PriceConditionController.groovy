package modal

import org.springframework.dao.DataIntegrityViolationException

/**
 * PriceConditionController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class PriceConditionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [priceConditionInstanceList: PriceCondition.list(params), priceConditionInstanceTotal: PriceCondition.count()]
    }

    def create() {
        [priceConditionInstance: new PriceCondition(params)]
    }

    def save() {
        def priceConditionInstance = new PriceCondition(params)
        if (!priceConditionInstance.save(flush: true)) {
            render(view: "create", model: [priceConditionInstance: priceConditionInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'priceCondition.label', default: 'PriceCondition'), priceConditionInstance.id])
        redirect(action: "show", id: priceConditionInstance.id)
    }

    def show() {
        def priceConditionInstance = PriceCondition.get(params.id)
        if (!priceConditionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceCondition.label', default: 'PriceCondition'), params.id])
            redirect(action: "list")
            return
        }

        [priceConditionInstance: priceConditionInstance]
    }

    def edit() {
        def priceConditionInstance = PriceCondition.get(params.id)
        if (!priceConditionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceCondition.label', default: 'PriceCondition'), params.id])
            redirect(action: "list")
            return
        }

        [priceConditionInstance: priceConditionInstance]
    }

    def update() {
        def priceConditionInstance = PriceCondition.get(params.id)
        if (!priceConditionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceCondition.label', default: 'PriceCondition'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (priceConditionInstance.version > version) {
                priceConditionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'priceCondition.label', default: 'PriceCondition')] as Object[],
                          "Another user has updated this PriceCondition while you were editing")
                render(view: "edit", model: [priceConditionInstance: priceConditionInstance])
                return
            }
        }

        priceConditionInstance.properties = params

        if (!priceConditionInstance.save(flush: true)) {
            render(view: "edit", model: [priceConditionInstance: priceConditionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'priceCondition.label', default: 'PriceCondition'), priceConditionInstance.id])
        redirect(action: "show", id: priceConditionInstance.id)
    }

    def delete() {
        def priceConditionInstance = PriceCondition.get(params.id)
        if (!priceConditionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceCondition.label', default: 'PriceCondition'), params.id])
            redirect(action: "list")
            return
        }

        try {
            priceConditionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'priceCondition.label', default: 'PriceCondition'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'priceCondition.label', default: 'PriceCondition'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
