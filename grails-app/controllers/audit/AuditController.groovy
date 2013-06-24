package audit

class AuditController {

	def index (){ 
		redirect(action: "list", params: params)
	}
	
	def list(){
		params.max = Math.min(params.max ? params.int('max') : 100, 200)
		[revisionInformationInstanceList: RevisionInformation.list(params), revisionInformationInstanceTotal: RevisionInformation.count()]
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
