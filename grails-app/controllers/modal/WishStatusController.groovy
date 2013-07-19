package modal

import java.text.DateFormat;
import java.text.SimpleDateFormat

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.servlet.support.RequestContextUtils


import org.springframework.transaction.annotation.Transactional
import report.Report
import wish.Wish


@Transactional
class WishStatusController {

	static final DateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd")
	
	def wishExportService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		params.sort = params.sort?: 'name'
		params.max = Math.min(params.max ? params.int('max') : 100, 200)
        [wishStatusInstanceList: WishStatus.list(params), wishStatusInstanceTotal: WishStatus.count()]
    }

    def create() {
        [wishStatusInstance: new WishStatus(params)]
    }

    def save() {
        def wishStatusInstance = new WishStatus(params)
        if (!wishStatusInstance.save(flush: true)) {
            render(view: "create", model: [wishStatusInstance: wishStatusInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'wishStatus.label', default: 'WishStatus'), wishStatusInstance.id])
        redirect(action: "show", id: wishStatusInstance.id)
    }

    def show() {
        def wishStatusInstance = WishStatus.get(params.id)
        if (!wishStatusInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'wishStatus.label', default: 'WishStatus'), params.id])
            redirect(action: "list")
            return
        }

        [wishStatusInstance: wishStatusInstance]
    }

    def edit() {
        def wishStatusInstance = WishStatus.get(params.id)
        if (!wishStatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wishStatus.label', default: 'WishStatus'), params.id])
            redirect(action: "list")
            return
        }

        [wishStatusInstance: wishStatusInstance]
    }

    def update() {
        def wishStatusInstance = WishStatus.get(params.id)
        if (!wishStatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wishStatus.label', default: 'WishStatus'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (wishStatusInstance.version > version) {
                wishStatusInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'wishStatus.label', default: 'WishStatus')] as Object[],
                          "Another user has updated this WishStatus while you were editing")
                render(view: "edit", model: [wishStatusInstance: wishStatusInstance])
                return
            }
        }

        wishStatusInstance.properties = params

        if (!wishStatusInstance.save(flush: true)) {
            render(view: "edit", model: [wishStatusInstance: wishStatusInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'wishStatus.label', default: 'WishStatus'), wishStatusInstance.id])
        redirect(action: "show", id: wishStatusInstance.id)
    }

    def delete() {
        def wishStatusInstance = WishStatus.get(params.id)
        if (!wishStatusInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'wishStatus.label', default: 'WishStatus'), params.id])
            redirect(action: "list")
            return
        }
		if(Wish.countByWishStatus(wishStatusInstance)>0){
			flash.message = message(code:'default.delete.error.message',args: [message(code: 'wishStatus.label'),message(code: 'wish.label')])
			redirect(action: "show", id: params.id)
			return
		}

        try {
            wishStatusInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'wishStatus.label', default: 'WishStatus'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'wishStatus.label', default: 'WishStatus'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def exportByWishStatus() {
		Long reportId = Long.parseLong(params.reportId)
		Report report = Report.get(reportId)
		
		WishStatus wishStatus = WishStatus.get(params.id)
		response.contentType=grailsApplication.config.grails.mime.types[params.format]
		response.setHeader("Content-disposition", "attachment;filename=${message(code:'wishes.label')} ${wishStatus}_"+DATE_FORMAT.format(new Date())+".${params.extension}")
		wishExportService.exportWishByWishStatus(params.format,response.outputStream,RequestContextUtils.getLocale(request),wishStatus,report)
	}
}
