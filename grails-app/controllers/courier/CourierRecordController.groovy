package courier

import org.springframework.dao.DataIntegrityViolationException



class CourierRecordController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 100, 1000)
        [courierRecordInstanceList: CourierRecord.list(params), courierRecordInstanceTotal: CourierRecord.count()]
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