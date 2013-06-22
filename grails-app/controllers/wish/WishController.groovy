package wish

import importer.GenericExcelImporter
import java.io.OutputStream;
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Map;

import org.springframework.web.multipart.MultipartFile
import org.springframework.web.servlet.support.RequestContextUtils
import org.springframework.dao.DataIntegrityViolationException
import login.User
import org.apache.shiro.SecurityUtils
import report.Report
import stakeholder.*
import org.springframework.transaction.annotation.Transactional

import org.springframework.transaction.annotation.Transactional


@Transactional
class WishController {

	
	static final Integer DEFAULT_PAGINATION_MAX = 100
	static final DateFormat df = new SimpleDateFormat("yyyyMMdd")
	
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
		params.sort = params.sort?: 'opNumber'
		params.order = params.order?: 'desc'
			
		params.max = Math.min(params.max ? params.int('max') : DEFAULT_PAGINATION_MAX, 1000)
        [wishInstanceList: Wish.list(params), wishInstanceTotal: Wish.count()]
    }
	
	def listPending(){
		params.sort = params.sort?: 'opNumber'
		params.order = params.order?: 'desc'
			
		params.max = Math.min(params.max ? params.int('max') : DEFAULT_PAGINATION_MAX, 1000)
		List wishes = Wish.findAllByFinishDateIsNullAndBillDateIsNull(params)
		int wishesSize = Wish.countByFinishDateIsNullAndBillDateIsNull()
		render(view: "list", model: [wishInstanceList: wishes, wishInstanceTotal: wishesSize])
	}
	
	def listBilled(){
		params.sort = params.sort?: 'opNumber'
		params.order = params.order?: 'desc'
		
		params.max = Math.min(params.max ? params.int('max') : DEFAULT_PAGINATION_MAX, 1000)
		List wishes = Wish.findAllByFinishDateIsNullAndBillDateIsNotNull(params)
		int wishesSize = Wish.countByFinishDateIsNullAndBillDateIsNotNull()
		render(view: "list", model: [wishInstanceList: wishes, wishInstanceTotal: wishesSize])
	}
	
	def listFinished(){
		if(params.sort == null)
			params.sort = 'opNumber'
		if(params.order == null)
			params.order = 'desc'
		
		params.max = Math.min(params.max ? params.int('max') : DEFAULT_PAGINATION_MAX, 1000)
		List wishes = Wish.findAllByFinishDateIsNotNull(params)
		int wishesSize = Wish.countByFinishDateIsNotNull()
		render(view: "list", model: [wishInstanceList: wishes, wishInstanceTotal: wishesSize])
	}
	
	def export() {
		params.reportId = Long.parseLong(params.reportId)
		response.contentType=grailsApplication.config.grails.mime.types[params.format]
		response.setHeader("Content-disposition", "attachment;filename=${message(code:'wish.label')}_"+df.format(new Date())+".${params.extension}")
		def user = User.findByUsername(SecurityUtils.subject.getPrincipal())
		wishExportService.exportWish(params.format,response.outputStream,RequestContextUtils.getLocale(request),params.reportId)
	}
		
	def exportByStakeholder() {
		Long reportId = Long.parseLong(params.reportId)
		Report report = Report.get(reportId)
		
		def stakeholder = Stakeholder.get(params.id)
		response.contentType=grailsApplication.config.grails.mime.types[params.format]
		response.setHeader("Content-disposition", "attachment;filename=${message(code:'wish.label')} ${stakeholder}_"+df.format(new Date())+".${params.extension}")
		wishExportService.exportWishByStakeholder(params.format,response.outputStream,RequestContextUtils.getLocale(request),stakeholder,report)
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
		
		// para obtener los archivos seleccionados
		List<MultipartFile> files = request.multiFileMap.collect { it.value }.flatten()
		def wishInstance = Wish.get(params.idWish)
		def argPict = [:]
		def archivos = files.findAll { !it.empty  }
	
		argPict.put("description", params.description)
		
		archivos.asList().each {
			
			argPict.put("image", it.getBytes() );
			
			def picture = new PrintingBoxesPicture(argPict)
			
			if (!picture.save(flush: true)) {
				redirect(action: "show", id: wishInstance.id)
				return
			}

			flash.message = message(code: 'default.created.message', args: [message(code: 'picture.label', default: 'Picture'), picture.id])
			wishInstance.addToPicturesOfPrintingBoxes(picture)
		  }

		def text = "/wish/show/" + wishInstance.id + "#picturesOfPrintingBoxesAndLoadReceived"
		redirect(uri: text)
	}

	def createContainerPicture(){

		// para obtener los archivos seleccionados
		List<MultipartFile> files = request.multiFileMap.collect { it.value }.flatten()
		def wishInstance = Wish.get(params.idWish)
		def argPict = [:]	
		def archivos = files.findAll { !it.empty  }
	
		argPict.put("description", params.description)
		
		archivos.asList().each {	
			
			argPict.put("image", it.getBytes() );
			
			def picture = new LoadingContainerPicture(argPict)
			
			if (!picture.save(flush: true)) {
				redirect(action: "show", id: wishInstance.id)
				return
			}

			flash.message = message(code: 'default.created.message', args: [message(code: 'picture.label', default: 'Picture'), picture.id])
			wishInstance.addToPicturesOfLoadingContainer(picture)			
		  }

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
			
			def text = "/wish/show/" + params.idWish + "#picturesOfPrintingBoxesAndLoadReceived"
			
			if (wishInstance.picturesOfPrintingBoxes.empty == true)
				redirect(uri: text)
			else
				redirect(uri: text, params: [idPictureUpdate: wishInstance.picturesOfPrintingBoxes.first().id])
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
			
			def text = "/wish/show/" + params.idWish + "#picturesOfLoadingContainerReceived"
			
			if (wishInstance.picturesOfLoadingContainer.empty == true)
				redirect(uri: text)
			else
				redirect(uri: text, params: [idPictureUpdate: wishInstance.picturesOfLoadingContainer.first().id])
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
			
			def text = "/wish/edit/" + params.idWish + "#docPhases1"
			redirect(uri: text)
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

			def text = "/wish/edit/" + params.idWish + "#docPhases2"
			redirect(uri: text)
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
			
			def text = "/wish/edit/" + params.idWish + "#draftDoc"
			redirect(uri: text)
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
			
			def text = "/wish/edit/" + params.idWish + "#loadUnitDoc"
			redirect(uri: text)
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
			
			def text = "/wish/edit/" + params.noteWishId + "#notesChildList"
			redirect(uri: text)
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'note.label', default: 'Note'), params.id])
			redirect(action: "edit", id: params.noteWishId)
		}
	}
}
