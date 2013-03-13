package wish

import importer.GenericExcelImporter
import java.io.OutputStream;
import java.util.Map;

import org.springframework.web.servlet.support.RequestContextUtils
import org.springframework.dao.DataIntegrityViolationException
import login.User
import org.apache.shiro.SecurityUtils
import stakeholder.*


class WishController {

	def wishExportService
	def alertManagerService
	def opNumberGeneratorService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
	
	def query(){
		
	}

	def importForm(){
		
	}
	
	def importWishes(){
		
		String filename = new Date().toString()+".tmp"
		File file = new File(filename)
		params.importFile.transferTo(file)
		
		Map configuration = [
			sheet:'Pedido',
			startRow:1,
			columnMap: [
				'A': 'opNumber',
				'B': 'customerOpNumber',
				'C': 'customer.id',
				'D': 'supplier.id',
				'E': 'shipper.id',
				'F': 'productDescription',
				'G': 'supplierOrder',
				'H': 'currencyFob',
				'I': 'currency.id',
				'J': 'conversion',
				'K': 'estimatedTimeOfDeparture',
				'L': 'estimatedTimeOfArrival',
				'M': 'wishDate',
				'N': 'customsBroker.id',
				'O': 'ship.id',
				'P': 'forwarder.id',
				'Q': 'agent.id',
				'R': 'dispatchNumber',
				'S': 'djaiNumber',
				'T': 'djaiFormalizationDate',
				'U': 'finishDate'
			]
		]
		def path = file.getAbsolutePath()
		
		try{
			GenericExcelImporter genericExcelImporter = new GenericExcelImporter(path)
			List objects = genericExcelImporter.getObjects(configuration)	
			objects.each{
				def customer = Customer.get(it['customer.id']) 
				it.estimatedTimeOfDeparture = it.estimatedTimeOfDeparture.toDateTimeAtStartOfDay().toDate()
				it.estimatedTimeOfArrival = it.estimatedTimeOfArrival.toDateTimeAtStartOfDay().toDate()			
				it.wishDate = it.wishDate.toDateTimeAtStartOfDay().toDate()
				it.djaiFormalizationDate = it.djaiFormalizationDate.toDateTimeAtStartOfDay().toDate()
				it.finishDate = it.finishDate.toDateTimeAtStartOfDay().toDate()
				Wish wishInstance = new Wish(it)
				if(wishInstance.customerOpNumber == null)
					wishInstance.customerOpNumber = opNumberGeneratorService.getNextCustomerOpNumber(customer)
				if(wishInstance.opNumber == null)
					wishInstance.opNumber = opNumberGeneratorService.getNextOpNumber()	
				customer.addToWishes(wishInstance)
				customer.save()
			}
			flash.message =  message(code: 'default.importOk.message')
		}catch(Exception e){
			flash.message =  message(code: 'default.importError.message')
		}
		file.delete()
		redirect(action: "list", params: params)
	}
		
    def list() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [wishInstanceList: Wish.list(params), wishInstanceTotal: Wish.count()]
    }
	

	def export() {
		params.reportId = Long.parseLong(params.reportId)
		response.contentType=grailsApplication.config.grails.mime.types[params.format]
		response.setHeader("Content-disposition", "attachment;filename=${message(code:'wish.label')}.${params.extension}")
		def user = User.findByUsername(SecurityUtils.subject.getPrincipal())
		wishExportService.exportWish(params.format,response.outputStream,RequestContextUtils.getLocale(request),params.reportId)
	}
	
	
	def exportByStakeholder() {
		def stakeholder = Stakeholder.get(params.id)
		response.contentType=grailsApplication.config.grails.mime.types[params.format]
		response.setHeader("Content-disposition", "attachment;filename=${message(code:'wish.label')} ${stakeholder}.${params.extension}")
		wishExportService.exportWishByStakeholder(params.format,response.outputStream,RequestContextUtils.getLocale(request),stakeholder)
	}

	def sendMail(){
		
		File file = new File("${message(code:'wish.label')}"+new Date()+".${params.extension}")
		OutputStream outputStream = new FileOutputStream(file)
		def user = User.findByUsername(SecurityUtils.subject.getPrincipal())
		wishExportService.exportWish(params.format,outputStream,RequestContextUtils.getLocale(request))
		
		sendMail {
			multipart true
			to "sebastiansanio@outlook.com"
			subject "${message(code:'wish.label')}"
			body "${message(code:'wish.label')}"
			attachBytes "${message(code:'wish.label')}.${params.extension}",'application/vnd.ms-excel',file.readBytes()
				
		}
		file.delete()
		redirect(action: "list")
	}
	
    def create() {
        [wishInstance: new Wish(params)]
    }

    def save() {
        def wishInstance = new Wish(params)
		
		alertManagerService.generateAlerts(wishInstance)
		if(wishInstance.customerOpNumber == null)
			wishInstance.customerOpNumber = opNumberGeneratorService.getNextCustomerOpNumber(wishInstance.customer)
		if(wishInstance.opNumber == null)
			wishInstance.opNumber = opNumberGeneratorService.getNextOpNumber()
		
		
        if (!wishInstance.save(flush: true)) {
            render(view: "create", model: [wishInstance: wishInstance])
            return
        }


		flash.message = message(code: 'default.created.message', args: [message(code: 'wish.label', default: 'Wish'), wishInstance.id])
        redirect(action: "show", id: wishInstance.id)
    }

    def show() {
        def wishInstance = Wish.get(params.id)

				
        if (!wishInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'wish.label', default: 'Wish'), params.id])
            redirect(action: "list")
            return
        }
		alertManagerService.generateAlerts(wishInstance)

        [wishInstance: wishInstance, idPictureUpdate: params.idPictureUpdate]
    }

    def edit() {
        def wishInstance = Wish.get(params.id)
        if (!wishInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wish.label', default: 'Wish'), params.id])
            redirect(action: "list")
            return
        }

        [wishInstance: wishInstance]
    }

    def update() {
        
		def wishInstance = Wish.get(params.id)
        if (!wishInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wish.label', default: 'Wish'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (wishInstance.version > version) {
                wishInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'wish.label', default: 'Wish')] as Object[],
                          "Another user has updated this Wish while you were editing")
                render(view: "edit", model: [wishInstance: wishInstance])
                return
            }
        }

        wishInstance.properties = params

        if (!wishInstance.save(flush: true)) {
            render(view: "edit", model: [wishInstance: wishInstance])
            return
        }
		alertManagerService.generateAlerts(wishInstance)
		
		flash.message = message(code: 'default.updated.message', args: [message(code: 'wish.label', default: 'Wish'), wishInstance.id])
        redirect(action: "show", id: wishInstance.id)
    }

    def delete() {
        def wishInstance = Wish.get(params.id)
		
        if (!wishInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'wish.label', default: 'Wish'), params.id])
            redirect(action: "list")
            return
        }
		
        try {
            wishInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'wish.label', default: 'Wish'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'wish.label', default: 'Wish'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def viewPicture(){
		def picture = Picture.get(params.id)
		response.setHeader("Content-disposition", "attachment; filename=${params.id}")
		response.outputStream << picture.image
		response.outputStream.flush()
		return
	}

	def createBoxPicture(){
		def picture = new Picture(params)
		def wishInstance = Wish.get(params.idWish)
	        if (!picture.save(flush: true)) {
	        	redirect(action: "show", id: wishInstance.id)	
        	   return
        	}

		flash.message = message(code: 'default.created.message', args: [message(code: 'picture.label', default: 'Picture'), picture.id])
		wishInstance.addToPicturesOfPrintingBoxes(picture)
	    redirect(action: "show", id: wishInstance.id)	
	}

	def createContainerPicture(){
		def picture = new Picture(params)
		def wishInstance = Wish.get(params.idWish)
	        if (!picture.save(flush: true)) {
        	    	  redirect(action: "show", id: wishInstance.id)
        	   return
        	}

		flash.message = message(code: 'default.created.message', args: [message(code: 'picture.label', default: 'Picture'), picture.id])
		wishInstance.addToPicturesOfLoadingContainer(picture)
        redirect(action: "show", id: wishInstance.id)	
	}

    def deleteBoxPicture(){
        def wishInstance = Wish.get(params.idWish)
        def pictureInstance = wishInstance.picturesOfPrintingBoxes.find { it.id == params.id.toInteger() }
				
        if (!pictureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])
			redirect(action: "show", id: params.idWish, params: [idPictureUpdate: params.id])
            return
        }
		
        try {
			
            wishInstance.removeFromPicturesOfPrintingBoxes(pictureInstance)
            pictureInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])
			if (wishInstance.picturesOfPrintingBoxes.empty == true)
				redirect(action: "show", id: params.idWish)
			else
				redirect(action: "show", id: params.idWish, params: [idPictureUpdate: wishInstance.picturesOfPrintingBoxes.first().id])
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])
			redirect(action: "show", id: params.idWish, params: [idPictureUpdate: params.id])
        }
    }
	
	def deleteContainerPicture(){
		
		def wishInstance = Wish.get(params.idWish)
		def pictureInstance = wishInstance.picturesOfLoadingContainer.find { it.id == params.id.toInteger() }
		
		if (!pictureInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])
			redirect(action: "show", id: params.idWish, params: [idPictureUpdate: params.id])
			return
		}

		try {
			
			wishInstance.removeFromPicturesOfLoadingContainer(pictureInstance)
			pictureInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])
			
			if (wishInstance.picturesOfLoadingContainer.empty == true)
				redirect(action: "show", id: params.idWish)
			else
				redirect(action: "show", id: params.idWish, params: [idPictureUpdate: wishInstance.picturesOfLoadingContainer.first().id])
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])
			redirect(action: "show", id: params.idWish, params: [idPictureUpdate: params.id])
		}
	}
	
	def editPicture() {	
		def pictureInstance = Picture.get(params.id)
		if (!pictureInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])
			redirect(action: "show", id: params.idWish)
			return
		}

		pictureInstance.description = params.description

		if (!pictureInstance.save(flush: true)) {
			redirect(action: "show", id: params.idWish, params: [idPictureUpdate: params.id])		
			return
		}

		flash.message = message(code: 'default.updated.message', args: [message(code: 'picture.label', default: 'Picture'), pictureInstance.id])
		redirect(action: "show", id: params.idWish, params: [idPictureUpdate: params.id])
	}

    def deleteDocumentFirstPhase(){		
		def wishInstance = Wish.get(params.idWish)
		def documentInstance = wishInstance.firstStageRequiredDocuments[params.nroDocumentDelete.toInteger()]
		
		if (!documentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), params.nroDocumentDelete])
			redirect(action: "edit", id: params.idWish)
			return
		}

		try {
			
			wishInstance.removeFromFirstStageRequiredDocuments(documentInstance)
			documentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'document.label', default: 'Picture'), params.nroDocumentDelete])
			redirect(action: "edit", id: params.idWish)
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'document.label', default: 'Picture'), params.nroDocumentDelete])
			redirect(action: "edit", id: params.idWish)
		}		
    }

    def deleteDocumentSecondPhase(){
		def wishInstance = Wish.get(params.idWish)
		def documentInstance = wishInstance.secondStageRequiredDocuments[params.nroDocumentDelete.toInteger()]
		
		if (!documentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), params.nroDocumentDelete])
			redirect(action: "edit", id: params.idWish)
			return
		}

		try {
			
			wishInstance.removeFromSecondStageRequiredDocuments(documentInstance)
			documentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'document.label', default: 'Picture'), params.nroDocumentDelete])
			redirect(action: "edit", id: params.idWish)
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'document.label', default: 'Picture'), params.nroDocumentDelete])
			redirect(action: "edit", id: params.idWish)
		}
    }
	
	def downloadDocument(){
		def document = Document.get(params.id)
		
		System.out.println(document.file);
		System.out.println(document.file== null);
		System.out.println(document.file.length == 0);
		
		//response.setContentType("application/x-download")
		response.setHeader("Content-disposition", "attachment; filename=${params.id}")
		response.outputStream << document.file
		response.outputStream.flush()
		
		return	
	}
}
