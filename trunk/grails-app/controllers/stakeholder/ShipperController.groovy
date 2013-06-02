package stakeholder

import org.springframework.dao.DataIntegrityViolationException



class ShipperController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		params.sort = params.sort?: 'name'
        params.max = Math.min(params.max ? params.int('max') : 100, 1000)
        [shipperInstanceList: Shipper.list(params), shipperInstanceTotal: Shipper.count()]
    }

    def create() {
        [shipperInstance: new Shipper(params)]
    }

    def save() {
        def shipperInstance = new Shipper(params)
        if (!shipperInstance.save(flush: true)) {
            render(view: "create", model: [shipperInstance: shipperInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'shipper.label', default: 'Shipper'), shipperInstance.id])
        redirect(action: "show", id: shipperInstance.id)
    }

    def show() {
        def shipperInstance = Shipper.get(params.id)
        if (!shipperInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'shipper.label', default: 'Shipper'), params.id])
            redirect(action: "list")
            return
        }

        [shipperInstance: shipperInstance]
    }

    def edit() {
        def shipperInstance = Shipper.get(params.id)
        if (!shipperInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shipper.label', default: 'Shipper'), params.id])
            redirect(action: "list")
            return
        }

        [shipperInstance: shipperInstance]
    }

    def update() {
        def shipperInstance = Shipper.get(params.id)
        if (!shipperInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shipper.label', default: 'Shipper'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (shipperInstance.version > version) {
                shipperInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'shipper.label', default: 'Shipper')] as Object[],
                          "Another user has updated this Shipper while you were editing")
                render(view: "edit", model: [shipperInstance: shipperInstance])
                return
            }
        }

        shipperInstance.properties = params

        if (!shipperInstance.save(flush: true)) {
            render(view: "edit", model: [shipperInstance: shipperInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'shipper.label', default: 'Shipper'), shipperInstance.id])
        redirect(action: "show", id: shipperInstance.id)
    }

    def delete() {
        def shipperInstance = Shipper.get(params.id)
        if (!shipperInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'shipper.label', default: 'Shipper'), params.id])
            redirect(action: "list")
            return
        }

        try {
            shipperInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'shipper.label', default: 'Shipper'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'shipper.label', default: 'Shipper'), params.id])
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
