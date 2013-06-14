// Place your Spring DSL code here
beans = {
	customPropertyEditorRegistrar(etc.CustomDataBinding)
	System.setProperty('org.hibernate.envers.audit_table_prefix', 'AUD_')
	System.setProperty('org.hibernate.envers.audit_table_suffix', '')
}
