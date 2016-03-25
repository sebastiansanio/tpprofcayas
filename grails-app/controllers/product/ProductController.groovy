package product

import java.text.DateFormat;
import java.text.SimpleDateFormat

import org.springframework.dao.DataIntegrityViolationException

import org.springframework.transaction.annotation.Transactional
import wish.LoadUnit

import org.springframework.web.servlet.support.RequestContextUtils
import stakeholder.Supplier

class ProductController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	static final DateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd")
	def productImportService
	def productExportService
	def abstractProductService
	
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

	@Transactional
    def save() {
        def productInstance = new Product(params)
							
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
		
        [productInstance: productInstance]
    }

	@Transactional
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
        
        productInstance.properties = params

			
        if (!productInstance.save(flush: true)) {
            render(view: "edit", model: [productInstance: productInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])
        redirect(action: "show", id: productInstance.id)
    }

	@Transactional
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
	
	@Transactional
	def deleteCodePerCustomer() {
		
		def productInstance = AbstractProduct.get(params.productId)
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
	
	@Transactional
	def deleteNote(){
		def noteInstance = ProductNote.get(params.id)
		
		if (!noteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'note.label', default: 'Note'), params.id])
			redirect(action: "edit", id: params.containerId)
			return
		}

		try {
			noteInstance.product.removeFromNotes( noteInstance )
			noteInstance.delete(flush:true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'note.label', default: 'Note'), params.id])
			
			def text = "/product/edit/" + params.containerId + "#notesChildList"
			redirect(uri: text)
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'note.label', default: 'Note'), params.id])
			redirect(action: "edit", id: params.containerId)
		}
	}

    def showPrices() {
        def product = Product.get(params.id)
        def productPrices = ProductPrice.findAllByProduct(product)
        
        render view:"showPrices", model:[ product: product, productPrices: productPrices ]
    }
}
