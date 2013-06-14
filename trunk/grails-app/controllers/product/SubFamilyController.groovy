package product

import org.springframework.dao.DataIntegrityViolationException


import org.springframework.transaction.annotation.Transactional


@Transactional
class SubFamilyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		params.sort = params.sort?: 'description'
		params.max = Math.min(params.max ? params.int('max') : 100, 200)
        [subFamilyInstanceList: SubFamily.list(params), subFamilyInstanceTotal: SubFamily.count()]
    }

    def create() {
        [subFamilyInstance: new SubFamily(params)]
    }

    def save() {
        def subFamilyInstance = new SubFamily(params)
        if (!subFamilyInstance.save(flush: true)) {
            render(view: "create", model: [subFamilyInstance: subFamilyInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'subFamily.label', default: 'SubFamily'), subFamilyInstance.id])
        redirect(action: "show", id: subFamilyInstance.id)
    }

    def show() {
        def subFamilyInstance = SubFamily.get(params.id)
        if (!subFamilyInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'subFamily.label', default: 'SubFamily'), params.id])
            redirect(action: "list")
            return
        }

        [subFamilyInstance: subFamilyInstance]
    }

    def edit() {
        def subFamilyInstance = SubFamily.get(params.id)
        if (!subFamilyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subFamily.label', default: 'SubFamily'), params.id])
            redirect(action: "list")
            return
        }

        [subFamilyInstance: subFamilyInstance]
    }

    def update() {
        def subFamilyInstance = SubFamily.get(params.id)
        if (!subFamilyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subFamily.label', default: 'SubFamily'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (subFamilyInstance.version > version) {
                subFamilyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'subFamily.label', default: 'SubFamily')] as Object[],
                          "Another user has updated this SubFamily while you were editing")
                render(view: "edit", model: [subFamilyInstance: subFamilyInstance])
                return
            }
        }

        subFamilyInstance.properties = params

        if (!subFamilyInstance.save(flush: true)) {
            render(view: "edit", model: [subFamilyInstance: subFamilyInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'subFamily.label', default: 'SubFamily'), subFamilyInstance.id])
        redirect(action: "show", id: subFamilyInstance.id)
    }

    def delete() {
        def subFamilyInstance = SubFamily.get(params.id)
        if (!subFamilyInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'subFamily.label', default: 'SubFamily'), params.id])
            redirect(action: "list")
            return
        }

        try {
            subFamilyInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'subFamily.label', default: 'SubFamily'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'subFamily.label', default: 'SubFamily'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
