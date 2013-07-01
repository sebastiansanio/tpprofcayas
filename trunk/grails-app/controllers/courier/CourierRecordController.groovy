package courier

import java.text.DateFormat
import java.text.SimpleDateFormat
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.servlet.support.RequestContextUtils

import org.springframework.transaction.annotation.Transactional


@Transactional
class CourierRecordController {

	private static final DateFormat DATE_FORMAT = new SimpleDateFormat("_yyyyMMdd")
	
	def courierExportService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
	
	def query() {
	
	}

	def export() {
		boolean pendingOnly = params.pendingOnly
		response.contentType=grailsApplication.config.grails.mime.types[params.format]
		response.setHeader("Content-disposition", "attachment;filename=${message(code:'courierRecord.label')}"+DATE_FORMAT.format(new Date())+".${params.extension}")
		courierExportService.exportCourierRecord(params.format,response.outputStream,RequestContextUtils.getLocale(request),pendingOnly)
	}
	
	
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 100, 200)
        [courierRecordInstanceList: CourierRecord.list(params), courierRecordInstanceTotal: CourierRecord.count()]
    }
	
	def listPending(){
		params.sort = params.sort?: 'departureDate'
		params.order = params.order?: 'desc'
			
		params.max = Math.min(params.max ? params.int('max') : 100, 200)
		List couriers = CourierRecord.findAllByArrivalDateIsNull(params)
		int couriersSize = CourierRecord.countByArrivalDateIsNull()
		render(view: "list", model: [courierRecordInstanceList: couriers, courierRecordInstanceTotal: couriersSize])
	}

    def create() {
        [:]
    }

	def createSpecialCourierRecord(){
		[specialCourierRecordInstance: new SpecialCourierRecord(params)]
	}
	
	def createDocumentsCourierRecord(){
		[documentsCourierRecordInstance: new DocumentsCourierRecord(params)]
	}
	
    def saveSpecialCourierRecord() {
        def courierRecordInstance = new SpecialCourierRecord(params)
        if (!courierRecordInstance.save(flush: true)) {
            render(view: "createSpecialCourierRecord", model: [specialCourierRecordInstance: courierRecordInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'courierRecord.label', default: 'CourierRecord'), courierRecordInstance.id])
        redirect(action: "show", id: courierRecordInstance.id)
    }
	
	def saveDocumentsCourierRecord() {
		def courierRecordInstance = new DocumentsCourierRecord(params)
		if (!courierRecordInstance.save(flush: true)) {
			render(view: "createDocumentsCourierRecord", model: [documentsCourierRecordInstance: courierRecordInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'courierRecord.label', default: 'CourierRecord'), courierRecordInstance.id])
		redirect(action: "show", id: courierRecordInstance.id)
	}

    def show() {
        def courierRecordInstance = CourierRecord.get(params.id)
        if (!courierRecordInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'courierRecord.label', default: 'CourierRecord'), params.id])
            redirect(action: "list")
            return
        }

        if(courierRecordInstance instanceof DocumentsCourierRecord){
			render(view:'showDocumentsCourierRecord',model:[documentsCourierRecordInstance: courierRecordInstance])
			return
		}
		if(courierRecordInstance instanceof SpecialCourierRecord){
			render(view:'showSpecialCourierRecord',model:[specialCourierRecordInstance: courierRecordInstance])
			return
		}
    }

    def edit() {
        def courierRecordInstance = CourierRecord.get(params.id)
        if (!courierRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'courierRecord.label', default: 'CourierRecord'), params.id])
            redirect(action: "list")
            return
        }

		if(courierRecordInstance instanceof DocumentsCourierRecord){
			render(view:'editDocumentsCourierRecord',model:[documentsCourierRecordInstance: courierRecordInstance])
			return
		}
		if(courierRecordInstance instanceof SpecialCourierRecord){
			render(view:'editSpecialCourierRecord',model:[specialCourierRecordInstance: courierRecordInstance])
			return
		}
    }

    def update() {
        def courierRecordInstance = CourierRecord.get(params.id)
        if (!courierRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'courierRecord.label', default: 'CourierRecord'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (courierRecordInstance.version > version) {
                courierRecordInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'courierRecord.label', default: 'CourierRecord')] as Object[],
                          "Another user has updated this CourierRecord while you were editing")
                render(view: "edit", model: [courierRecordInstance: courierRecordInstance])
                return
            }
        }

        courierRecordInstance.properties = params

        if (!courierRecordInstance.save(flush: true)) {
            if(courierRecordInstance instanceof DocumentsCourierRecord){
				render(view:'editDocumentsCourierRecord',model:[documentsCourierRecordInstance: courierRecordInstance])
				return
			}
			if(courierRecordInstance instanceof SpecialCourierRecord){
				render(view:'editSpecialCourierRecord',model:[specialCourierRecordInstance: courierRecordInstance])
				return
			}
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'courierRecord.label', default: 'CourierRecord'), courierRecordInstance.id])
        redirect(action: "show", id: courierRecordInstance.id)
    }

    def delete() {
        def courierRecordInstance = CourierRecord.get(params.id)
        if (!courierRecordInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'courierRecord.label', default: 'CourierRecord'), params.id])
            redirect(action: "list")
            return
        }

        try {
            courierRecordInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'courierRecord.label', default: 'CourierRecord'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'courierRecord.label', default: 'CourierRecord'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
