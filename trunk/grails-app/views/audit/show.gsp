<%@page import="org.hibernate.envers.RevisionType"%>
<%@ page import="audit.RevisionInformation" %>
<%@ page import="courier.*" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'audit.label', default: 'Audit')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-revisionInformation" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="revisionInformation.currentUser.label" default="Current User" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${revisionInformationInstance?.currentUser?.id}">${revisionInformationInstance?.currentUser?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="revisionInformation.timestamp.label" default="Timestamp" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${revisionInformationInstance?.timestamp}" /></td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="revisionInformation.details.label" default="Details" /></td>
				
				<td valign="top" class="value">
				<g:each in="${revisionInformationInstance.details.sort{it.className}}" var="detail">
				
					<g:set var="domainClassInstance" value="${grailsApplication.getDomainClass(detail.className)}"/>
					<g:set var="domainClassInstanceName" value="${(domainClassInstance.name.substring(0,1).toLowerCase() + domainClassInstance.name.substring(1))}"/>
					<g:set var="messageClass" value="${domainClassInstance.clazz.superclass ==  Object?domainClassInstance:grailsApplication.getDomainClass(domainClassInstance.clazz.superclass.name)}"/>
					<g:set var="messageClassName" value="${(messageClass.name.substring(0,1).toLowerCase() + messageClass.name.substring(1))}"/>
					
					<h5>
					${message(code:'revisionType.'+detail.revisionType.toString().toLowerCase()+'.label') + ' '+ message(code:domainClassInstanceName+'.label') + ' (id '+detail.entityId+')'}
					</h5>
					
										
					<g:each var="entityInstance" in="${grailsApplication.getDomainClass(detail.className).clazz.findAllRevisionsById(detail.entityId)}">
						<g:if test="${entityInstance.revisionEntity.id==revisionInformationInstance.id}">
							<g:set var="currentInstance" value="${entityInstance}"/>
						</g:if>
						<g:elseif test="${entityInstance.revisionEntity.id<revisionInformationInstance.id}">
							<g:set var="previousInstance" value="${entityInstance}"/>
						</g:elseif>								
					</g:each>
				
					<g:if test="${detail.revisionType == RevisionType.DEL}">
						<g:each var="prop" in="${domainClassInstance.persistentProperties}">						
							<g:if test="${!(prop.isOneToMany() || (prop.isManyToMany() && !(prop.isOwningSide())))}">
								<g:if test="${prop.type== byte[]}">
								<p>${message(code:messageClassName+'.'+prop.name+'.label') }</p>
								</g:if>
								<g:else>
								<p>${message(code:messageClassName+'.'+prop.name+'.label') + ' = '+previousInstance[prop.name]}</p>
								</g:else>
							</g:if>
							<g:else>
								<p>${message(code:messageClassName+'.'+prop.name+'.label') + ' (ids) = '+currentInstance[prop.name]*.id.toString()}</p>
							</g:else>
						</g:each>
					</g:if>

					<g:if test="${detail.revisionType == RevisionType.ADD}">
						<g:each var="prop" in="${domainClassInstance.persistentProperties}">						
							<g:if test="${!(prop.isOneToMany() || (prop.isManyToMany() && !(prop.isOwningSide())))}">
								<g:if test="${prop.type== byte[]}">
								<p>${message(code:messageClassName+'.'+prop.name+'.label') }</p>
								</g:if>
								<g:else>
								<p>${message(code:messageClassName+'.'+prop.name+'.label') + ' = '+currentInstance[prop.name]}</p>
								</g:else>
							</g:if>
							<g:else>
								<p>${message(code:messageClassName+'.'+prop.name+'.label') + ' (ids) = '+currentInstance[prop.name]*.id.toString()}</p>
							</g:else>
						</g:each>
					</g:if>

					<g:if test="${detail.revisionType == RevisionType.MOD}">
						
						${message(code:'revisionInformation.id.label') + ': '}
						<g:link action="show" id="${previousInstance.revisionEntity.id}"> ${previousInstance.revisionEntity.id}</g:link>
						${' > '+ currentInstance.revisionEntity.id}
						
						<g:each var="prop" in="${domainClassInstance.persistentProperties}">						
						
							<g:if test="${!(prop.isOneToMany() || (prop.isManyToMany() && !(prop.isOwningSide())))}">
								<g:if test="${previousInstance[prop.name].hasProperty('id')?previousInstance[prop.name].id!=currentInstance[prop.name].id:previousInstance[prop.name]!=currentInstance[prop.name]}">
									<g:if test="${prop.type== byte[]}">
									<p>${message(code:messageClassName+'.'+prop.name+'.label') }</p>
									</g:if>
									<g:else>
									<p>${message(code:messageClassName+'.'+prop.name+'.label') + ': ' + previousInstance[prop.name].toString() + ' > '+ currentInstance[prop.name].toString()} </p>
									</g:else>
								</g:if>
							</g:if>
							<g:else>
								<g:if test="${!previousInstance[prop.name]*.id.toSet().equals(currentInstance[prop.name]*.id.toSet())}">
									<p>${message(code:messageClassName+'.'+prop.name+'.label') + ' (ids) : ' + previousInstance[prop.name]*.id.toString() + ' > '+ currentInstance[prop.name]*.id.toString()} </p>
								</g:if>								
							</g:else>
							
						</g:each>
					</g:if>

				
				</g:each>
				</td>
				
			</tr>
		
		</tbody>
	</table>
		
</section>

</body>

</html>
