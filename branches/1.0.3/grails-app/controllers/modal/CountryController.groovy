package modal

import org.springframework.dao.DataIntegrityViolationException


import org.springframework.transaction.annotation.Transactional
import stakeholder.Stakeholder


@Transactional
class CountryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.sort = params.sort?: 'name'
        params.max = Math.min(params.max ? params.int('max') : 100, 200)
        [countryInstanceList: Country.list(params), countryInstanceTotal: Country.count()]
    }

    def create() {
        [countryInstance: new Country(params)]
    }

    def save() {
        def countryInstance = new Country(params)
        if (!countryInstance.save(flush: true)) {
            render(view: "create", model: [countryInstance: countryInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'country.label', default: 'Country'), countryInstance.id])
        redirect(action: "show", id: countryInstance.id)
    }

    def show() {
        def countryInstance = Country.get(params.id)
        if (!countryInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), params.id])
            redirect(action: "list")
            return
        }

        [countryInstance: countryInstance]
    }

    def edit() {
        def countryInstance = Country.get(params.id)
        if (!countryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), params.id])
            redirect(action: "list")
            return
        }

        [countryInstance: countryInstance]
    }

    def update() {
        def countryInstance = Country.get(params.id)
        if (!countryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (countryInstance.version > version) {
                countryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'country.label', default: 'Country')] as Object[],
                          "Another user has updated this Country while you were editing")
                render(view: "edit", model: [countryInstance: countryInstance])
                return
            }
        }

        countryInstance.properties = params

        if (!countryInstance.save(flush: true)) {
            render(view: "edit", model: [countryInstance: countryInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'country.label', default: 'Country'), countryInstance.id])
        redirect(action: "show", id: countryInstance.id)
    }

    def delete() {
        def countryInstance = Country.get(params.id)
        if (!countryInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), params.id])
            redirect(action: "list")
            return
        }
		if(Stakeholder.countByCountry(countryInstance)>0){
			flash.message = message(code:'default.delete.error.message',args: [message(code: 'country.label'),message(code: 'stakeholder.label')])
			redirect(action: "show", id: params.id)
			return
		}
		if(countryInstance.ports!=null && countryInstance.ports.size()>0){
			flash.message = message(code:'default.delete.error.message',args: [message(code: 'country.label'),message(code: 'port.label')])
			redirect(action: "show", id: params.id)
			return
		}


        try {
            countryInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'country.label', default: 'Country'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'country.label', default: 'Country'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
