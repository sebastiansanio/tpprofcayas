package wish

import org.springframework.dao.DataIntegrityViolationException

/**
 * PictureController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class PictureController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pictureInstanceList: Picture.list(params), pictureInstanceTotal: Picture.count()]
    }

    def create() {
        [pictureInstance: new Picture(params)]
    }

    def save() {
        def pictureInstance = new Picture(params)
        if (!pictureInstance.save(flush: true)) {
            render(view: "create", model: [pictureInstance: pictureInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'picture.label', default: 'Picture'), pictureInstance.id])
        redirect(action: "show", id: pictureInstance.id)
    }

    def show() {
        def pictureInstance = Picture.get(params.id)
        if (!pictureInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])
            redirect(action: "list")
            return
        }

        [pictureInstance: pictureInstance]
    }

    def edit() {
        def pictureInstance = Picture.get(params.id)
        if (!pictureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])
            redirect(action: "list")
            return
        }

        [pictureInstance: pictureInstance]
    }

    def update() {
        def pictureInstance = Picture.get(params.id)
        if (!pictureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (pictureInstance.version > version) {
                pictureInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'picture.label', default: 'Picture')] as Object[],
                          "Another user has updated this Picture while you were editing")
                render(view: "edit", model: [pictureInstance: pictureInstance])
                return
            }
        }

        pictureInstance.properties = params

        if (!pictureInstance.save(flush: true)) {
            render(view: "edit", model: [pictureInstance: pictureInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'picture.label', default: 'Picture'), pictureInstance.id])
        redirect(action: "show", id: pictureInstance.id)
    }

    def delete() {
        def pictureInstance = Picture.get(params.id)
        if (!pictureInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])
            redirect(action: "list")
            return
        }

        try {
            pictureInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])
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
		
}
