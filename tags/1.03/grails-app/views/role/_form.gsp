<%@page import="java.security.Permission"%>
<%@ page import="login.Role" %>
<%@ page import="login.Permission" %>



			<div class="control-group fieldcontain ${hasErrors(bean: roleInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="role.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${roleInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: roleInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: roleInstance, field: 'permissions', 'error')} ">
				<label for="permissions" class="control-label"><g:message code="role.permissions.label" default="Permissions" /></label>
				<div class="controls">
				<div class="row-fluid">
					<div class="span4">
					<g:select size="15" id="avPermissions" multiple="multiple" name="avPermissions" from="${Permission.list([sort:'description']).findAll{!(it.permissionString in roleInstance?.permissions)}}" value="${roleInstance?.permissions}" optionKey="permissionString" />
					</div>
					
					<div class="span2">
					<p><button class="span12" type="button" onClick="addPermissions();">${message(code:'add.label')} </button></p>
					<p><button class="span12" type="button" onClick="removePermissions();"> ${message(code:'remove.label')} </button></p>
					</div>
					
					<div class="span4">
					<g:select size="15" id="permissions" multiple="multiple" name="permissions" from="${Permission.findAllByPermissionStringInList(roleInstance?.permissions,[sort:'description'])}" optionKey="permissionString" />
					</div>
					<span class="help-inline">${hasErrors(bean: roleInstance, field: 'permissions', 'error')}</span>
				</div>
				</div>
			</div>

<script>
function addPermissions(){
	$("#avPermissions :selected").appendTo("#permissions");
	
}

function removePermissions(){
	$("#permissions :selected").appendTo("#avPermissions");
}

$('form').submit(function(){
	$("#permissions option").attr('selected','selected');
}
)


</script>
