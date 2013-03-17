<%@ page import="wish.Wish" %>

<g:each in="${notes}" var="note">
	<div class="note-user">
		<div class="note-username"> 
			${note?.user} 
			<div class="note-userdate"> ${note?.dateCreated?.format("dd/MM/yyyy")} </div>
		</div>
		<div class="note-usermessage">
			${note?.text}
		</div>
	</div>
</g:each>