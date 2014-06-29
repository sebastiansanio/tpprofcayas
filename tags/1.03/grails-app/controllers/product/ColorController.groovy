package product

import org.springframework.dao.DataIntegrityViolationException


import org.springframework.transaction.annotation.Transactional


@Transactional
class ColorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		params.sort = params.sort?: 'description'
		params.max = Math.min(params.max ? params.int('max') : 100, 200)
        [colorInstanceList: Color.list(params), colorInstanceTotal: Color.count()]
    }

    def create() {
        [colorInstance: new Color(params)]
    }

    def save() {
        def colorInstance = new Color(params)
        if (!colorInstance.save(flush: true)) {
            render(view: "create", model: [colorInstance: colorInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'color.label', default: 'Color'), colorInstance.id])
        redirect(action: "show", id: colorInstance.id)
    }

    def show() {
        def colorInstance = Color.get(params.id)
        if (!colorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'color.label', default: 'Color'), params.id])
            redirect(action: "list")
            return
        }

        [colorInstance: colorInstance]
    }

    def edit() {
        def colorInstance = Color.get(params.id)
        if (!colorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'color.label', default: 'Color'), params.id])
            redirect(action: "list")
            return
        }

        [colorInstance: colorInstance]
    }

    def update() {
        def colorInstance = Color.get(params.id)
        if (!colorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'color.label', default: 'Color'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (colorInstance.version > version) {
                colorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'color.label', default: 'Color')] as Object[],
                          "Another user has updated this Color while you were editing")
                render(view: "edit", model: [colorInstance: colorInstance])
                return
            }
        }

        colorInstance.properties = params

        if (!colorInstance.save(flush: true)) {
            render(view: "edit", model: [colorInstance: colorInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'color.label', default: 'Color'), colorInstance.id])
        redirect(action: "show", id: colorInstance.id)
    }

    def delete() {
        def colorInstance = Color.get(params.id)
        if (!colorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'color.label', default: 'Color'), params.id])
            redirect(action: "list")
            return
        }
		if(Product.countByColor(colorInstance)>0){
			flash.message = message(code:'default.delete.error.message',args: [message(code: 'color.label'),message(code: 'product.label')])
			redirect(action: "show", id: params.id)
			return
		}
        try {
            colorInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'color.label', default: 'Color'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'color.label', default: 'Color'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
