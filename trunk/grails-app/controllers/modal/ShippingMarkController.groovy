package modal

import org.springframework.dao.DataIntegrityViolationException


import org.springframework.transaction.annotation.Transactional
import wish.Wish


@Transactional
class ShippingMarkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		params.sort = params.sort?: 'name'
		params.max = Math.min(params.max ? params.int('max') : 100, 200)
        [shippingMarkInstanceList: ShippingMark.list(params), shippingMarkInstanceTotal: ShippingMark.count()]
    }

    def create() {
        [shippingMarkInstance: new ShippingMark(params)]
    }

    def save() {
        def shippingMarkInstance = new ShippingMark(params)
        if (!shippingMarkInstance.save(flush: true)) {
            render(view: "create", model: [shippingMarkInstance: shippingMarkInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'shippingMark.label', default: 'ShippingMark'), shippingMarkInstance.id])
        redirect(action: "show", id: shippingMarkInstance.id)
    }

    def show() {
        def shippingMarkInstance = ShippingMark.get(params.id)
        if (!shippingMarkInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'shippingMark.label', default: 'ShippingMark'), params.id])
            redirect(action: "list")
            return
        }

        [shippingMarkInstance: shippingMarkInstance]
    }

    def edit() {
        def shippingMarkInstance = ShippingMark.get(params.id)
        if (!shippingMarkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shippingMark.label', default: 'ShippingMark'), params.id])
            redirect(action: "list")
            return
        }

        [shippingMarkInstance: shippingMarkInstance]
    }

    def update() {
        def shippingMarkInstance = ShippingMark.get(params.id)
        if (!shippingMarkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shippingMark.label', default: 'ShippingMark'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (shippingMarkInstance.version > version) {
                shippingMarkInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'shippingMark.label', default: 'ShippingMark')] as Object[],
                          "Another user has updated this ShippingMark while you were editing")
                render(view: "edit", model: [shippingMarkInstance: shippingMarkInstance])
                return
            }
        }

        shippingMarkInstance.properties = params

        if (!shippingMarkInstance.save(flush: true)) {
            render(view: "edit", model: [shippingMarkInstance: shippingMarkInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'shippingMark.label', default: 'ShippingMark'), shippingMarkInstance.id])
        redirect(action: "show", id: shippingMarkInstance.id)
    }

    def delete() {
        def shippingMarkInstance = ShippingMark.get(params.id)
        if (!shippingMarkInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'shippingMark.label', default: 'ShippingMark'), params.id])
            redirect(action: "list")
            return
        }
		if(Wish.countByShippingMark(shippingMarkInstance)>0){
			flash.message = message(code:'default.delete.error.message',args: [message(code: 'shippingMark.label'),message(code: 'wish.label')])
			redirect(action: "show", id: params.id)
			return
		}
        try {
            shippingMarkInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'shippingMark.label', default: 'ShippingMark'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'shippingMark.label', default: 'ShippingMark'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
