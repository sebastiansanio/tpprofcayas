package report

import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat
import java.util.Locale;

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.transaction.annotation.Transactional
import org.apache.shiro.SecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils
import login.User

@Transactional
class StakeholderReportController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	static final DateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd")
	def wishExportService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		User user = User.findByUsername(SecurityUtils.subject.principal)
		
		def reports = new ArrayList()
		def reportsQuantity = 0
		
		if(user.stakeholder!=null){
			reports = StakeholderReport.findAllByStakeholder(user.stakeholder,params)
			reportsQuantity = StakeholderReport.countByStakeholder(user.stakeholder)
		}
		
		params.sort = params.sort?: 'name'
		params.max = Math.min(params.max ? params.int('max') : 100, 200)
        [stakeholderReportInstanceList: reports, stakeholderReportInstanceTotal: reportsQuantity]
    }

    def create() {
		User user = User.findByUsername(SecurityUtils.subject.principal)
		if(user.stakeholder==null){
			flash.message = message(code:'default.notPermitted.label')
			redirect(action: "list", params: params)
			return
		}
		
		[stakeholderReportInstance: new StakeholderReport(params),stakeholder: user.stakeholder]
    }

    def save() {
		User user = User.findByUsername(SecurityUtils.subject.principal)
		if(user.stakeholder==null){
			flash.message = message(code:'default.notPermitted.label')
			redirect(action: "list", params: params)
			return
		}
        def stakeholderReportInstance = new StakeholderReport(params)
		stakeholderReportInstance.stakeholder = user.stakeholder
        if (!stakeholderReportInstance.save(flush: true)) {
            render(view: "create", model: [stakeholderReportInstance: stakeholderReportInstance,stakeholder: user.stakeholder])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'stakeholderReport.label', default: 'StakeholderReport'), stakeholderReportInstance.id])
        redirect(action: "show", id: stakeholderReportInstance.id)
    }

    def show() {
		User user = User.findByUsername(SecurityUtils.subject.principal)
		
        def stakeholderReportInstance = StakeholderReport.get(params.id)
        if (!stakeholderReportInstance || user.stakeholder!=stakeholderReportInstance.stakeholder) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'stakeholderReport.label', default: 'StakeholderReport'), params.id])
            redirect(action: "list")
            return
        }

        [stakeholderReportInstance: stakeholderReportInstance]
    }

    def edit() {
		User user = User.findByUsername(SecurityUtils.subject.principal)
		def stakeholderReportInstance = StakeholderReport.get(params.id)
		if (!stakeholderReportInstance || user.stakeholder!=stakeholderReportInstance.stakeholder) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), params.id])
			redirect(action: "list")
			return
		}

        [stakeholderReportInstance: stakeholderReportInstance,stakeholder:stakeholderReportInstance.stakeholder]
    }

    def update() {
		User user = User.findByUsername(SecurityUtils.subject.principal)

		def stakeholderReportInstance = StakeholderReport.get(params.id)
        if (!stakeholderReportInstance || user.stakeholder!=stakeholderReportInstance.stakeholder) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stakeholderReport.label', default: 'StakeholderReport'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (stakeholderReportInstance.version > version) {
                stakeholderReportInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'stakeholderReport.label', default: 'StakeholderReport')] as Object[],
                          "Another user has updated this StakeholderReport while you were editing")
                render(view: "edit", model: [stakeholderReportInstance: stakeholderReportInstance])
                return
            }
        }

        stakeholderReportInstance.properties = params

        if (!stakeholderReportInstance.save(flush: true)) {
            render(view: "edit", model: [stakeholderReportInstance: stakeholderReportInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'stakeholderReport.label', default: 'StakeholderReport'), stakeholderReportInstance.id])
        redirect(action: "show", id: stakeholderReportInstance.id)
    }

    def delete() {
		User user = User.findByUsername(SecurityUtils.subject.principal)
		def stakeholderReportInstance = StakeholderReport.get(params.id)
        if (!stakeholderReportInstance || user.stakeholder!=stakeholderReportInstance.stakeholder) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'stakeholderReport.label', default: 'StakeholderReport'), params.id])
            redirect(action: "list")
            return
        }

        try {
            stakeholderReportInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'stakeholderReport.label', default: 'StakeholderReport'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'stakeholderReport.label', default: 'StakeholderReport'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def export() {
		response.contentType=grailsApplication.config.grails.mime.types[params.format]
		response.setHeader("Content-disposition", "attachment;filename=${message(code:'wishes.label')} "+DATE_FORMAT.format(new Date())+".${params.extension}")
		def user = User.findByUsername(SecurityUtils.subject.getPrincipal())
		StakeholderReport report = StakeholderReport.get(params.reportId.toLong())
        if (!report || user.stakeholder!=report.stakeholder) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'stakeholderReport.label', default: 'StakeholderReport'), params.id])
            redirect(action: "list")
            return
        }
		
		wishExportService.exportWishByStakeholder(params.format,response.outputStream,RequestContextUtils.getLocale(request),report.stakeholder,report)
	}
	
	def exportCurrent(){
		response.contentType=grailsApplication.config.grails.mime.types[params.format]
		response.setHeader("Content-disposition", "attachment;filename=${message(code:'wishes.label')} "+DATE_FORMAT.format(new Date())+".${params.extension}")
		def user = User.findByUsername(SecurityUtils.subject.getPrincipal())
		if(user.stakeholder==null){
			flash.message = message(code:'default.notPermitted.label')
			redirect(action: "list", params: params)
			return
		}
		StakeholderReport report = new StakeholderReport(params)
		report.stakeholder = user.stakeholder
		
		List wishes = user.stakeholder.wishes.toList()
		if(report.pendingOnly==true){
			wishes = wishes.findAll{
				it.isPending()
			}
		}
		wishes.sort{it.opNumber}
			
		wishExportService.doExport(params.format,response.outputStream,RequestContextUtils.getLocale(request),report.fields,wishes)
	}
}
