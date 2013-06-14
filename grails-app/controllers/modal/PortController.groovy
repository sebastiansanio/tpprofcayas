package modal

import org.springframework.dao.DataIntegrityViolationException


import org.springframework.transaction.annotation.Transactional


@Transactional
class PortController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.sort = params.sort?: 'name'
        params.max = Math.min(params.max ? params.int('max') : 100, 200)
        [portInstanceList: Port.list(params), portInstanceTotal: Port.count()]
    }

    def create() {
        [portInstance: new Port(params)]
    }

    def save() {
        def portInstance = new Port(params)
        if (!portInstance.save(flush: true)) {
            render(view: "create", model: [portInstance: portInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'port.label', default: 'Port'), portInstance.id])
        redirect(action: "show", id: portInstance.id)
    }

    def show() {
        def portInstance = Port.get(params.id)
        if (!portInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'port.label', default: 'Port'), params.id])
            redirect(action: "list")
            return
        }

        [portInstance: portInstance]
    }

    def edit() {
        def portInstance = Port.get(params.id)
        if (!portInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'port.label', default: 'Port'), params.id])
            redirect(action: "list")
            return
        }

        [portInstance: portInstance]
    }

    def update() {
        def portInstance = Port.get(params.id)
        if (!portInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'port.label', default: 'Port'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (portInstance.version > version) {
                portInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'port.label', default: 'Port')] as Object[],
                          "Another user has updated this Port while you were editing")
                render(view: "edit", model: [portInstance: portInstance])
                return
            }
        }

        portInstance.properties = params

        if (!portInstance.save(flush: true)) {
            render(view: "edit", model: [portInstance: portInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'port.label', default: 'Port'), portInstance.id])
        redirect(action: "show", id: portInstance.id)
    }

    def delete() {
        def portInstance = Port.get(params.id)
        if (!portInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'port.label', default: 'Port'), params.id])
            redirect(action: "list")
            return
        }

        try {
            portInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'port.label', default: 'Port'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'port.label', default: 'Port'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
