package modal

import org.springframework.dao.DataIntegrityViolationException


import org.springframework.transaction.annotation.Transactional
import wish.Document


@Transactional
class DocumentTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.sort = params.sort?: 'name'
        params.max = Math.min(params.max ? params.int('max') : 100, 200)
        [documentTypeInstanceList: DocumentType.list(params), documentTypeInstanceTotal: DocumentType.count()]
    }

    def create() {
        [documentTypeInstance: new DocumentType(params)]
    }

    def save() {
        def documentTypeInstance = new DocumentType(params)
        if (!documentTypeInstance.save(flush: true)) {
            render(view: "create", model: [documentTypeInstance: documentTypeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'documentType.label', default: 'DocumentType'), documentTypeInstance.id])
        redirect(action: "show", id: documentTypeInstance.id)
    }

    def show() {
        def documentTypeInstance = DocumentType.get(params.id)
        if (!documentTypeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'documentType.label', default: 'DocumentType'), params.id])
            redirect(action: "list")
            return
        }

        [documentTypeInstance: documentTypeInstance]
    }

    def edit() {
        def documentTypeInstance = DocumentType.get(params.id)
        if (!documentTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'documentType.label', default: 'DocumentType'), params.id])
            redirect(action: "list")
            return
        }

        [documentTypeInstance: documentTypeInstance]
    }

    def update() {
        def documentTypeInstance = DocumentType.get(params.id)
        if (!documentTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'documentType.label', default: 'DocumentType'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (documentTypeInstance.version > version) {
                documentTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'documentType.label', default: 'DocumentType')] as Object[],
                          "Another user has updated this DocumentType while you were editing")
                render(view: "edit", model: [documentTypeInstance: documentTypeInstance])
                return
            }
        }

        documentTypeInstance.properties = params

        if (!documentTypeInstance.save(flush: true)) {
            render(view: "edit", model: [documentTypeInstance: documentTypeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'documentType.label', default: 'DocumentType'), documentTypeInstance.id])
        redirect(action: "show", id: documentTypeInstance.id)
    }

    def delete() {
        def documentTypeInstance = DocumentType.get(params.id)
        if (!documentTypeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'documentType.label', default: 'DocumentType'), params.id])
            redirect(action: "list")
            return
        }
		if(Document.countByDocumentType(documentTypeInstance)>0){
			flash.message = message(code:'default.delete.error.message',args: [message(code: 'documentType.label'),message(code: 'document.label')])
			redirect(action: "show", id: params.id)
			return
		}
        try {
            documentTypeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'documentType.label', default: 'DocumentType'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'documentType.label', default: 'DocumentType'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
