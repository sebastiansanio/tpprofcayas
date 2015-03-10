package wish

import login.User
import org.apache.jasper.compiler.Node.ParamsAction
import org.apache.shiro.SecurityUtils
import org.springframework.dao.DataIntegrityViolationException

import stakeholder.Supplier
import product.Aluminum
import product.Extra

class AluminumWishController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST", getAluminum:"GET"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [aluminumWishInstanceList: AluminumWish.list(params), aluminumWishInstanceTotal: AluminumWish.count()]
    }

    def create() {
        [aluminumWishInstance: new AluminumWish(params)]
    }

    def save() {
	
		def aluminumWishInstance = new AluminumWish(params)

		def subwishNumber = 0
		aluminumWishInstance.subWish.each { subwish ->
			def extras = params.list('subWish[' + subwishNumber + '].extras.id') as List

			extras.each { idExtra ->
				def extra = product.Extra.get( idExtra.toLong() )
				subwish.addToExtras( extra )
			}
			
			subwishNumber++
		}

		
        if (!aluminumWishInstance.save(flush: true)) {
            render(view: "create", model: [aluminumWishInstance: aluminumWishInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'aluminumWish.label', default: 'AluminumWish'), aluminumWishInstance.id])
        redirect(action: "show", id: aluminumWishInstance.id)
    }

    def show() {
        
        def aluminumWishInstance = AluminumWish.get(params.id)
        if (!aluminumWishInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'aluminumWish.label', default: 'AluminumWish'), params.id])
            redirect(action: "list")
            return
        }

        if ( User.findByUsername( SecurityUtils.subject.principal ).permissions.find{ it == "aluminumWish:showDetail"  } ) {
            render view:'showDetail', model:[ aluminumWishInstance: aluminumWishInstance]
            return
        }
        
        [aluminumWishInstance: aluminumWishInstance]
    }

    def showDetail() {
        def aluminumWishInstance = AluminumWish.get(params.id)
        [aluminumWishInstance: aluminumWishInstance]
    }

    def edit() {
        def aluminumWishInstance = AluminumWish.get(params.id)
        if (!aluminumWishInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'aluminumWish.label', default: 'AluminumWish'), params.id])
            redirect(action: "list")
            return
        }

        [aluminumWishInstance: aluminumWishInstance]
    }

    def update() {
        def aluminumWishInstance = AluminumWish.get(params.id)
        if (!aluminumWishInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'aluminumWish.label', default: 'AluminumWish'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (aluminumWishInstance.version > version) {
                aluminumWishInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'aluminumWish.label', default: 'AluminumWish')] as Object[],
                          "Another user has updated this AluminumWish while you were editing")
                render(view: "edit", model: [aluminumWishInstance: aluminumWishInstance])
                return
            }
        }

        aluminumWishInstance.properties = params

		def subwishNumber = 0
		aluminumWishInstance.subWish.each { subwish ->
			def extras = params.list('subWish[' + subwishNumber + '].extras.id') as List
            
            subwish.extras.clear()
            
            extras.each { idExtra ->
                def extra = product.Extra.get( idExtra.toLong() )
                subwish.addToExtras( extra )
            }
            
			subwishNumber++
		}
		
        if (!aluminumWishInstance.save(flush: true)) {
            render(view: "edit", model: [aluminumWishInstance: aluminumWishInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'aluminumWish.label', default: 'AluminumWish'), aluminumWishInstance.id])
        redirect(action: "show", id: aluminumWishInstance.id)
    }

    def delete() {
        def aluminumWishInstance = AluminumWish.get(params.id)
        if (!aluminumWishInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'aluminumWish.label', default: 'AluminumWish'), params.id])
            redirect(action: "list")
            return
        }

        try {
            aluminumWishInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'aluminumWish.label', default: 'AluminumWish'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'aluminumWish.label', default: 'AluminumWish'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def deleteSubWish() {
		def subwish = AluminumSubWish.get(params.id)
		def idWish = subwish.wish.id
		if (!subwish) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'aluminumSubWish.label', default: 'Aluminum Wish'), params.id])
			redirect(action: "list")
		}
		
		try {
			subwish.wish.removeFromSubWish(subwish)
			subwish .delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'aluminumSubWish.label', default: 'Aluminum Wish'), params.id])
			redirect(action: "edit", id: idWish)
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'aluminumSubWish.label', default: 'Aluminum Wish'), params.id])
			redirect(action: "edit", id: idWish)
		}
	}

    /**
    * Retorna un html con todos los perfiles de aluminio correspondientes al proveedor cuyo identificador se recibe
    */
    def getAluminum() {
        def supplier = Supplier.get( params.id.toLong() )

        /* si no encuentra el proveedor, mensaje de proveedor no encontrado*/
        if ( !supplier ) {
            render message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])
            return
        }

        render (template: "subwishForm", model:[ supplier: supplier, number: params.number ])
    }
}
