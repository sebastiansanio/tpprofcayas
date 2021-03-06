<%@ page import="product.Family" %>



			<div class="control-group fieldcontain ${hasErrors(bean: familyInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="family.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${familyInstance?.description}" required=""/>
					<span class="help-inline">${hasErrors(bean: familyInstance, field: 'description', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: familyInstance, field: 'margin', 'error')} ">
				<label for="margin" class="control-label"><g:message code="family.margin.label" default="Margin" /></label>
				<div class="controls">
					<g:field type="number" name="margin" step="any" value="${familyInstance.margin}" required=""/>
					<span class="help-inline">${hasErrors(bean: familyInstance, field: 'margin', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: familyInstance, field: 'subFamily', 'error')} ">
				<label for="subFamily" class="control-label"><g:message code="family.subFamily.label" default="Sub Family" /></label>
				<div class="controls">
					
					<ul class="one-to-many">
						<g:each in="${familyInstance?.subFamily?}" var="s">
						    <li><g:link controller="subFamily" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
						</g:each>
						<li class="add">
							<g:link controller="subFamily" action="create" params="['family.id': familyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'subFamily.label', default: 'SubFamily')])}</g:link>
						</li>
					</ul>

					<span class="help-inline">${hasErrors(bean: familyInstance, field: 'subFamily', 'error')}</span>
				</div>
			</div>