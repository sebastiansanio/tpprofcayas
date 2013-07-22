package report

import java.text.DateFormat;
import java.text.SimpleDateFormat
import login.User
import org.apache.shiro.SecurityUtils
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.servlet.support.RequestContextUtils

import org.springframework.transaction.annotation.Transactional
import stakeholder.Stakeholder
import wish.Wish


@Transactional
class ReportController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	static final DateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd")
	def wishExportService

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		params.sort = params.sort?: 'name'
		params.max = Math.min(params.max ? params.int('max') : 100, 200)
        [reportInstanceList: Report.list(params), reportInstanceTotal: Report.count()]
    }

    def create() {
        [reportInstance: new Report(params)]
    }

    def save() {
        def reportInstance = new Report(params)
        if (!reportInstance.save(flush: true)) {
            render(view: "create", model: [reportInstance: reportInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'report.label', default: 'Report'), reportInstance.id])
        redirect(action: "show", id: reportInstance.id)
    }

    def show() {
        def reportInstance = Report.get(params.id)
        if (!reportInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), params.id])
            redirect(action: "list")
            return
        }

        [reportInstance: reportInstance]
    }

    def edit() {
        def reportInstance = Report.get(params.id)
        if (!reportInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), params.id])
            redirect(action: "list")
            return
        }

        [reportInstance: reportInstance]
    }

    def update() {
        def reportInstance = Report.get(params.id)
        if (!reportInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (reportInstance.version > version) {
                reportInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'report.label', default: 'Report')] as Object[],
                          "Another user has updated this Report while you were editing")
                render(view: "edit", model: [reportInstance: reportInstance])
                return
            }
        }

        reportInstance.properties = params

        if (!reportInstance.save(flush: true)) {
            render(view: "edit", model: [reportInstance: reportInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'report.label', default: 'Report'), reportInstance.id])
        redirect(action: "show", id: reportInstance.id)
    }

    def delete() {
        def reportInstance = Report.get(params.id)
        if (!reportInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), params.id])
            redirect(action: "list")
            return
        }
		if(Stakeholder.countByDefaultReport(reportInstance)>0){
			flash.message = message(code:'default.delete.error.message',args: [message(code: 'report.label'),message(code: 'stakeholder.label')])
			redirect(action: "show", id: params.id)
			return
		}
		if(ReportSendConfiguration.countByReport(reportInstance)>0){
			flash.message = message(code:'default.delete.error.message',args: [message(code: 'report.label'),message(code: 'reportSendConfiguration.label')])
			redirect(action: "show", id: params.id)
			return
		}
        try {
            reportInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'report.label', default: 'Report'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'report.label', default: 'Report'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def export() {
		params.reportId = Long.parseLong(params.reportId)
		response.contentType=grailsApplication.config.grails.mime.types[params.format]
		response.setHeader("Content-disposition", "attachment;filename=${message(code:'wishes.label')} "+DATE_FORMAT.format(new Date())+".${params.extension}")
		def user = User.findByUsername(SecurityUtils.subject.getPrincipal())
		wishExportService.exportWish(params.format,response.outputStream,RequestContextUtils.getLocale(request),params.reportId)
	}
	
	def exportCurrent(){
		response.contentType=grailsApplication.config.grails.mime.types[params.format]
		response.setHeader("Content-disposition", "attachment;filename=${message(code:'wishes.label')} "+DATE_FORMAT.format(new Date())+".${params.extension}")
		def user = User.findByUsername(SecurityUtils.subject.getPrincipal())
		
		Report report = new Report(params)
		
		List wishes = Wish.list(sort:'opNumber')
		if(report.pendingOnly==true)
			wishes = wishes.findAll{
				it.isPending()
			}
			
			
		wishExportService.doExport(params.format,response.outputStream,RequestContextUtils.getLocale(request),report.fields,wishes)	
	}
	
}
