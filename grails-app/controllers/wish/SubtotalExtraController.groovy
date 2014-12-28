package wish

import org.springframework.dao.DataIntegrityViolationException

/**
 * SubtotalExtraController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class SubtotalExtraController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [subtotalExtraInstanceList: SubtotalExtra.list(params), subtotalExtraInstanceTotal: SubtotalExtra.count()]
    }

    def show() {
        def subtotalExtraInstance = SubtotalExtra.get(params.id)
        if (!subtotalExtraInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'subtotalExtra.label', default: 'SubtotalExtra'), params.id])
            redirect(action: "list")
            return
        }

        [subtotalExtraInstance: subtotalExtraInstance]
    }

    def edit() {
        def subtotalExtraInstance = SubtotalExtra.get(params.id)
        if (!subtotalExtraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subtotalExtra.label', default: 'SubtotalExtra'), params.id])
            redirect(action: "list")
            return
        }

        [subtotalExtraInstance: subtotalExtraInstance]
    }

    def update() {
        def subtotalExtraInstance = SubtotalExtra.get(params.id)
        if (!subtotalExtraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subtotalExtra.label', default: 'SubtotalExtra'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (subtotalExtraInstance.version > version) {
                subtotalExtraInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'subtotalExtra.label', default: 'SubtotalExtra')] as Object[],
                          "Another user has updated this SubtotalExtra while you were editing")
                render(view: "edit", model: [subtotalExtraInstance: subtotalExtraInstance])
                return
            }
        }

        subtotalExtraInstance.properties = params

        if (!subtotalExtraInstance.save(flush: true)) {
            render(view: "edit", model: [subtotalExtraInstance: subtotalExtraInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'subtotalExtra.label', default: 'SubtotalExtra'), subtotalExtraInstance.id])
        redirect(action: "show", id: subtotalExtraInstance.id)
    }

    def delete() {
        def subtotalExtraInstance = SubtotalExtra.get(params.id)
        if (!subtotalExtraInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'subtotalExtra.label', default: 'SubtotalExtra'), params.id])
            redirect(action: "list")
            return
        }

        try {
            subtotalExtraInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'subtotalExtra.label', default: 'SubtotalExtra'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'subtotalExtra.label', default: 'SubtotalExtra'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
