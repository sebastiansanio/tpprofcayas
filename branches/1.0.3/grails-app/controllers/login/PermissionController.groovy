package login

import org.springframework.dao.DataIntegrityViolationException


import org.springframework.transaction.annotation.Transactional


@Transactional
class PermissionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		params.sort = params.sort?: 'description'
        params.max = Math.min(params.max ? params.int('max') : 100, 500)
        [permissionInstanceList: Permission.list(params), permissionInstanceTotal: Permission.count()]
    }

    def create() {
        [permissionInstance: new Permission(params)]
    }

    def save() {
        def permissionInstance = new Permission(params)
        if (!permissionInstance.save(flush: true)) {
            render(view: "create", model: [permissionInstance: permissionInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'permission.label', default: 'Permission'), permissionInstance.id])
        redirect(action: "show", id: permissionInstance.id)
    }

    def show() {
        def permissionInstance = Permission.get(params.id)
        if (!permissionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'permission.label', default: 'Permission'), params.id])
            redirect(action: "list")
            return
        }

        [permissionInstance: permissionInstance]
    }

    def edit() {
        def permissionInstance = Permission.get(params.id)
        if (!permissionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'permission.label', default: 'Permission'), params.id])
            redirect(action: "list")
            return
        }

        [permissionInstance: permissionInstance]
    }

    def update() {
        def permissionInstance = Permission.get(params.id)
        if (!permissionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'permission.label', default: 'Permission'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (permissionInstance.version > version) {
                permissionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'permission.label', default: 'Permission')] as Object[],
                          "Another user has updated this Permission while you were editing")
                render(view: "edit", model: [permissionInstance: permissionInstance])
                return
            }
        }

        permissionInstance.properties = params

        if (!permissionInstance.save(flush: true)) {
            render(view: "edit", model: [permissionInstance: permissionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'permission.label', default: 'Permission'), permissionInstance.id])
        redirect(action: "show", id: permissionInstance.id)
    }

    def delete() {
        def permissionInstance = Permission.get(params.id)
        if (!permissionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'permission.label', default: 'Permission'), params.id])
            redirect(action: "list")
            return
        }

        try {
            permissionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'permission.label', default: 'Permission'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'permission.label', default: 'Permission'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
