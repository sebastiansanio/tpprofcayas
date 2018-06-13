package prices

import org.springframework.dao.DataIntegrityViolationException

/**
 * SupplierPriceCriteriaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class SupplierPriceCriteriaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [supplierPriceCriteriaInstanceList: SupplierPriceCriteria.list(params), supplierPriceCriteriaInstanceTotal: SupplierPriceCriteria.count()]
    }

    def create() {
        [supplierPriceCriteriaInstance: new SupplierPriceCriteria(params)]
    }

    def save() {
        def supplierPriceCriteriaInstance = new SupplierPriceCriteria(params)
        if (!supplierPriceCriteriaInstance.save(flush: true)) {
            render(view: "create", model: [supplierPriceCriteriaInstance: supplierPriceCriteriaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'supplierPriceCriteria.label', default: 'SupplierPriceCriteria'), supplierPriceCriteriaInstance.id])
        redirect(action: "show", id: supplierPriceCriteriaInstance.id)
    }

    def show() {
        def supplierPriceCriteriaInstance = SupplierPriceCriteria.get(params.id)
        if (!supplierPriceCriteriaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplierPriceCriteria.label', default: 'SupplierPriceCriteria'), params.id])
            redirect(action: "list")
            return
        }

        [supplierPriceCriteriaInstance: supplierPriceCriteriaInstance]
    }

    def edit() {
        def supplierPriceCriteriaInstance = SupplierPriceCriteria.get(params.id)
        if (!supplierPriceCriteriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplierPriceCriteria.label', default: 'SupplierPriceCriteria'), params.id])
            redirect(action: "list")
            return
        }

        [supplierPriceCriteriaInstance: supplierPriceCriteriaInstance]
    }

    def update() {
        def supplierPriceCriteriaInstance = SupplierPriceCriteria.get(params.id)
        if (!supplierPriceCriteriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplierPriceCriteria.label', default: 'SupplierPriceCriteria'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (supplierPriceCriteriaInstance.version > version) {
                supplierPriceCriteriaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'supplierPriceCriteria.label', default: 'SupplierPriceCriteria')] as Object[],
                          "Another user has updated this SupplierPriceCriteria while you were editing")
                render(view: "edit", model: [supplierPriceCriteriaInstance: supplierPriceCriteriaInstance])
                return
            }
        }

        supplierPriceCriteriaInstance.properties = params

        if (!supplierPriceCriteriaInstance.save(flush: true)) {
            render(view: "edit", model: [supplierPriceCriteriaInstance: supplierPriceCriteriaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'supplierPriceCriteria.label', default: 'SupplierPriceCriteria'), supplierPriceCriteriaInstance.id])
        redirect(action: "show", id: supplierPriceCriteriaInstance.id)
    }

    def delete() {
        def supplierPriceCriteriaInstance = SupplierPriceCriteria.get(params.id)
        if (!supplierPriceCriteriaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplierPriceCriteria.label', default: 'SupplierPriceCriteria'), params.id])
            redirect(action: "list")
            return
        }

        try {
            supplierPriceCriteriaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'supplierPriceCriteria.label', default: 'SupplierPriceCriteria'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'supplierPriceCriteria.label', default: 'SupplierPriceCriteria'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
