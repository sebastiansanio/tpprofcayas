package alert

import org.springframework.dao.DataIntegrityViolationException



class AlertMessageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.sort = params.sort?: 'message'
        params.max = Math.min(params.max ? params.int('max') : 100, 200)
        [alertMessageInstanceList: AlertMessage.list(params), alertMessageInstanceTotal: AlertMessage.count()]
    }

    def create() {
        [alertMessageInstance: new AlertMessage(params)]
    }

    def save() {
        def alertMessageInstance = new AlertMessage(params)
        if (!alertMessageInstance.save(flush: true)) {
            render(view: "create", model: [alertMessageInstance: alertMessageInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'alertMessage.label', default: 'AlertMessage'), alertMessageInstance.id])
        redirect(action: "show", id: alertMessageInstance.id)
    }

    def show() {
        def alertMessageInstance = AlertMessage.get(params.id)
        if (!alertMessageInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'alertMessage.label', default: 'AlertMessage'), params.id])
            redirect(action: "list")
            return
        }

        [alertMessageInstance: alertMessageInstance]
    }

    def edit() {
        def alertMessageInstance = AlertMessage.get(params.id)
        if (!alertMessageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'alertMessage.label', default: 'AlertMessage'), params.id])
            redirect(action: "list")
            return
        }

        [alertMessageInstance: alertMessageInstance]
    }

    def update() {
        def alertMessageInstance = AlertMessage.get(params.id)
        if (!alertMessageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'alertMessage.label', default: 'AlertMessage'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (alertMessageInstance.version > version) {
                alertMessageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'alertMessage.label', default: 'AlertMessage')] as Object[],
                          "Another user has updated this AlertMessage while you were editing")
                render(view: "edit", model: [alertMessageInstance: alertMessageInstance])
                return
            }
        }

        alertMessageInstance.properties = params

        if (!alertMessageInstance.save(flush: true)) {
            render(view: "edit", model: [alertMessageInstance: alertMessageInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'alertMessage.label', default: 'AlertMessage'), alertMessageInstance.id])
        redirect(action: "show", id: alertMessageInstance.id)
    }

    def delete() {
        def alertMessageInstance = AlertMessage.get(params.id)
        if (!alertMessageInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'alertMessage.label', default: 'AlertMessage'), params.id])
            redirect(action: "list")
            return
        }

        try {
            alertMessageInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'alertMessage.label', default: 'AlertMessage'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'alertMessage.label', default: 'AlertMessage'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
