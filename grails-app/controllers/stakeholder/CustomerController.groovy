package stakeholder

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.transaction.annotation.Transactional


@Transactional
class CustomerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST", deletePriceList: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		params.sort = params.sort?: 'name'
        params.max = Math.min(params.max ? params.int('max') : 100, 1000)
        [customerInstanceList: Customer.list(params), customerInstanceTotal: Customer.count()]
    }

    def create() {
        [customerInstance: new Customer(params)]
    }

    def save() {
        def customerInstance = new Customer(params)

        if (!customerInstance.save(flush: true)) {
            render(view: "create", model: [customerInstance: customerInstance])
            return
        }
		flash.message = message(code: 'default.created.message', args: [message(code: 'customer.label', default: 'Customer'), customerInstance.id])
        redirect(action: "show", id: customerInstance.id)
    }

    def show() {
        def customerInstance = Customer.get(params.id)
        if (!customerInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])
            redirect(action: "list")
            return
        }

        [customerInstance: customerInstance]
    }

    def edit() { 
        def customerInstance = Customer.get(params.id)
				
        if (!customerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])
            redirect(action: "list")
            return
        }

        [customerInstance: customerInstance]
    }

    def update() {
        def customerInstance = Customer.get(params.id)
		
        if (!customerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (customerInstance.version > version) {
                customerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'customer.label', default: 'Customer')] as Object[],
                          "Another user has updated this Customer while you were editing")
                render(view: "edit", model: [customerInstance: customerInstance])
                return
            }
        }

        customerInstance.properties = params

        if (!customerInstance.save(flush: true)) {
            render(view: "edit", model: [customerInstance: customerInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'customer.label', default: 'Customer'), customerInstance.id])
        redirect(action: "show", id: customerInstance.id)
    }

    def delete() {
        def customerInstance = Customer.get(params.id)
        if (!customerInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])
            redirect(action: "list")
            return
        }
		if(customerInstance.wishes!=null && customerInstance.wishes.size()>0){
			flash.message = message(code:'default.delete.error.message',args: [message(code: 'customer.label'),message(code: 'wish.label')])
			redirect(action: "show", id: params.id)
			return
		}
	
		

        try {
            customerInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])
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
        def customerInstance = Customer.get(params.long('idStackeholder'))
        def listInstance

        if (!customerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.idStackeholder])
            redirect(action: "list")
            return
        }

        if (!params.nroPriceListDelete) {
            flash.message = message(code: 'supplier.not.priceList.id', default: 'You have to give id price list number')
            redirect(action: "edit", params:[id: params.idStackeholder])
            return
        }

        listInstance = PriceList.get(params.long('nroPriceListDelete'))

        if ( !listInstance ) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceList.label', default: 'Price List')])
            redirect(action: "edit", params:[id: params.idStackeholder])
            return
        }

        customerInstance.removeFromPriceLists( listInstance )
        customerInstance.save(flush:true)

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'priceList.label', default: 'Price List'), params.nroPriceListDelete])
        redirect(action: "edit", params:[id: params.idStackeholder])        
    }
}
