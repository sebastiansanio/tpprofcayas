<%@ page import="org.apache.shiro.SecurityUtils" %>


<g:if test="${	params.controller != null
			&&	params.controller != ''

}">
	<ul id="Menu" class="nav nav-pills">

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
		
	</ul>
</g:if>
