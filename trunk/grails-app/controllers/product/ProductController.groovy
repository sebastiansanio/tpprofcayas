package product

import java.text.DateFormat;
import java.text.SimpleDateFormat

import org.springframework.dao.DataIntegrityViolationException

import org.springframework.transaction.annotation.Transactional
import wish.LoadUnit

import org.springframework.web.servlet.support.RequestContextUtils
import stakeholder.Supplier
import product.HistoricalPrice

@Transactional
class ProductController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	static final DateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd")
	def productImportService
	def productExportService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		params.sort = params.sort?: 'descriptionEN'
		params.max = Math.min(params.max ? params.int('max') : 100, 200)
        [productInstanceList: Product.list(params), productInstanceTotal: Product.count()]
    }

    def create() {
        [productInstance: new Product(params)]
    }

    def save() {
        def productInstance = new Product(params)
		
		if ( productInstance.pricePerUnit != null )
			productInstance.addToPreviousPrices( new HistoricalPrice(price: productInstance.pricePerUnit, dateFrom: new Date()))
		
        if (!productInstance.save(flush: true)) {
            render(view: "create", model: [productInstance: productInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])
        redirect(action: "show", id: productInstance.id)
    }

    def show() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
            return
        }
		
        [productInstance: productInstance]
    }

    def edit() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
            return
        }

		if ( productInstance?.previousPrices?.size() == 0 )
			productInstance.pricePerUnit = null
		else
			productInstance.pricePerUnit = productInstance?.previousPrices?.last().price
		
        [productInstance: productInstance]
    }

    def update() {
        def productInstance = Product.get(params.id)
		
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (productInstance.version > version) {
                productInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'product.label', default: 'Product')] as Object[],
                          "Another user has updated this Product while you were editing")
                render(view: "edit", model: [productInstance: productInstance])
                return
            }
        }
		def previousPrices = productInstance.pricePerUnit
        productInstance.properties = params

		if ( productInstance.pricePerUnit != null && previousPrices != productInstance.pricePerUnit ) 
			productInstance.addToPreviousPrices( new HistoricalPrice(price: productInstance.pricePerUnit, dateFrom: new Date()))

        if (!productInstance.save(flush: true)) {
            render(view: "edit", model: [productInstance: productInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])
        redirect(action: "show", id: productInstance.id)
    }

    def delete() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
            return
        }
		if(LoadUnit.countByProduct(productInstance)>0){
			flash.message = message(code:'default.delete.error.message',args: [message(code: 'product.label'),message(code: 'loadUnit.label')])
			redirect(action: "show", id: params.id)
			return
		}
        try {
            productInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def subFamily(){
		[family: Family.get(params.id)]
	}
	
	def importForm(){
		[:]
	}
	
	def importProducts(){
		
		try{
			productImportService.importProducts(params.importFile.getBytes())
			flash.message = message(code:'default.importOk.message')
		}catch(Exception e){
			flash.error = message(code:'default.importError.message')+" - "+e.getMessage()
		}	
		redirect(action: "importForm", params: params)
	}

	def importPrices(){
		
		Supplier supplier = params.supplierId!='null'?Supplier.get(params.supplierId.toLong()):null
		try{
			productImportService.importPrices(supplier,params.importFile.getBytes())
			flash.message = message(code:'default.importOk.message')
		}catch(Exception e){
			flash.error = message(code:'default.importError.message')+" - "+e.getMessage()
		}	
		redirect(action: "importForm", params: params)
	}
	
	def query(){
		[:]
	}
	
	def export() {
		response.contentType=grailsApplication.config.grails.mime.types[params.format]
		
		if(params.supplierId == 'null'){
			response.setHeader("Content-disposition", "attachment;filename=${message(code:'product.pl.label',default:'Products')} "+DATE_FORMAT.format(new Date())+".${params.extension}")
			productExportService.exportProducts(params.format,response.outputStream,RequestContextUtils.getLocale(request))
			return
		}else{
			Supplier supplier = Supplier.get(params.supplierId.toLong())
			response.setHeader("Content-disposition", "attachment;filename=${message(code:'product.pl.label',default:'Products')} ${supplier.name} "+DATE_FORMAT.format(new Date())+".${params.extension}")
			productExportService.exportProductsBySupplier(supplier,params.format,response.outputStream,RequestContextUtils.getLocale(request))
			return
		}
	}
	
	def deleteCodePerCustomer() {
		
		def productInstance = Product.get(params.productId)
		def codePerCustomerInstance = CodePerCustomer.get(params.codePerCustomerId)
		
		if (!codePerCustomerInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'codePerCustomer.label', default: 'Code Per Customer'), params.codePerCustomerId])
			redirect(action: "edit", id: params.productId)
			return
		}

		try {
			
			productInstance.removeFromCodePerCustomer(codePerCustomerInstance)
			codePerCustomerInstance.delete(flush:true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'codePerCustomer.label', default: 'Code Per Customer'), params.codePerCustomerId])
			
			def text = "/product/edit/" + params.productId + "#codePerCustomer"
			redirect(uri: text)
			
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'codePerCustomer.label', default: 'Code Per Customer'), params.codePerCustomerId])
			redirect(action: "edit", id: params.productId)
		}
	}
	
	def deletePricePerCustomer() {
		
		def productInstance = Product.get(params.productId)
		def pricePerCustomerInstance = PricePerCustomer.get(params.pricePerCustomerId)
		
		if (!pricePerCustomerInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'pricePerCustomer.label', default: 'Price Per Customer'), params.pricePerCustomerId])
			redirect(action: "edit", id: params.productId)
			return
		}

		try {
			
			productInstance.removeFromPricePerCustomer(pricePerCustomerInstance)
			pricePerCustomerInstance.delete(flush:true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'pricePerCustomer.label', default: 'Price Per Customer'), params.pricePerCustomerId])
			
			def text = "/product/edit/" + params.productId + "#pricePerCustomer"
			redirect(uri: text)
			
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pricePerCustomer.label', default: 'Price Per Customer'), params.pricePerCustomerId])
			redirect(action: "edit", id: params.productId)
		}
	}
	
	def listHistoricalPrice() {

			def historicalPrice = HistoricalPrice.withCriteria {
				eq("product.id", params.id.toLong())
				order "dateFrom", "desc"
			}.asList()
		
		[historicalPriceInstanceList: historicalPrice, idProduct: params.id]
	}
	
	def deleteHistoricalPrice() {
		
		def historicalPriceInstance = HistoricalPrice.get(params.idPrice)
		
		if (!historicalPriceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.previousPrices.label', default: 'Historical price'), params.idPrice])
			redirect(action: "listHistoricalPrice", id: params.idProduct)
			return
		}

		try {
			historicalPriceInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'product.previousPrices.label', default: 'Historical price'), params.idPrice])
			
			redirect(action: "listHistoricalPrice", id: params.idProduct)
			
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'product.previousPrices.label', default: 'Historical price'), params.idPrice])
			redirect(action: "listHistoricalPrice", id: params.idProduct)
		}
	}
}
