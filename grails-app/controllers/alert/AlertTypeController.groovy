package alert

import org.springframework.dao.DataIntegrityViolationException


import org.springframework.transaction.annotation.Transactional


@Transactional
class AlertTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		params.sort = params.sort?: 'description'
        params.max = Math.min(params.max ? params.int('max') : 100, 200)
        [alertTypeInstanceList: AlertType.list(params), alertTypeInstanceTotal: AlertType.count()]
    }

    def create() {
        [alertTypeInstance: new AlertType(params)]
    }

    def save() {
        def alertTypeInstance = new AlertType(params)
        if (!alertTypeInstance.save(flush: true)) {
            render(view: "create", model: [alertTypeInstance: alertTypeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'alertType.label', default: 'AlertType'), alertTypeInstance.id])
        redirect(action: "show", id: alertTypeInstance.id)
    }

    def show() {
        def alertTypeInstance = AlertType.get(params.id)
        if (!alertTypeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'alertType.label', default: 'AlertType'), params.id])
            redirect(action: "list")
            return
        }

        [alertTypeInstance: alertTypeInstance]
    }

    def edit() {
        def alertTypeInstance = AlertType.get(params.id)
        if (!alertTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'alertType.label', default: 'AlertType'), params.id])
            redirect(action: "list")
            return
        }

        [alertTypeInstance: alertTypeInstance]
    }

    def update() {
        def alertTypeInstance = AlertType.get(params.id)
        if (!alertTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'alertType.label', default: 'AlertType'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (alertTypeInstance.version > version) {
                alertTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'alertType.label', default: 'AlertType')] as Object[],
                          "Another user has updated this AlertType while you were editing")
                render(view: "edit", model: [alertTypeInstance: alertTypeInstance])
                return
            }
        }

        alertTypeInstance.properties = params

        if (!alertTypeInstance.save(flush: true)) {
            render(view: "edit", model: [alertTypeInstance: alertTypeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'alertType.label', default: 'AlertType'), alertTypeInstance.id])
        redirect(action: "show", id: alertTypeInstance.id)
    }

    def delete() {
        def alertTypeInstance = AlertType.get(params.id)
        if (!alertTypeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'alertType.label', default: 'AlertType'), params.id])
            redirect(action: "list")
            return
        }

        try {
            alertTypeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'alertType.label', default: 'AlertType'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'alertType.label', default: 'AlertType'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
