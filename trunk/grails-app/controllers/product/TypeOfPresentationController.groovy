package product

import org.springframework.dao.DataIntegrityViolationException

import org.springframework.transaction.annotation.Transactional


@Transactional
class TypeOfPresentationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [typeOfPresentationInstanceList: TypeOfPresentation.list(params), typeOfPresentationInstanceTotal: TypeOfPresentation.count()]
    }

    def create() {
        [typeOfPresentationInstance: new TypeOfPresentation(params)]
    }

    def save() {
        def typeOfPresentationInstance = new TypeOfPresentation(params)
        if (!typeOfPresentationInstance.save(flush: true)) {
            render(view: "create", model: [typeOfPresentationInstance: typeOfPresentationInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'typeOfPresentation.label', default: 'TypeOfPresentation'), typeOfPresentationInstance.id])
        redirect(action: "show", id: typeOfPresentationInstance.id)
    }

    def show() {
        def typeOfPresentationInstance = TypeOfPresentation.get(params.id)
        if (!typeOfPresentationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'typeOfPresentation.label', default: 'TypeOfPresentation'), params.id])
            redirect(action: "list")
            return
        }

        [typeOfPresentationInstance: typeOfPresentationInstance]
    }

    def edit() {
        def typeOfPresentationInstance = TypeOfPresentation.get(params.id)
        if (!typeOfPresentationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'typeOfPresentation.label', default: 'TypeOfPresentation'), params.id])
            redirect(action: "list")
            return
        }

        [typeOfPresentationInstance: typeOfPresentationInstance]
    }

    def update() {
        def typeOfPresentationInstance = TypeOfPresentation.get(params.id)
        if (!typeOfPresentationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'typeOfPresentation.label', default: 'TypeOfPresentation'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (typeOfPresentationInstance.version > version) {
                typeOfPresentationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'typeOfPresentation.label', default: 'TypeOfPresentation')] as Object[],
                          "Another user has updated this TypeOfPresentation while you were editing")
                render(view: "edit", model: [typeOfPresentationInstance: typeOfPresentationInstance])
                return
            }
        }

        typeOfPresentationInstance.properties = params

        if (!typeOfPresentationInstance.save(flush: true)) {
            render(view: "edit", model: [typeOfPresentationInstance: typeOfPresentationInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'typeOfPresentation.label', default: 'TypeOfPresentation'), typeOfPresentationInstance.id])
        redirect(action: "show", id: typeOfPresentationInstance.id)
    }

    def delete() {
        def typeOfPresentationInstance = TypeOfPresentation.get(params.id)
        if (!typeOfPresentationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'typeOfPresentation.label', default: 'TypeOfPresentation'), params.id])
            redirect(action: "list")
            return
        }

        try {
            typeOfPresentationInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'typeOfPresentation.label', default: 'TypeOfPresentation'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'typeOfPresentation.label', default: 'TypeOfPresentation'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
