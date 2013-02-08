<%@ page import="wish.Wish" %>
<%@ page import="wish.Note" %>
<%@ page import="login.User" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>

<script type="text/javascript">

	var notesCount = ${wishInstance?.notes?.size()} + 0;

	function addNote(){
		var htmlId = "note" + notesCount;

		var templateHtml = "<div class='row' id='" + htmlId + "' name='" + htmlId +"'>";	

		templateHtml += "<div class='control-group'>";
		templateHtml += "<label for='text' class='control-label'>";
		templateHtml += "${message(code:'note.text.label')}";
		templateHtml += "</label>";
		templateHtml += "<div class='controls'>";
		templateHtml += "<textarea row='5' type='text' name='notes["+notesCount+"].text' />";
		templateHtml += "</div>";
		templateHtml += "</div>";


		templateHtml += "<div class='control-group required'>";
		templateHtml += "<label for='user' class='control-label'>";
		templateHtml += "${message(code:'note.user.label')}";
		templateHtml += "</label>";
		templateHtml += "<div class='controls'>";
		templateHtml += "<select id='notes["+notesCount+"].user' name='notes["+notesCount+"].user.id'>";
		<%
		User.findAll().each{
			out.println(""" templateHtml += "<option value='${it.id}'>${it}</option>" """)
			
		}
		
		%>
		templateHtml += "</select>";
		templateHtml += "</div>";
		templateHtml += "</div>";	

		templateHtml += "</div";
		
		$("#notesChildList").append(templateHtml);			
		notesCount++;
				
	}

	
</script>


<div id="notesChildList">
	
	<g:each var="noteInstance" in="${wishInstance?.notes}" status="i">
	
	<div class="row">
		
			<div class="control-group fieldcontain ${hasErrors(bean: noteInstance, field: 'text', 'error')} ">
				<label for="text" class="control-label"><g:message code="note.text.label" default="Text" /></label>
				<div class="controls">
					<textarea rows='5' name="notes[${i}].text" >${noteInstance?.text}</textarea>
					<span class="help-inline">${hasErrors(bean: noteInstance, field: 'text', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: noteInstance, field: 'user', 'error')} required">
				<label for="user" class="control-label"><g:message code="note.user.label" default="User" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="notes[${i}].user" name="notes[${i}].user.id" from="${login.User.list()}" optionKey="id" required="" value="${noteInstance?.user?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: noteInstance, field: 'user', 'error')}</span>
				</div>
			</div>
	</div>
	</g:each>
	
	
</div>


			


<input type="button" class="btn btn-inverse" value="${message(code:'wish.notes.add')}" onClick="addNote();" />
