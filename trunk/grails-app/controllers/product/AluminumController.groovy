package product

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile

import wish.Picture

class AluminumController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [aluminumInstanceList: Aluminum.list(params), aluminumInstanceTotal: Aluminum.count()]
    }

    def create() {
        [aluminumInstance: new Aluminum(params)]
    }

    def save() {
        def aluminumInstance = new Aluminum(params)

		aluminumInstance.moldRemoveElements()
		aluminumInstance.originalPlaneRemoveElements()
		
        if (!aluminumInstance.save(flush: true)) {
            render(view: "create", model: [aluminumInstance: aluminumInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'aluminum.label', default: 'Aluminum'), aluminumInstance.id])
        redirect(action: "show", id: aluminumInstance.id)
    }

    def show() {
        def aluminumInstance = Aluminum.get(params.id)
        if (!aluminumInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'aluminum.label', default: 'Aluminum'), params.id])
            redirect(action: "list")
            return
        }

        [aluminumInstance: aluminumInstance]
    }

    def edit() {
        def aluminumInstance = Aluminum.get(params.id)
        if (!aluminumInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'aluminum.label', default: 'Aluminum'), params.id])
            redirect(action: "list")
            return
        }

        [aluminumInstance: aluminumInstance]
    }

    def update() {
        def aluminumInstance = Aluminum.get(params.id)
        if (!aluminumInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'aluminum.label', default: 'Aluminum'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (aluminumInstance.version > version) {
                aluminumInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'aluminum.label', default: 'Aluminum')] as Object[],
                          "Another user has updated this Aluminum while you were editing")
                render(view: "edit", model: [aluminumInstance: aluminumInstance])
                return
            }
        }

        aluminumInstance.properties = params
		aluminumInstance.moldRemoveElements()
		aluminumInstance.originalPlaneRemoveElements()
		
        if (!aluminumInstance.save(flush: true)) {
            render(view: "edit", model: [aluminumInstance: aluminumInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'aluminum.label', default: 'Aluminum'), aluminumInstance.id])
        redirect(action: "show", id: aluminumInstance.id)
    }

    def delete() {
        def aluminumInstance = Aluminum.get(params.id)
        if (!aluminumInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'aluminum.label', default: 'Aluminum'), params.id])
            redirect(action: "list")
            return
        }

        try {
            aluminumInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'aluminum.label', default: 'Aluminum'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'aluminum.label', default: 'Aluminum'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def showPicture(){
		def picture = AluminumPicture.get(params.id)
		
		if ( !picture )
			return
			
		response.setHeader("Content-disposition", "attachment; filename=${params.id}")
		response.outputStream << picture.image
		response.outputStream.flush()
		return
	}

	@Transactional
	def uploadPicture() {
		def f = request.getFile('pictureFile')
		if (f.empty) {
			flash.message = message(code:"aluminum.picture.empty", default:'File cannot be empty') 
			redirect(action: "show", id: params.idAluminum)
			
			return
		}
				
		def aluminum = Aluminum.get(params.idAluminum)
		
		// me fijo si ya tenía una imagen cargada y en tal caso la borro
		if ( aluminum.picture != null) {
			def oldPicture = aluminum.picture
			aluminum.picture = null 
			oldPicture.delete( flush:true )	
		}

		aluminum.picture = new AluminumPicture()
		aluminum.picture.image = f.bytes

		if (!aluminum.picture.save()) {
		  redirect()(view:'show', model:[aluminumInstance: aluminum] )
		  return
		}
		
		flash.message = message(code:"aluminum.picture.loaded", default:"Image loaded")
		redirect(action: "show", id: params.idAluminum)
	}

	@Transactional
	def uploadPlane() {
		def aluminum = Aluminum.get(params.idAluminum)
		
		def f = request.getFile('planeFile')
		if (f.empty) {
			flash.message = message(code:"aluminum.picture.empty", default:'File cannot be empty') 
			redirect(action: "show", id: params.idAluminum)
			return
		}
		
		// me fijo si ya tenía un plano cargada y en tal caso lo borro
		if ( aluminum.plane != null) {	
			def oldPlane = aluminum.plane
			aluminum.plane= null
			oldPlane.delete( flush:true )
		}

		aluminum.plane = new AluminumPicture()
		aluminum.plane.image = f.bytes

		if (!aluminum.plane.save()) {
		  render(view:'show', model:[aluminumInstance: aluminum] )
		  return
		}
		
		flash.message = message(code:"aluminum.plane.loaded", default:"Plane loaded")
		redirect(action: "show", id: params.idAluminum)
	}

}
