package stakeholder

import org.springframework.dao.DataIntegrityViolationException

/**
 * CustomsBrokerController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class CustomsBrokerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [customsBrokerInstanceList: CustomsBroker.list(params), customsBrokerInstanceTotal: CustomsBroker.count()]
    }

    def create() {
        [customsBrokerInstance: new CustomsBroker(params)]
    }

    def save() {
        def customsBrokerInstance = new CustomsBroker(params)
        if (!customsBrokerInstance.save(flush: true)) {
            render(view: "create", model: [customsBrokerInstance: customsBrokerInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'customsBroker.label', default: 'CustomsBroker'), customsBrokerInstance.id])
        redirect(action: "show", id: customsBrokerInstance.id)
    }

    def show() {
        def customsBrokerInstance = CustomsBroker.get(params.id)
        if (!customsBrokerInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'customsBroker.label', default: 'CustomsBroker'), params.id])
            redirect(action: "list")
            return
        }

        [customsBrokerInstance: customsBrokerInstance]
    }

    def edit() {
        def customsBrokerInstance = CustomsBroker.get(params.id)
        if (!customsBrokerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customsBroker.label', default: 'CustomsBroker'), params.id])
            redirect(action: "list")
            return
        }

        [customsBrokerInstance: customsBrokerInstance]
    }

    def update() {
        def customsBrokerInstance = CustomsBroker.get(params.id)
        if (!customsBrokerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customsBroker.label', default: 'CustomsBroker'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (customsBrokerInstance.version > version) {
                customsBrokerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'customsBroker.label', default: 'CustomsBroker')] as Object[],
                          "Another user has updated this CustomsBroker while you were editing")
                render(view: "edit", model: [customsBrokerInstance: customsBrokerInstance])
                return
            }
        }

        customsBrokerInstance.properties = params

        if (!customsBrokerInstance.save(flush: true)) {
            render(view: "edit", model: [customsBrokerInstance: customsBrokerInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'customsBroker.label', default: 'CustomsBroker'), customsBrokerInstance.id])
        redirect(action: "show", id: customsBrokerInstance.id)
    }

    def delete() {
        def customsBrokerInstance = CustomsBroker.get(params.id)
        if (!customsBrokerInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'customsBroker.label', default: 'CustomsBroker'), params.id])
            redirect(action: "list")
            return
        }

        try {
            customsBrokerInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'customsBroker.label', default: 'CustomsBroker'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'customsBroker.label', default: 'CustomsBroker'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
