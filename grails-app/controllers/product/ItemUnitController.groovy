package product

import org.springframework.dao.DataIntegrityViolationException

/**
 * ItemUnitController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ItemUnitController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [itemUnitInstanceList: ItemUnit.list(params), itemUnitInstanceTotal: ItemUnit.count()]
    }

    def create() {
        [itemUnitInstance: new ItemUnit(params)]
    }

    def save() {
        def itemUnitInstance = new ItemUnit(params)
        if (!itemUnitInstance.save(flush: true)) {
            render(view: "create", model: [itemUnitInstance: itemUnitInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'itemUnit.label', default: 'ItemUnit'), itemUnitInstance.id])
        redirect(action: "show", id: itemUnitInstance.id)
    }

    def show() {
        def itemUnitInstance = ItemUnit.get(params.id)
        if (!itemUnitInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemUnit.label', default: 'ItemUnit'), params.id])
            redirect(action: "list")
            return
        }

        [itemUnitInstance: itemUnitInstance]
    }

    def edit() {
        def itemUnitInstance = ItemUnit.get(params.id)
        if (!itemUnitInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemUnit.label', default: 'ItemUnit'), params.id])
            redirect(action: "list")
            return
        }

        [itemUnitInstance: itemUnitInstance]
    }

    def update() {
        def itemUnitInstance = ItemUnit.get(params.id)
        if (!itemUnitInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemUnit.label', default: 'ItemUnit'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (itemUnitInstance.version > version) {
                itemUnitInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'itemUnit.label', default: 'ItemUnit')] as Object[],
                          "Another user has updated this ItemUnit while you were editing")
                render(view: "edit", model: [itemUnitInstance: itemUnitInstance])
                return
            }
        }

        itemUnitInstance.properties = params

        if (!itemUnitInstance.save(flush: true)) {
            render(view: "edit", model: [itemUnitInstance: itemUnitInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'itemUnit.label', default: 'ItemUnit'), itemUnitInstance.id])
        redirect(action: "show", id: itemUnitInstance.id)
    }

    def delete() {
        def itemUnitInstance = ItemUnit.get(params.id)
        if (!itemUnitInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemUnit.label', default: 'ItemUnit'), params.id])
            redirect(action: "list")
            return
        }

        try {
            itemUnitInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'itemUnit.label', default: 'ItemUnit'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'itemUnit.label', default: 'ItemUnit'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
