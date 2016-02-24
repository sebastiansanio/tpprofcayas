package stakeholder

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.transaction.annotation.Transactional

import product.Extra
import product.PriceList

@Transactional
class SupplierController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST", deletePriceList: "POST"]

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
        
        /* para agregar los extras de alumino al proveedor*/
        supplierInstance.extrasDefault?.clear()
        params.list("extrasDefault.id").each { extra ->
            supplierInstance.addToExtrasDefault( Extra.get( extra.toInteger() ))
        }
        
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

        /* para agregar los extras de alumino al proveedor*/
        supplierInstance.extrasDefault.clear()
        params.list("extrasDefault.id").each { extra ->
            supplierInstance.addToExtrasDefault( Extra.get( extra.toInteger() ))

        }

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

    def deletePriceList() {
        def supplierInstance = Supplier.get(params.long('idSupplier'))
        def listInstance

        if (!supplierInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.idSupplier])
            redirect(action: "list")
            return
        }

        if (!params.nroPriceListDelete) {
            flash.message = message(code: 'supplier.not.priceList.id', default: 'You have to give id price list number')
            redirect(action: "edit", params:[id: params.idSupplier])
            return
        }

        listInstance = PriceList.get(params.long('nroPriceListDelete'))

        if ( !listInstance ) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceList.label', default: 'Price List')])
            redirect(action: "edit", params:[id: params.idSupplier])
            return
        }

        supplierInstance.removeFromPriceLists( listInstance )
        listInstance.delete()
        supplierInstance.save(flush:true)

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'priceList.label', default: 'Price List'), params.nroPriceListDelete])
        redirect(action: "edit", params:[id: params.idSupplier])
    }
}
