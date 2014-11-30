<%@ page import="product.Extra" %>



			<div class="control-group fieldcontain ${hasErrors(bean: extraInstance, field: 'description', 'error')} required">
				<label for="description" class="control-label"><g:message code="extra.description.label" default="Description" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="description" required="" value="${extraInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: extraInstance, field: 'description', 'error')}</span>
				</div>
			</div>


			<div class="control-group fieldcontain ${hasErrors(bean: extraInstance, field: 'equation', 'error')} required">
				<p>${message(code:"extra.ecuation.description", default:"")}</p>

				<div class="atributos">
					<span class="badge badge-info" data-name="articlesPerContainer">${message(code: 'aluminum.articlesPerContainer.label', default: 'Articles per Container')}</span>
					<span class="badge badge-info" data-name="sectionalL">${message(code: 'aluminum.sectionalL.label', default: 'Sectional L')}</span>
					<span class="badge badge-info" data-name="sectionalW">${message(code: 'aluminum.sectionalW.label', default: 'Sectional W')}</span>
					<span class="badge badge-info" data-name="externalProfileL">${message(code: 'aluminum.externalProfileL.label', default: 'External Profile L')}</span>
					<span class="badge badge-info" data-name="externalProfileW">${message(code: 'aluminum.externalProfileW.label', default: 'External Profile W')}</span>
					<span class="badge badge-info" data-name="length">${message(code: 'aluminum.length.label', default: 'Length')}</span>
					<span class="badge badge-info" data-name="theoricalWeight">${message(code: 'aluminum.theoricalWeight.label', default: 'Theorical Weight')}</span>
					<span class="badge badge-info" data-name="realWeight">${message(code: 'aluminum.realWeight.label', default: 'Real Weight')}</span>
					<span class="badge badge-info" data-name="pcsBundle">${message(code: 'aluminum.pcsBundle.label', default: 'Pcs Bundle')}</span>
					<span class="badge badge-info" data-name="volumenPerBox">${message(code: 'aluminum.volumenPerBox.label', default: 'Volumen Per Box')}</span>
					<span class="badge badge-info" data-name="weightPCS">${message(code: 'aluminum.weightPCS.label', default: 'Weight PCS')}</span>
					<span class="badge badge-info" data-name="cBMPerBundle">${message(code: 'aluminum.cBMPerBundle.label', default: 'CBM Per Bundle')}</span>
					<span class="badge badge-info" data-name="theoreticalWeightOfPerBundle">${message(code: 'aluminum.theoreticalWeightOfPerBundle.label', default: 'Theoretical Weight of per Bundle')}</span>

				</div>

				<label for="equation" class="control-label"><g:message code="extra.equation.label" default="Equation" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textArea name="equation" required="" value="${extraInstance?.equation}" rows="5"/>
					<span class="help-inline">${hasErrors(bean: extraInstance, field: 'equation', 'error')}</span>
				</div>
			</div>

