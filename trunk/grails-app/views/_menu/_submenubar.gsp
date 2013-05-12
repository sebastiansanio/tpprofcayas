<%@ page import="org.apache.shiro.SecurityUtils" %>


<g:if test="${	params.controller != null
			&&	params.controller != ''

}">
	<ul id="Menu" class="nav nav-list bs-docs-sidenav" data-spy="affix" style="width: 10%">

		<g:set var="entityName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />
		
		<g:if test="${ SecurityUtils.subject.isPermitted(params.controller+":list") && grailsApplication.controllerClasses.find{it.logicalPropertyName == params.controller}.uris.contains('/'+params.controller+'/list')}">									
			<li class="${ params.action == "list" ? 'active' : '' }">
				<g:link action="list"><i class="icon-th-list"></i> <g:message code="default.list.label" args="[entityName]"/></g:link>
			</li>
		</g:if>
		
		<g:if test="${ SecurityUtils.subject.isPermitted(params.controller+":listInspected") && grailsApplication.controllerClasses.find{it.logicalPropertyName == params.controller}.uris.contains('/'+params.controller+'/listInspected')}">									
			<li class="${ params.action == "listInspected" ? 'active' : '' }">
				<g:link action="listInspected"><i class="icon-th-list"></i> <g:message code="default.listInspected.label" args="[entityName]"/></g:link>
			</li>
		</g:if>
		
		<g:if test="${ SecurityUtils.subject.isPermitted(params.controller+":listPending") && grailsApplication.controllerClasses.find{it.logicalPropertyName == params.controller}.uris.contains('/'+params.controller+'/listPending')}">									
			<li class="${ params.action == "listPending" ? 'active' : '' }">
				<g:link action="listPending"><i class="icon-th-list"></i> <g:message code="default.listPending.label" args="[entityName]"/></g:link>
			</li>
		</g:if>
				
		
		<g:if test="${ SecurityUtils.subject.isPermitted(params.controller+":create") && grailsApplication.controllerClasses.find{it.logicalPropertyName == params.controller}.uris.contains('/'+params.controller+'/create')}">			
			<li class="${ params.action == "create" ? 'active' : '' }">
				<g:link action="create"><i class="icon-plus"></i> <g:message code="default.new.label"  args="[entityName]"/></g:link>
			</li>
		</g:if>
		
		<g:if test="${ (params.action == 'show' || params.action == 'edit')}">
			<g:if test="${ SecurityUtils.subject.isPermitted(params.controller+":edit") && grailsApplication.controllerClasses.find{it.logicalPropertyName == params.controller}.uris.contains('/'+params.controller+'/edit')}">
				<li class="${ params.action == "edit" ? 'active' : '' }">
					<g:link action="edit" id="${params.id}"><i class="icon-pencil"></i> <g:message code="default.edit.label"  args="[entityName]"/></g:link>
				</li>
			</g:if>
			<g:if test="${ SecurityUtils.subject.isPermitted(params.controller+":delete") && grailsApplication.controllerClasses.find{it.logicalPropertyName == params.controller}.uris.contains('/'+params.controller+'/delete')}">
				<li class="">
					<g:render template="/_common/modals/deleteTextLink" plugin="SPECTRAwebPlugin"/>
				</li>
			</g:if>
		</g:if>
		
		<g:if test="${ SecurityUtils.subject.isPermitted(params.controller+":query") && grailsApplication.controllerClasses.find{it.logicalPropertyName == params.controller}.uris.contains('/'+params.controller+'/query')}">									
			<li class="${ params.action == "query" ? 'active' : '' }">
				<g:link action="query"><i class="icon-th-list"></i> <g:message code="default.query.label" args="[entityName]"/></g:link>
			</li>
		</g:if>

		<g:if test="${ SecurityUtils.subject.isPermitted(params.controller+":importForm") && grailsApplication.controllerClasses.find{it.logicalPropertyName == params.controller}.uris.contains('/'+params.controller+'/importForm')}">									
			<li class="${ params.action == "importForm" ? 'active' : '' }">
				<g:link action="importForm"><i class="icon-plus"></i> <g:message code="default.import.label" args="[entityName]"/></g:link>
			</li>
		</g:if>
		
		<g:if test="${ SecurityUtils.subject.isPermitted(params.controller+":listBilled") && grailsApplication.controllerClasses.find{it.logicalPropertyName == params.controller}.uris.contains('/'+params.controller+'/listBilled')}">									
			<li class="${ params.action == "listBilled" ? 'active' : '' }">
				<g:link action="listBilled"><i class="icon-th-list"></i> <g:message code="default.listBilled.label" args="[entityName]"/></g:link>
			</li>
		</g:if>
		
		<g:if test="${ SecurityUtils.subject.isPermitted(params.controller+":listFinished") && grailsApplication.controllerClasses.find{it.logicalPropertyName == params.controller}.uris.contains('/'+params.controller+'/listFinished')}">									
			<li class="${ params.action == "listFinished" ? 'active' : '' }">
				<g:link action="listFinished"><i class="icon-th-list"></i> <g:message code="default.listFinished.label" args="[entityName]"/></g:link>
			</li>
		</g:if>
		
		
	</ul>
</g:if>
