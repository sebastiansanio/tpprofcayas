package product

import org.springframework.dao.DataIntegrityViolationException

/**
 * ExtraController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ExtraController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [extraInstanceList: Extra.list(params), extraInstanceTotal: Extra.count()]
    }

    def create() {
        [extraInstance: new Extra(params)]
    }

    def save() {
        def extraInstance = new Extra(params)
        if (!extraInstance.save(flush: true)) {
            render(view: "create", model: [extraInstance: extraInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'extra.label', default: 'Extra'), extraInstance.id])
        redirect(action: "show", id: extraInstance.id)
    }

    def show() {
        def extraInstance = Extra.get(params.id)
        if (!extraInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'extra.label', default: 'Extra'), params.id])
            redirect(action: "list")
            return
        }

        [extraInstance: extraInstance]
    }

    def edit() {
        def extraInstance = Extra.get(params.id)
        if (!extraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'extra.label', default: 'Extra'), params.id])
            redirect(action: "list")
            return
        }

        [extraInstance: extraInstance]
    }

    def update() {
        def extraInstance = Extra.get(params.id)
        if (!extraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'extra.label', default: 'Extra'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (extraInstance.version > version) {
                extraInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'extra.label', default: 'Extra')] as Object[],
                          "Another user has updated this Extra while you were editing")
                render(view: "edit", model: [extraInstance: extraInstance])
                return
            }
        }

        extraInstance.properties = params

        if (!extraInstance.save(flush: true)) {
            render(view: "edit", model: [extraInstance: extraInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'extra.label', default: 'Extra'), extraInstance.id])
        redirect(action: "show", id: extraInstance.id)
    }

    def delete() {
        def extraInstance = Extra.get(params.id)
        if (!extraInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'extra.label', default: 'Extra'), params.id])
            redirect(action: "list")
            return
        }

        try {
            extraInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'extra.label', default: 'Extra'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'extra.label', default: 'Extra'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
