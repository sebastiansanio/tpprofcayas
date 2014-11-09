package audit

import org.hibernate.envers.AuditReader
import org.hibernate.envers.AuditReaderFactory

class AuditController {

	def sessionFactory
	
	def index (){ 
		redirect(action: "list", params: params)
	}
	
	def list(){
		params.sort = params.sort?:'id'
		params.order = params.order?:'desc'
		
		params.max = Math.min(params.max ? params.int('max') : 100, 200)
		[revisionInformationInstanceList: RevisionInformation.list(params), revisionInformationInstanceTotal: RevisionInformation.count()]
	}
	
	def listLogins(){
		params.sort = params.sort?:'id'
		params.order = params.order?:'desc'
		
		params.max = Math.min(params.max ? params.int('max') : 100, 200)
		[loginLogInstanceList: LoginLog.list(params), loginLogInstanceTotal: LoginLog.count()]
	}
	
	def show(){
		
		def revisionInformationInstance = RevisionInformation.get(params.id)
		if (!revisionInformationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'audit.label', default: 'Audit'), params.id])
			redirect(action: "list")
			return
		}

		[revisionInformationInstance: revisionInformationInstance]
	}
}
