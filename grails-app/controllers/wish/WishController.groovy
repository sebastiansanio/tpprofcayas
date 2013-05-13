package wish

import importer.GenericExcelImporter
import java.io.OutputStream;
import java.util.Map;

import org.springframework.web.servlet.support.RequestContextUtils
import org.springframework.dao.DataIntegrityViolationException
import login.User
import org.apache.shiro.SecurityUtils
import stakeholder.*
import org.springframework.transaction.annotation.Transactional


class WishController {

	def wishExportService
	def alertManagerService
	def opNumberGeneratorService
	def wishImportService
	def documentImportService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
	
	def query(){
		
	}

	def importForm(){
		
	}
	
	def importDocuments(){		
		try{
			documentImportService.importDocuments(params.importFile.getBytes())
			alertManagerService.generateAllAlerts()
			flash.message = message(code:'default.importOk.message')
		}catch(Exception e){
			flash.error = message(code:'default.importError.message')+" - "+e.getMessage()
		}
		redirect(action: "list", params: params)
	}
	
	def importWishes(){
		
		try{
			wishImportService.importWishes(params.importFile.getBytes())
			alertManagerService.generateAllAlerts()
			flash.message = message(code:'default.importOk.message')
		}catch(Exception e){			
			flash.error = message(code:'default.importError.message')+" - "+e.getMessage()
		}
		
		redirect(action: "importForm", params: params)
	}
		
    def list() {		
		params.max = Math.min(params.max ? params.int('max') : 100, 1000)
        [wishInstanceList: Wish.list(params), wishInstanceTotal: Wish.count()]
    }
	
	def listPending(){
		params.max = Math.min(params.max ? params.int('max') : 100, 1000)
		List wishes = Wish.findAllByFinishDateIsNullAndBillDateIsNull(params)
		int wishesSize = Wish.countByFinishDateIsNullAndBillDateIsNull()
		render(view: "list", model: [wishInstanceList: wishes, wishInstanceTotal: wishesSize])
	}
	
	def listBilled(){
		params.max = Math.min(params.max ? params.int('max') : 100, 1000)
		List wishes = Wish.findAllByFinishDateIsNullAndBillDateIsNotNull(params)
		int wishesSize = Wish.countByFinishDateIsNullAndBillDateIsNotNull()
		render(view: "list", model: [wishInstanceList: wishes, wishInstanceTotal: wishesSize])
	}
	
	def listFinished(){
		params.max = Math.min(params.max ? params.int('max') : 100, 1000)
		List wishes = Wish.findAllByFinishDateIsNotNull(params)
		int wishesSize = Wish.countByFinishDateIsNotNull()
		render(view: "list", model: [wishInstanceList: wishes, wishInstanceTotal: wishesSize])
	}
	
	def listBilledByStakeholder(){
		params.max = Math.min(params.max ? params.int('max') : 100, 1000)
		Stakeholder stakeholder = Stakeholder.get(params.id)
		List wishes = Wish.findAll("from Wish as w where "+(stakeholder.type == 'customsBroker'?'customs_broker':stakeholder.type)  +"_id=:stakeholder and (finish_date is not null or bill_date is not null) "+ (params.sort ? " order by ${params.sort} ${params.order}" : ''),[stakeholder:stakeholder.id],params)
		List wishesToCount = Wish.findAll("from Wish as w where "+(stakeholder.type == 'customsBroker'?'customs_broker':stakeholder.type) +"_id=:stakeholder and (finish_date is not null or bill_date is not null) "+ (params.sort ? " order by ${params.sort} ${params.order}" : ''),[stakeholder:stakeholder.id])
		render(view: "list", model: [wishInstanceList: wishes, wishInstanceTotal: wishesToCount.size()])
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
	
    def create() {
		
		Wish wishInstance = new Wish(params)
		
		wishInstance.opNumber = opNumberGeneratorService.getNextOpNumber()
			
        [wishInstance: wishInstance]
    }
	
	def getNextCustomerOpNumber(){
		render opNumberGeneratorService.getNextCustomerOpNumber(Customer.get(params.id))
		
	}


    def save() {
		def keys = params.keySet().toArray()
		keys.each{
			if(it.matches("firstStageRequiredDocuments\\[[0-9]*\\]\\.file"))
				params[it.replace(".file",".fileName")]=params[it].getOriginalFilename()
			if(it.matches("secondStageRequiredDocuments\\[[0-9]*\\]\\.file"))
				params[it.replace(".file",".fileName")]=params[it].getOriginalFilename()
			if(it.matches("docDraftToBeApprovedBeforeDelivery\\[[0-9]*\\]\\.draft"))
				params[it.replace(".draft",".fileName")]=params[it].getOriginalFilename()
		}

        def wishInstance = new Wish(params)
			
		alertManagerService.generateAlerts(wishInstance)
		
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
		def keys = params.keySet().toArray()
		keys.each{
			if(it.matches("firstStageRequiredDocuments\\[[0-9]*\\]\\.file"))
				params[it.replace(".file",".fileName")]=params[it].getOriginalFilename()
			if(it.matches("secondStageRequiredDocuments\\[[0-9]*\\]\\.file"))
				params[it.replace(".file",".fileName")]=params[it].getOriginalFilename()
			if(it.matches("docDraftToBeApprovedBeforeDelivery\\[[0-9]*\\]\\.draft"))
				params[it.replace(".draft",".fileName")]=params[it].getOriginalFilename()
		}
		
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
		

		def text = "/wish/show/" + wishInstance.id + "#picturesOfPrintingBoxesAndLoadReceived"
		redirect(uri: text)
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
       
		def text = "/wish/show/" + wishInstance.id + "#picturesOfLoadingContainerReceived"
		redirect(uri: text)
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
		
		def text = "/wish/show/" + params.idWish + "#picturesOfLoadingContainerReceived"
		
		redirect(uri: text, params: [idPictureUpdate: params.id])
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
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'document.label', default: 'Document'), params.nroDocumentDelete])
			redirect(action: "edit", id: params.idWish)
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'document.label', default: 'Document'), params.nroDocumentDelete])
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
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'document.label', default: 'Document'), params.nroDocumentDelete])
			redirect(action: "edit", id: params.idWish)
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'document.label', default: 'Document'), params.nroDocumentDelete])
			redirect(action: "edit", id: params.idWish)
		}
    }
	
	def downloadDocument(){
		def document = Document.get(params.id)
		
		response.setHeader("Content-disposition", "attachment; filename=${document.fileName}")
		response.outputStream << document.file
		response.outputStream.flush()
		
		return	
	}
	
	def downloadDraft(){
		def draft = Draft.get(params.id)
		
		response.setHeader("Content-disposition", "attachment; filename=${draft.fileName}")
		response.outputStream << draft.draft
		response.outputStream.flush()
		
		return
	}
	
	def deleteDraft(){
		def wishInstance = Wish.get(params.idWish)
		def drafttInstance = wishInstance.docDraftToBeApprovedBeforeDelivery[params.nroDraftDelete.toInteger()]
		
		if (!drafttInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'draft.label', default: 'Draft'), params.nroDraftDelete])
			redirect(action: "edit", id: params.idWish)
			return
		}

		try {
			
			wishInstance.removeFromDocDraftToBeApprovedBeforeDelivery(drafttInstance)
			drafttInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'draft.label', default: 'Draft'), params.nroDraftDelete])
			redirect(action: "edit", id: params.idWish)
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'draft.label', default: 'Draft'), params.nroDraftDelete])
			redirect(action: "edit", id: params.idWish)
		}
	}
	
	def deleteUnit(){
		def wishInstance = Wish.get(params.idWish)
		def unitInstance = wishInstance.loadUnits[params.nroUnitDelete.toInteger()]
		
		if (!unitInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'loadUnit.label', default: 'Load unit'), params.nroUnitDelete])
			redirect(action: "edit", id: params.idWish)
			return
		}

		try {
			
			wishInstance.removeFromLoadUnits(unitInstance)
			unitInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'loadUnit.label', default: 'Load unit'), params.nroUnitDelete])
			redirect(action: "edit", id: params.idWish)
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'loadUnit.label', default: 'Load unit'), params.nroUnitDelete])
			redirect(action: "edit", id: params.idWish)
		}
	}
	
	def deleteNote(){
		def wishInstance = Wish.get(params.noteWishId)
		def noteInstance = Note.get(params.id)
		
		if (!noteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'note.label', default: 'Note'), params.id])
			redirect(action: "edit", id: params.noteWishId)
			return
		}

		try {
			
			wishInstance.removeFromNotes(noteInstance)
			noteInstance.delete(flush:true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'note.label', default: 'Note'), params.id])
			redirect(action: "edit", id: params.noteWishId)
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'note.label', default: 'Note'), params.id])
			redirect(action: "edit", id: params.noteWishId)
		}
	}
}
