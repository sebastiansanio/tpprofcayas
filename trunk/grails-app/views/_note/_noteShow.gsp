<h4> <g:message code="notes.label" default="Notes"/> </h4>

<div class="row-fluid">

<div class="span11">
<g:each in="${notes}" var="note">
	<div class="note-user">
		<div class="note-username"> 
			${note.user} 
			<div class="note-userdate"> ${note.dateCreated?.format("dd/MM/yyyy")} </div>
		</div>
		<div class="note-usermessage">
			${note.text}
		</div>
	</div>
</g:each>
</div>
</div>