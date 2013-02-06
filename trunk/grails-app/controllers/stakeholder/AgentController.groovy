package stakeholder

import org.springframework.dao.DataIntegrityViolationException

/**
 * AgentController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class AgentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [agentInstanceList: Agent.list(params), agentInstanceTotal: Agent.count()]
    }

    def create() {
        [agentInstance: new Agent(params)]
    }

    def save() {
        def agentInstance = new Agent(params)
        if (!agentInstance.save(flush: true)) {
            render(view: "create", model: [agentInstance: agentInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'agent.label', default: 'Agent'), agentInstance.id])
        redirect(action: "show", id: agentInstance.id)
    }

    def show() {
        def agentInstance = Agent.get(params.id)
        if (!agentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'agent.label', default: 'Agent'), params.id])
            redirect(action: "list")
            return
        }

        [agentInstance: agentInstance]
    }

    def edit() {
        def agentInstance = Agent.get(params.id)
        if (!agentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'agent.label', default: 'Agent'), params.id])
            redirect(action: "list")
            return
        }

        [agentInstance: agentInstance]
    }

    def update() {
        def agentInstance = Agent.get(params.id)
        if (!agentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'agent.label', default: 'Agent'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (agentInstance.version > version) {
                agentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'agent.label', default: 'Agent')] as Object[],
                          "Another user has updated this Agent while you were editing")
                render(view: "edit", model: [agentInstance: agentInstance])
                return
            }
        }

        agentInstance.properties = params

        if (!agentInstance.save(flush: true)) {
            render(view: "edit", model: [agentInstance: agentInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'agent.label', default: 'Agent'), agentInstance.id])
        redirect(action: "show", id: agentInstance.id)
    }

    def delete() {
        def agentInstance = Agent.get(params.id)
        if (!agentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'agent.label', default: 'Agent'), params.id])
            redirect(action: "list")
            return
        }

        try {
            agentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'agent.label', default: 'Agent'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'agent.label', default: 'Agent'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
