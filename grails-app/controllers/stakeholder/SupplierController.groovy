package stakeholder

import org.springframework.dao.DataIntegrityViolationException

/**
 * SupplierController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class SupplierController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [supplierInstanceList: Supplier.list(params), supplierInstanceTotal: Supplier.count()]
    }

    def create() {
        [supplierInstance: new Supplier(params)]
    }

    def save() {
        def supplierInstance = new Supplier(params)
        if (!supplierInstance.save(flush: true)) {
            render(view: "create", model: [supplierInstance: supplierInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'supplier.label', default: 'Supplier'), supplierInstance.id])
        redirect(action: "show", id: supplierInstance.id)
    }

    def show() {
        def supplierInstance = Supplier.get(params.id)
        if (!supplierInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
            redirect(action: "list")
            return
        }

        [supplierInstance: supplierInstance]
    }

    def edit() {
        def supplierInstance = Supplier.get(params.id)
        if (!supplierInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
            redirect(action: "list")
            return
        }

        [supplierInstance: supplierInstance]
    }

    def update() {
        def supplierInstance = Supplier.get(params.id)
        if (!supplierInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (supplierInstance.version > version) {
                supplierInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'supplier.label', default: 'Supplier')] as Object[],
                          "Another user has updated this Supplier while you were editing")
                render(view: "edit", model: [supplierInstance: supplierInstance])
                return
            }
        }

        supplierInstance.properties = params

        if (!supplierInstance.save(flush: true)) {
            render(view: "edit", model: [supplierInstance: supplierInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'supplier.label', default: 'Supplier'), supplierInstance.id])
        redirect(action: "show", id: supplierInstance.id)
    }

    def delete() {
        def supplierInstance = Supplier.get(params.id)
        if (!supplierInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
            redirect(action: "list")
            return
        }

        try {
            supplierInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
