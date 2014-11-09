package modal

import org.springframework.dao.DataIntegrityViolationException


import org.springframework.transaction.annotation.Transactional
import stakeholder.Stakeholder


@Transactional
class AvailableLocaleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.sort = params.sort?: 'country'
        params.max = Math.min(params.max ? params.int('max') : 100, 200)
        [availableLocaleInstanceList: AvailableLocale.list(params), availableLocaleInstanceTotal: AvailableLocale.count()]
    }

    def create() {
        [availableLocaleInstance: new AvailableLocale(params)]
    }

    def save() {
        def availableLocaleInstance = new AvailableLocale(params)
        if (!availableLocaleInstance.save(flush: true)) {
            render(view: "create", model: [availableLocaleInstance: availableLocaleInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'availableLocale.label', default: 'AvailableLocale'), availableLocaleInstance.id])
        redirect(action: "show", id: availableLocaleInstance.id)
    }

    def show() {
        def availableLocaleInstance = AvailableLocale.get(params.id)
        if (!availableLocaleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'availableLocale.label', default: 'AvailableLocale'), params.id])
            redirect(action: "list")
            return
        }

        [availableLocaleInstance: availableLocaleInstance]
    }

    def edit() {
        def availableLocaleInstance = AvailableLocale.get(params.id)
        if (!availableLocaleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'availableLocale.label', default: 'AvailableLocale'), params.id])
            redirect(action: "list")
            return
        }

        [availableLocaleInstance: availableLocaleInstance]
    }

    def update() {
        def availableLocaleInstance = AvailableLocale.get(params.id)
        if (!availableLocaleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'availableLocale.label', default: 'AvailableLocale'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (availableLocaleInstance.version > version) {
                availableLocaleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'availableLocale.label', default: 'AvailableLocale')] as Object[],
                          "Another user has updated this AvailableLocale while you were editing")
                render(view: "edit", model: [availableLocaleInstance: availableLocaleInstance])
                return
            }
        }

        availableLocaleInstance.properties = params

        if (!availableLocaleInstance.save(flush: true)) {
            render(view: "edit", model: [availableLocaleInstance: availableLocaleInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'availableLocale.label', default: 'AvailableLocale'), availableLocaleInstance.id])
        redirect(action: "show", id: availableLocaleInstance.id)
    }

    def delete() {
        def availableLocaleInstance = AvailableLocale.get(params.id)
        if (!availableLocaleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'availableLocale.label', default: 'AvailableLocale'), params.id])
            redirect(action: "list")
            return
        }
		if(Stakeholder.countByDefaultLocale(availableLocaleInstance)>0){
			flash.message = message(code:'default.delete.error.message',args: [message(code: 'availableLocale.label'),message(code: 'stakeholder.label')])
			redirect(action: "show", id: params.id)
			return
		}
		
        try {
            availableLocaleInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'availableLocale.label', default: 'AvailableLocale'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'availableLocale.label', default: 'AvailableLocale'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
