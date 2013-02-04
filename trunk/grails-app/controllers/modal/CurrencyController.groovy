package modal

import org.springframework.dao.DataIntegrityViolationException

/**
 * CurrencyController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class CurrencyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [currencyInstanceList: Currency.list(params), currencyInstanceTotal: Currency.count()]
    }

    def create() {
        [currencyInstance: new Currency(params)]
    }

    def save() {
        def currencyInstance = new Currency(params)
        if (!currencyInstance.save(flush: true)) {
            render(view: "create", model: [currencyInstance: currencyInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'currency.label', default: 'Currency'), currencyInstance.id])
        redirect(action: "show", id: currencyInstance.id)
    }

    def show() {
        def currencyInstance = Currency.get(params.id)
        if (!currencyInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'currency.label', default: 'Currency'), params.id])
            redirect(action: "list")
            return
        }

        [currencyInstance: currencyInstance]
    }

    def edit() {
        def currencyInstance = Currency.get(params.id)
        if (!currencyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'currency.label', default: 'Currency'), params.id])
            redirect(action: "list")
            return
        }

        [currencyInstance: currencyInstance]
    }

    def update() {
        def currencyInstance = Currency.get(params.id)
        if (!currencyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'currency.label', default: 'Currency'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (currencyInstance.version > version) {
                currencyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'currency.label', default: 'Currency')] as Object[],
                          "Another user has updated this Currency while you were editing")
                render(view: "edit", model: [currencyInstance: currencyInstance])
                return
            }
        }

        currencyInstance.properties = params

        if (!currencyInstance.save(flush: true)) {
            render(view: "edit", model: [currencyInstance: currencyInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'currency.label', default: 'Currency'), currencyInstance.id])
        redirect(action: "show", id: currencyInstance.id)
    }

    def delete() {
        def currencyInstance = Currency.get(params.id)
        if (!currencyInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'currency.label', default: 'Currency'), params.id])
            redirect(action: "list")
            return
        }

        try {
            currencyInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'currency.label', default: 'Currency'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'currency.label', default: 'Currency'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
