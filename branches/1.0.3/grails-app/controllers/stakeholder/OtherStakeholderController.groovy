package stakeholder

import org.springframework.dao.DataIntegrityViolationException


import org.springframework.transaction.annotation.Transactional


@Transactional
class OtherStakeholderController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [otherStakeholderInstanceList: OtherStakeholder.list(params), otherStakeholderInstanceTotal: OtherStakeholder.count()]
    }

    def create() {
        [otherStakeholderInstance: new OtherStakeholder(params)]
    }

    def save() {
        def otherStakeholderInstance = new OtherStakeholder(params)
        if (!otherStakeholderInstance.save(flush: true)) {
            render(view: "create", model: [otherStakeholderInstance: otherStakeholderInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'otherStakeholder.label', default: 'OtherStakeholder'), otherStakeholderInstance.id])
        redirect(action: "show", id: otherStakeholderInstance.id)
    }

    def show() {
        def otherStakeholderInstance = OtherStakeholder.get(params.id)
        if (!otherStakeholderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'otherStakeholder.label', default: 'OtherStakeholder'), params.id])
            redirect(action: "list")
            return
        }

        [otherStakeholderInstance: otherStakeholderInstance]
    }

    def edit() {
        def otherStakeholderInstance = OtherStakeholder.get(params.id)
        if (!otherStakeholderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'otherStakeholder.label', default: 'OtherStakeholder'), params.id])
            redirect(action: "list")
            return
        }

        [otherStakeholderInstance: otherStakeholderInstance]
    }

    def update() {
        def otherStakeholderInstance = OtherStakeholder.get(params.id)
        if (!otherStakeholderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'otherStakeholder.label', default: 'OtherStakeholder'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (otherStakeholderInstance.version > version) {
                otherStakeholderInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'otherStakeholder.label', default: 'OtherStakeholder')] as Object[],
                          "Another user has updated this OtherStakeholder while you were editing")
                render(view: "edit", model: [otherStakeholderInstance: otherStakeholderInstance])
                return
            }
        }

        otherStakeholderInstance.properties = params

        if (!otherStakeholderInstance.save(flush: true)) {
            render(view: "edit", model: [otherStakeholderInstance: otherStakeholderInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'otherStakeholder.label', default: 'OtherStakeholder'), otherStakeholderInstance.id])
        redirect(action: "show", id: otherStakeholderInstance.id)
    }

    def delete() {
        def otherStakeholderInstance = OtherStakeholder.get(params.id)
        if (!otherStakeholderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'otherStakeholder.label', default: 'OtherStakeholder'), params.id])
            redirect(action: "list")
            return
        }

        try {
            otherStakeholderInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'otherStakeholder.label', default: 'OtherStakeholder'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'otherStakeholder.label', default: 'OtherStakeholder'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
