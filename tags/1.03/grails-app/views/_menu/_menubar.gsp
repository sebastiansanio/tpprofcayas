<%@ page import="org.apache.shiro.SecurityUtils" %>

<g:if test="${session.layout == null || session.layout == 'grid'}">
	<g:set var="menutype" value="nav nav-tabs" />
</g:if>
<g:elseif test="${session.layout == 'fluid'}">
	<g:set var="menutype" value="nav nav-tabs" />
</g:elseif>


<g:if test="${session.menuposition == 'right' && session.layout == 'grid'}">
	<g:set var="menuposition" value="pull-right" />
</g:if>
<g:elseif test="${session.menuposition == 'right' && session.layout == 'fluid'}">
	<g:set var="menuposition" value="tabbable tabs-right" />
</g:elseif>
<g:elseif test="${session.layout == 'fluid'}">
	<g:set var="menuposition" value="tabbable tabs-left" />
</g:elseif>
<g:else>
	<g:set var="menuposition" value="" />
</g:else>


<div class="${menuposition}">
	<ul id="menuPpal" class="${menutype} bs-docs-sidenavMenu" data-role="listview" data-split-icon="gear" data-filter="true">
		<g:each status="i" var="c" in="${grailsApplication.controllerClasses.sort { it.logicalPropertyName}}">			
			<g:if test="${c.logicalPropertyName=='main' || SecurityUtils.subject.isPermitted(c.logicalPropertyName+":index")}">
				<li class="controller${params.controller == c.logicalPropertyName ? " active" : ""}">
					<g:link controller="${c.logicalPropertyName}" action="index"><g:message code="${c.logicalPropertyName}.label" default="${c.logicalPropertyName.capitalize()}"/></g:link>
				</li>
			</g:if>
		</g:each>
	</ul>
</div>