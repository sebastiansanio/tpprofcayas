package helper

import org.springframework.dao.DataIntegrityViolationException



class LogoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		params.sort = params.sort?: 'name'
		params.order = params.order?: 'asc'
        params.max = Math.min(params.max ? params.int('max') : 100, 1000)
        [logoInstanceList: Logo.list(params), logoInstanceTotal: Logo.count()]
    }

    def create() {
        [logoInstance: new Logo(params)]
    }

    def save() {
        def logoInstance = new Logo(params)
        if (!logoInstance.save(flush: true)) {
            render(view: "create", model: [logoInstance: logoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'logo.label', default: 'Logo'), logoInstance.id])
        redirect(action: "show", id: logoInstance.id)
    }

    def show() {
        def logoInstance = Logo.get(params.id)
        if (!logoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'logo.label', default: 'Logo'), params.id])
            redirect(action: "list")
            return
        }

        [logoInstance: logoInstance]
    }
	
	def viewLogo(){
		def logo = Logo.get(params.id)
		response.setHeader("Content-disposition", "attachment; filename=${params.id}")
		response.outputStream << logo.image
		response.outputStream.flush()
		return
	}
}
