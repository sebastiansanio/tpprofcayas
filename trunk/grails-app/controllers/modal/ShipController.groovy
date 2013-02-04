package modal

import org.springframework.dao.DataIntegrityViolationException

/**
 * ShipController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ShipController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [shipInstanceList: Ship.list(params), shipInstanceTotal: Ship.count()]
    }

    def create() {
        [shipInstance: new Ship(params)]
    }

    def save() {
        def shipInstance = new Ship(params)
        if (!shipInstance.save(flush: true)) {
            render(view: "create", model: [shipInstance: shipInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'ship.label', default: 'Ship'), shipInstance.id])
        redirect(action: "show", id: shipInstance.id)
    }

    def show() {
        def shipInstance = Ship.get(params.id)
        if (!shipInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ship.label', default: 'Ship'), params.id])
            redirect(action: "list")
            return
        }

        [shipInstance: shipInstance]
    }

    def edit() {
        def shipInstance = Ship.get(params.id)
        if (!shipInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ship.label', default: 'Ship'), params.id])
            redirect(action: "list")
            return
        }

        [shipInstance: shipInstance]
    }

    def update() {
        def shipInstance = Ship.get(params.id)
        if (!shipInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ship.label', default: 'Ship'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (shipInstance.version > version) {
                shipInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ship.label', default: 'Ship')] as Object[],
                          "Another user has updated this Ship while you were editing")
                render(view: "edit", model: [shipInstance: shipInstance])
                return
            }
        }

        shipInstance.properties = params

        if (!shipInstance.save(flush: true)) {
            render(view: "edit", model: [shipInstance: shipInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'ship.label', default: 'Ship'), shipInstance.id])
        redirect(action: "show", id: shipInstance.id)
    }

    def delete() {
        def shipInstance = Ship.get(params.id)
        if (!shipInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ship.label', default: 'Ship'), params.id])
            redirect(action: "list")
            return
        }

        try {
            shipInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'ship.label', default: 'Ship'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ship.label', default: 'Ship'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
