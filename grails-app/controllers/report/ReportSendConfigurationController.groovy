package report

import java.text.DateFormat
import java.text.SimpleDateFormat
import org.springframework.dao.DataIntegrityViolationException

import org.springframework.transaction.annotation.Transactional
import stakeholder.Stakeholder


@Transactional
class ReportSendConfigurationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

	def contactsByStakeholder(){
		[stakeholder:Stakeholder.get(params.id)]				
		
	}
	
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 100, 500)
        [reportSendConfigurationInstanceList: ReportSendConfiguration.list(params), reportSendConfigurationInstanceTotal: ReportSendConfiguration.count()]
    }

    def create() {
        [reportSendConfigurationInstance: new ReportSendConfiguration(params)]
    }

    def save() {
        def reportSendConfigurationInstance = new ReportSendConfiguration(params)
        if (!reportSendConfigurationInstance.save(flush: true)) {
            render(view: "create", model: [reportSendConfigurationInstance: reportSendConfigurationInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'reportSendConfiguration.label', default: 'ReportSendConfiguration'), reportSendConfigurationInstance.id])
        redirect(action: "show", id: reportSendConfigurationInstance.id)
    }

    def show() {
        def reportSendConfigurationInstance = ReportSendConfiguration.get(params.id)
        if (!reportSendConfigurationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'reportSendConfiguration.label', default: 'ReportSendConfiguration'), params.id])
            redirect(action: "list")
            return
        }

        [reportSendConfigurationInstance: reportSendConfigurationInstance]
    }

    def edit() {
        def reportSendConfigurationInstance = ReportSendConfiguration.get(params.id)
        if (!reportSendConfigurationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reportSendConfiguration.label', default: 'ReportSendConfiguration'), params.id])
            redirect(action: "list")
            return
        }

        [reportSendConfigurationInstance: reportSendConfigurationInstance]
    }

    def update() {
        def reportSendConfigurationInstance = ReportSendConfiguration.get(params.id)
        if (!reportSendConfigurationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reportSendConfiguration.label', default: 'ReportSendConfiguration'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (reportSendConfigurationInstance.version > version) {
                reportSendConfigurationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'reportSendConfiguration.label', default: 'ReportSendConfiguration')] as Object[],
                          "Another user has updated this ReportSendConfiguration while you were editing")
                render(view: "edit", model: [reportSendConfigurationInstance: reportSendConfigurationInstance])
                return
            }
        }

        reportSendConfigurationInstance.properties = params

        if (!reportSendConfigurationInstance.save(flush: true)) {
            render(view: "edit", model: [reportSendConfigurationInstance: reportSendConfigurationInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'reportSendConfiguration.label', default: 'ReportSendConfiguration'), reportSendConfigurationInstance.id])
        redirect(action: "show", id: reportSendConfigurationInstance.id)
    }

    def delete() {
        def reportSendConfigurationInstance = ReportSendConfiguration.get(params.id)
        if (!reportSendConfigurationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'reportSendConfiguration.label', default: 'ReportSendConfiguration'), params.id])
            redirect(action: "list")
            return
        }

        try {
            reportSendConfigurationInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'reportSendConfiguration.label', default: 'ReportSendConfiguration'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'reportSendConfiguration.label', default: 'ReportSendConfiguration'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
