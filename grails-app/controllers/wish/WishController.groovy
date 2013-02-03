package wish

import org.springframework.dao.DataIntegrityViolationException


class WishController {

	def exportService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [wishInstanceList: Wish.list(params), wishInstanceTotal: Wish.count()]
    }
	
	def export() {
		response.contentType=grailsApplication.config.grails.mime.types[params.format]
		response.setHeader("Content-disposition", "attachment;filename=${message(code:'wish.label')}.${params.extension}")
		
		List fields = ["opNumber","customerOpNumber","customer","supplier","shipper","supplierOrder"]
		Map labels = ["opNumber":message(code:"wish.opNumber.label"),"customerOpNumber":message(code:"wish.customerOpNumber.label"),
			"customer":message(code:"wish.customer.label"),"supplier":message(code:"wish.supplier.label"),"shipper":message(code:"wish.shipper.label"),
			"supplierOrder":message(code:"wish.supplierOrder.label")]
		
		
		Map formatters
		Map parameters = [title: message(code:'wish.label')]
		
		
		exportService.export(params.format,response.outputStream,Wish.list(params),fields,labels,formatters,parameters)	
		
		
	}

	def sendMail(){
		
		File file = new File("${message(code:'wish.label')}.${params.extension}")
		OutputStream outputStream = new FileOutputStream(file)
		
		List fields = ["opNumber","customerOpNumber","customer","supplier","shipper","supplierOrder"]
		Map labels = ["opNumber":message(code:"wish.opNumber.label"),"customerOpNumber":message(code:"wish.customerOpNumber.label"),
			"customer":message(code:"wish.customer.label"),"supplier":message(code:"wish.supplier.label"),"shipper":message(code:"wish.shipper.label"),
			"supplierOrder":message(code:"wish.supplierOrder.label")]
		Map formatters
		Map parameters = [title: message(code:'wish.label')]
		exportService.export(params.format,outputStream,Wish.list(params),fields,labels,formatters,parameters)
		
		
		sendMail {
			multipart true
			to "sebastiansanio@outlook.com"
			subject "${message(code:'wish.label')}"
			body "${message(code:'wish.label')}"
			attachBytes file.getName(),'application/vnd.ms-excel',file.readBytes()
				
		}
		file.delete()
		redirect(action: "list")
		
	}
	
    def create() {
        [wishInstance: new Wish(params)]
    }

    def save() {
        def wishInstance = new Wish(params)
        if (!wishInstance.save(flush: true)) {
            render(view: "create", model: [wishInstance: wishInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'wish.label', default: 'Wish'), wishInstance.id])
        redirect(action: "show", id: wishInstance.id)
    }

    def show() {
        def wishInstance = Wish.get(params.id)
        if (!wishInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'wish.label', default: 'Wish'), params.id])
            redirect(action: "list")
            return
        }

        [wishInstance: wishInstance]
    }

    def edit() {
        def wishInstance = Wish.get(params.id)
        if (!wishInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wish.label', default: 'Wish'), params.id])
            redirect(action: "list")
            return
        }

        [wishInstance: wishInstance]
    }

    def update() {
        def wishInstance = Wish.get(params.id)
        if (!wishInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wish.label', default: 'Wish'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (wishInstance.version > version) {
                wishInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'wish.label', default: 'Wish')] as Object[],
                          "Another user has updated this Wish while you were editing")
                render(view: "edit", model: [wishInstance: wishInstance])
                return
            }
        }

        wishInstance.properties = params

        if (!wishInstance.save(flush: true)) {
            render(view: "edit", model: [wishInstance: wishInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'wish.label', default: 'Wish'), wishInstance.id])
        redirect(action: "show", id: wishInstance.id)
    }

    def delete() {
        def wishInstance = Wish.get(params.id)
        if (!wishInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'wish.label', default: 'Wish'), params.id])
            redirect(action: "list")
            return
        }

        try {
            wishInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'wish.label', default: 'Wish'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'wish.label', default: 'Wish'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def viewPhotoContainer() {	
		def wishInstance = Wish.get(params.id)
       	if (!wishInstance) {
				flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'wish.label', default: 'Wish'), params.id])
			return
		}
		render(view: "viewPhoto", model: [pictureWish: wishInstance.picturesOfLoadingContainer])
	}

	def viewPhotoBoxes() {
		def wishInstance = Wish.get(params.id)
       	if (!wishInstance) {
				flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'wish.label', default: 'Wish'), params.id])
			return
		}
		render(view: "viewPhoto", model: [pictureWish: wishInstance.picturesOfPrintingBoxes])
	}
	
	def viewPicture(){
		def picture = Picture.get(params.id)
		response.setHeader("Content-disposition", "attachment; filename=${params.id}")
		response.outputStream << picture.image
		response.outputStream.flush()
		return
	}
}
