package stakeholder

import org.springframework.dao.DataIntegrityViolationException

/**
 * ForwarderController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ForwarderController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 100, 1000)
        [forwarderInstanceList: Forwarder.list(params), forwarderInstanceTotal: Forwarder.count()]
    }

    def create() {
        [forwarderInstance: new Forwarder(params)]
    }

    def save() {
        def forwarderInstance = new Forwarder(params)
        if (!forwarderInstance.save(flush: true)) {
            render(view: "create", model: [forwarderInstance: forwarderInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'forwarder.label', default: 'Forwarder'), forwarderInstance.id])
        redirect(action: "show", id: forwarderInstance.id)
    }

    def show() {
        def forwarderInstance = Forwarder.get(params.id)
        if (!forwarderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'forwarder.label', default: 'Forwarder'), params.id])
            redirect(action: "list")
            return
        }

        [forwarderInstance: forwarderInstance]
    }

    def edit() {
        def forwarderInstance = Forwarder.get(params.id)
        if (!forwarderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'forwarder.label', default: 'Forwarder'), params.id])
            redirect(action: "list")
            return
        }

        [forwarderInstance: forwarderInstance]
    }

    def update() {
        def forwarderInstance = Forwarder.get(params.id)
        if (!forwarderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'forwarder.label', default: 'Forwarder'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (forwarderInstance.version > version) {
                forwarderInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'forwarder.label', default: 'Forwarder')] as Object[],
                          "Another user has updated this Forwarder while you were editing")
                render(view: "edit", model: [forwarderInstance: forwarderInstance])
                return
            }
        }

        forwarderInstance.properties = params

        if (!forwarderInstance.save(flush: true)) {
            render(view: "edit", model: [forwarderInstance: forwarderInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'forwarder.label', default: 'Forwarder'), forwarderInstance.id])
        redirect(action: "show", id: forwarderInstance.id)
    }

    def delete() {
        def forwarderInstance = Forwarder.get(params.id)
        if (!forwarderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'forwarder.label', default: 'Forwarder'), params.id])
            redirect(action: "list")
            return
        }

        try {
            forwarderInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'forwarder.label', default: 'Forwarder'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'forwarder.label', default: 'Forwarder'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def deleteContact(){
		def stakeholderInstance = Stakeholder.get(params.idStakeholder)
		def contactInstance = stakeholderInstance.contacts[params.nroContactDelete.toInteger()]
		
		if (!contactInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), params.nroContactDelete])
			redirect(action: "edit", id: params.idStakeholder)
			return
		}

		try {
			
			stakeholderInstance.removeFromContacts(contactInstance)
			contactInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'contact.label', default: 'Contact'), params.nroContactDelete])
			redirect(action: "edit", id: params.idStakeholder)
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contact.label', default: 'Contact'), params.nroContactDelete])
			redirect(action: "edit", id: params.idStakeholder)
		}
	}
}
