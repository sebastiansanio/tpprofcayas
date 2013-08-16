package product

import org.springframework.dao.DataIntegrityViolationException

/**
 * ItemStateController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ItemStatusController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [itemStateInstanceList: ItemStatus.list(params), itemStateInstanceTotal: ItemStatus.count()]
    }

    def create() {
        [itemStateInstance: new ItemStatus(params)]
    }

    def save() {
        def itemStateInstance = new ItemStatus(params)
        if (!itemStateInstance.save(flush: true)) {
            render(view: "create", model: [itemStateInstance: itemStateInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'itemState.label', default: 'ItemState'), itemStateInstance.id])
        redirect(action: "show", id: itemStateInstance.id)
    }

    def show() {
        def itemStateInstance = ItemStatus.get(params.id)
        if (!itemStateInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemState.label', default: 'ItemState'), params.id])
            redirect(action: "list")
            return
        }

        [itemStateInstance: itemStateInstance]
    }

    def edit() {
        def itemStateInstance = ItemStatus.get(params.id)
        if (!itemStateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemState.label', default: 'ItemState'), params.id])
            redirect(action: "list")
            return
        }

        [itemStateInstance: itemStateInstance]
    }

    def update() {
        def itemStateInstance = ItemStatus.get(params.id)
        if (!itemStateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemState.label', default: 'ItemState'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (itemStateInstance.version > version) {
                itemStateInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'itemState.label', default: 'ItemState')] as Object[],
                          "Another user has updated this ItemState while you were editing")
                render(view: "edit", model: [itemStateInstance: itemStateInstance])
                return
            }
        }

        itemStateInstance.properties = params

        if (!itemStateInstance.save(flush: true)) {
            render(view: "edit", model: [itemStateInstance: itemStateInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'itemState.label', default: 'ItemState'), itemStateInstance.id])
        redirect(action: "show", id: itemStateInstance.id)
    }

    def delete() {
        def itemStateInstance = ItemStatus.get(params.id)
        if (!itemStateInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemState.label', default: 'ItemState'), params.id])
            redirect(action: "list")
            return
        }

        try {
            itemStateInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'itemState.label', default: 'ItemState'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'itemState.label', default: 'ItemState'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
