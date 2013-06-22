package courier

import org.springframework.dao.DataIntegrityViolationException



class CourierController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 100, 500)
        [courierInstanceList: Courier.list(params), courierInstanceTotal: Courier.count()]
    }

    def create() {
        [courierInstance: new Courier(params)]
    }

    def save() {
        def courierInstance = new Courier(params)
        if (!courierInstance.save(flush: true)) {
            render(view: "create", model: [courierInstance: courierInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'courier.label', default: 'Courier'), courierInstance.id])
        redirect(action: "show", id: courierInstance.id)
    }

    def show() {
        def courierInstance = Courier.get(params.id)
        if (!courierInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'courier.label', default: 'Courier'), params.id])
            redirect(action: "list")
            return
        }

        [courierInstance: courierInstance]
    }

    def edit() {
        def courierInstance = Courier.get(params.id)
        if (!courierInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'courier.label', default: 'Courier'), params.id])
            redirect(action: "list")
            return
        }

        [courierInstance: courierInstance]
    }

    def update() {
        def courierInstance = Courier.get(params.id)
        if (!courierInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'courier.label', default: 'Courier'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (courierInstance.version > version) {
                courierInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'courier.label', default: 'Courier')] as Object[],
                          "Another user has updated this Courier while you were editing")
                render(view: "edit", model: [courierInstance: courierInstance])
                return
            }
        }

        courierInstance.properties = params

        if (!courierInstance.save(flush: true)) {
            render(view: "edit", model: [courierInstance: courierInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'courier.label', default: 'Courier'), courierInstance.id])
        redirect(action: "show", id: courierInstance.id)
    }

    def delete() {
        def courierInstance = Courier.get(params.id)
        if (!courierInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'courier.label', default: 'Courier'), params.id])
            redirect(action: "list")
            return
        }

        try {
            courierInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'courier.label', default: 'Courier'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'courier.label', default: 'Courier'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
