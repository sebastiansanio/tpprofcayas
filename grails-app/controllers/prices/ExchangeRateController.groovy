package prices

import org.springframework.dao.DataIntegrityViolationException

/**
 * ExchangeRateController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ExchangeRateController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [exchangeRateInstanceList: ExchangeRate.list(params), exchangeRateInstanceTotal: ExchangeRate.count()]
    }

    def create() {
        [exchangeRateInstance: new ExchangeRate(params)]
    }

    def save() {
        def exchangeRateInstance = new ExchangeRate(params)
        if (!exchangeRateInstance.save(flush: true)) {
            render(view: "create", model: [exchangeRateInstance: exchangeRateInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'exchangeRate.label', default: 'ExchangeRate'), exchangeRateInstance.id])
        redirect(action: "show", id: exchangeRateInstance.id)
    }

    def show() {
        def exchangeRateInstance = ExchangeRate.get(params.id)
        if (!exchangeRateInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'exchangeRate.label', default: 'ExchangeRate'), params.id])
            redirect(action: "list")
            return
        }

        [exchangeRateInstance: exchangeRateInstance]
    }

    def edit() {
        def exchangeRateInstance = ExchangeRate.get(params.id)
        if (!exchangeRateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exchangeRate.label', default: 'ExchangeRate'), params.id])
            redirect(action: "list")
            return
        }

        [exchangeRateInstance: exchangeRateInstance]
    }

    def update() {
        def exchangeRateInstance = ExchangeRate.get(params.id)
        if (!exchangeRateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exchangeRate.label', default: 'ExchangeRate'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (exchangeRateInstance.version > version) {
                exchangeRateInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'exchangeRate.label', default: 'ExchangeRate')] as Object[],
                          "Another user has updated this ExchangeRate while you were editing")
                render(view: "edit", model: [exchangeRateInstance: exchangeRateInstance])
                return
            }
        }

        exchangeRateInstance.properties = params

        if (!exchangeRateInstance.save(flush: true)) {
            render(view: "edit", model: [exchangeRateInstance: exchangeRateInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'exchangeRate.label', default: 'ExchangeRate'), exchangeRateInstance.id])
        redirect(action: "show", id: exchangeRateInstance.id)
    }

    def delete() {
        def exchangeRateInstance = ExchangeRate.get(params.id)
        if (!exchangeRateInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'exchangeRate.label', default: 'ExchangeRate'), params.id])
            redirect(action: "list")
            return
        }

        try {
            exchangeRateInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'exchangeRate.label', default: 'ExchangeRate'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'exchangeRate.label', default: 'ExchangeRate'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
