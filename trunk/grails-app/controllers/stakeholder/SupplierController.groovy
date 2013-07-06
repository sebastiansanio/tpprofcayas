package stakeholder

import org.springframework.dao.DataIntegrityViolationException


import org.springframework.transaction.annotation.Transactional


@Transactional
class SupplierController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		params.sort = params.sort?: 'name'
        params.max = Math.min(params.max ? params.int('max') : 100, 1000)
        [supplierInstanceList: Supplier.list(params), supplierInstanceTotal: Supplier.count()]
    }

    def create() {
        [supplierInstance: new Supplier(params)]
    }

    def save() {
        def supplierInstance = new Supplier(params)
        if (!supplierInstance.save(flush: true)) {
            render(view: "create", model: [supplierInstance: supplierInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'supplier.label', default: 'Supplier'), supplierInstance.id])
        redirect(action: "show", id: supplierInstance.id)
    }

    def show() {
        def supplierInstance = Supplier.get(params.id)
        if (!supplierInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
            redirect(action: "list")
            return
        }

        [supplierInstance: supplierInstance]
    }

    def edit() {
        def supplierInstance = Supplier.get(params.id)
        if (!supplierInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
            redirect(action: "list")
            return
        }

        [supplierInstance: supplierInstance]
    }

    def update() {
        def supplierInstance = Supplier.get(params.id)
        if (!supplierInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (supplierInstance.version > version) {
                supplierInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'supplier.label', default: 'Supplier')] as Object[],
                          "Another user has updated this Supplier while you were editing")
                render(view: "edit", model: [supplierInstance: supplierInstance])
                return
            }
        }

        supplierInstance.properties = params

        if (!supplierInstance.save(flush: true)) {
            render(view: "edit", model: [supplierInstance: supplierInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'supplier.label', default: 'Supplier'), supplierInstance.id])
        redirect(action: "show", id: supplierInstance.id)
    }

    def delete() {
        def supplierInstance = Supplier.get(params.id)
        if (!supplierInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
            redirect(action: "list")
            return
        }
		if(supplierInstance.wishes!=null && supplierInstance.wishes.size()>0){
			flash.message = message(code:'default.delete.error.message',args: [message(code: 'supplier.label'),message(code: 'wish.label')])
			redirect(action: "show", id: params.id)
			return
		}

		
        try {
            supplierInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
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
