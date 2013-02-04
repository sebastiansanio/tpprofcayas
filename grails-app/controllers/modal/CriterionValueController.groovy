package modal

import org.springframework.dao.DataIntegrityViolationException

/**
 * CriterionValueController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class CriterionValueController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [criterionValueInstanceList: CriterionValue.list(params), criterionValueInstanceTotal: CriterionValue.count()]
    }

    def create() {
        [criterionValueInstance: new CriterionValue(params)]
    }

    def save() {
        def criterionValueInstance = new CriterionValue(params)
        if (!criterionValueInstance.save(flush: true)) {
            render(view: "create", model: [criterionValueInstance: criterionValueInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'criterionValue.label', default: 'CriterionValue'), criterionValueInstance.id])
        redirect(action: "show", id: criterionValueInstance.id)
    }

    def show() {
        def criterionValueInstance = CriterionValue.get(params.id)
        if (!criterionValueInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'criterionValue.label', default: 'CriterionValue'), params.id])
            redirect(action: "list")
            return
        }

        [criterionValueInstance: criterionValueInstance]
    }

    def edit() {
        def criterionValueInstance = CriterionValue.get(params.id)
        if (!criterionValueInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'criterionValue.label', default: 'CriterionValue'), params.id])
            redirect(action: "list")
            return
        }

        [criterionValueInstance: criterionValueInstance]
    }

    def update() {
        def criterionValueInstance = CriterionValue.get(params.id)
        if (!criterionValueInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'criterionValue.label', default: 'CriterionValue'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (criterionValueInstance.version > version) {
                criterionValueInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'criterionValue.label', default: 'CriterionValue')] as Object[],
                          "Another user has updated this CriterionValue while you were editing")
                render(view: "edit", model: [criterionValueInstance: criterionValueInstance])
                return
            }
        }

        criterionValueInstance.properties = params

        if (!criterionValueInstance.save(flush: true)) {
            render(view: "edit", model: [criterionValueInstance: criterionValueInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'criterionValue.label', default: 'CriterionValue'), criterionValueInstance.id])
        redirect(action: "show", id: criterionValueInstance.id)
    }

    def delete() {
        def criterionValueInstance = CriterionValue.get(params.id)
        if (!criterionValueInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'criterionValue.label', default: 'CriterionValue'), params.id])
            redirect(action: "list")
            return
        }

        try {
            criterionValueInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'criterionValue.label', default: 'CriterionValue'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'criterionValue.label', default: 'CriterionValue'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
