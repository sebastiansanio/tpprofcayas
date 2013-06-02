package modal

import org.springframework.dao.DataIntegrityViolationException



class TypeOfFreightController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		params.sort = params.sort?: 'name'
		params.max = Math.min(params.max ? params.int('max') : 100, 200)
        [typeOfFreightInstanceList: TypeOfFreight.list(params), typeOfFreightInstanceTotal: TypeOfFreight.count()]
    }

    def create() {
        [typeOfFreightInstance: new TypeOfFreight(params)]
    }

    def save() {
        def typeOfFreightInstance = new TypeOfFreight(params)
        if (!typeOfFreightInstance.save(flush: true)) {
            render(view: "create", model: [typeOfFreightInstance: typeOfFreightInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'typeOfFreight.label', default: 'TypeOfFreight'), typeOfFreightInstance.id])
        redirect(action: "show", id: typeOfFreightInstance.id)
    }

    def show() {
        def typeOfFreightInstance = TypeOfFreight.get(params.id)
        if (!typeOfFreightInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'typeOfFreight.label', default: 'TypeOfFreight'), params.id])
            redirect(action: "list")
            return
        }

        [typeOfFreightInstance: typeOfFreightInstance]
    }

    def edit() {
        def typeOfFreightInstance = TypeOfFreight.get(params.id)
        if (!typeOfFreightInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'typeOfFreight.label', default: 'TypeOfFreight'), params.id])
            redirect(action: "list")
            return
        }

        [typeOfFreightInstance: typeOfFreightInstance]
    }

    def update() {
        def typeOfFreightInstance = TypeOfFreight.get(params.id)
        if (!typeOfFreightInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'typeOfFreight.label', default: 'TypeOfFreight'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (typeOfFreightInstance.version > version) {
                typeOfFreightInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'typeOfFreight.label', default: 'TypeOfFreight')] as Object[],
                          "Another user has updated this TypeOfFreight while you were editing")
                render(view: "edit", model: [typeOfFreightInstance: typeOfFreightInstance])
                return
            }
        }

        typeOfFreightInstance.properties = params

        if (!typeOfFreightInstance.save(flush: true)) {
            render(view: "edit", model: [typeOfFreightInstance: typeOfFreightInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'typeOfFreight.label', default: 'TypeOfFreight'), typeOfFreightInstance.id])
        redirect(action: "show", id: typeOfFreightInstance.id)
    }

    def delete() {
        def typeOfFreightInstance = TypeOfFreight.get(params.id)
        if (!typeOfFreightInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'typeOfFreight.label', default: 'TypeOfFreight'), params.id])
            redirect(action: "list")
            return
        }

        try {
            typeOfFreightInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'typeOfFreight.label', default: 'TypeOfFreight'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'typeOfFreight.label', default: 'TypeOfFreight'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
