	<a href="#DeleteModal" role="button" class="btn btn-danger btn-small" data-toggle="modal" title="${message(code: 'default.button.delete.label', default: 'Delete')}">
		<i class="icon-trash icon-large"></i>
	</a>
	<g:render template="/_common/modals/deleteDialog" model="[item: item]"/>
