package product

import org.springframework.dao.DataIntegrityViolationException
import stakeholder.Supplier

import grails.converters.JSON


class PriceListController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [priceListInstanceList: PriceList.list(params), priceListInstanceTotal: PriceList.count()]
    }

    def create() {
        [priceListInstance: new PriceList(params)]
    }

    def save() {
        def priceListInstance = new PriceList(params)
        if (!priceListInstance.save(flush: true)) {
            render(view: "create", model: [priceListInstance: priceListInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'priceList.label', default: 'PriceList'), priceListInstance.id])
        redirect(action: "show", id: priceListInstance.id)
    }

    def show() {
        def priceListInstance = PriceList.get(params.id)
        if (!priceListInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceList.label', default: 'PriceList'), params.id])
            redirect(action: "list")
            return
        }

        [priceListInstance: priceListInstance]
    }

    def edit() {
        def priceListInstance = PriceList.get(params.id)
        if (!priceListInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceList.label', default: 'PriceList'), params.id])
            redirect(action: "list")
            return
        }

        [priceListInstance: priceListInstance]
    }

    def update() {
        def priceListInstance = PriceList.get(params.id)
        if (!priceListInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceList.label', default: 'PriceList'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (priceListInstance.version > version) {
                priceListInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'priceList.label', default: 'PriceList')] as Object[],
                          "Another user has updated this PriceList while you were editing")
                render(view: "edit", model: [priceListInstance: priceListInstance])
                return
            }
        }

        priceListInstance.properties = params

        if (!priceListInstance.save(flush: true)) {
            render(view: "edit", model: [priceListInstance: priceListInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'priceList.label', default: 'PriceList'), priceListInstance.id])
        redirect(action: "show", id: priceListInstance.id)
    }

    def delete() {
        def priceListInstance = PriceList.get(params.id)
        if (!priceListInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'priceList.label', default: 'PriceList'), params.id])
            redirect(action: "list")
            return
        }

        try {
            priceListInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'priceList.label', default: 'PriceList'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'priceList.label', default: 'PriceList'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def getAllSuppliers() {
        def supplier = Supplier.getAll().sort { it.name }
        def supplierArray = []
        def result = [:]
        supplier.each { it ->
            supplierArray.add( [id: it.id, description: it.toString() ] )
        }
        result['suppliers'] = supplierArray

        render result as JSON
    }

    def getPricesList() {
        def supplier = Supplier.get(params.long('idSupplier'))
        def pricesList = PriceList.findAllBySupplier(supplier)
        def priceListArray = []
        def result = [:]
        pricesList.sort{it.name}.each { it ->
            priceListArray.add( [id: it.id, description: it.toString() ] )
        }
        result['pricesList'] = priceListArray
        render result as JSON        
    }
}
