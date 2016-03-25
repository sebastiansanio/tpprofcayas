package product

import org.springframework.dao.DataIntegrityViolationException
import stakeholder.Supplier

import grails.converters.JSON

import org.springframework.transaction.annotation.Transactional

@Transactional
class PriceListController {

    static allowedMethods = []

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [priceListInstanceList: PriceList.list(params), priceListInstanceTotal: PriceList.count()]
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

    def showHistorical() {
        def product = Product.get(params.productId)
        def list = PriceList.get(params.listId)

        def productPrice = ProductPrice.findByListAndProduct(list, product)

        def historicalInstanceList = HistoricalPrice.findAllByProductPrice(productPrice)?.sort{ it?.dateFrom }.reverse()

        render view:'/priceList/showHistorical', model:[historicalInstanceList: historicalInstanceList, product: product, priceList: PriceList.get(params.listId) ]
    } 
}
