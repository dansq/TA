<%@ page import="ta.Registered" %>

<div class="fieldcontain ${hasErrors(bean: registeredInstance, field: 'stdt', 'error')} required">
	<label for="stdt">
		<g:message code="registered.stdt.label" default="Stdt" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="stdt" name="stdt.id" from="${ta.Student.list()}" optionKey="id" required="" value="${registeredInstance?.stdt?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: registeredInstance, field: 'turma', 'error')} required">
	<label for="turma">
		<g:message code="registered.turma.label" default="Turma" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="turma" name="turma.id" from="${ta.Turma.list()}" optionKey="id" required="" value="${registeredInstance?.turma?.id}" class="many-to-one"/>

</div>

