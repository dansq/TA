
<%@ page import="ta.Registered" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registered.label', default: 'Registered')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-registered" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-registered" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="registered.stdt.label" default="Stdt" /></th>
					
						<th><g:message code="registered.turma.label" default="Turma" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${registeredInstanceList}" status="i" var="registeredInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${registeredInstance.id}">${fieldValue(bean: registeredInstance, field: "stdt")}</g:link></td>
					
						<td>${fieldValue(bean: registeredInstance, field: "turma")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${registeredInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
