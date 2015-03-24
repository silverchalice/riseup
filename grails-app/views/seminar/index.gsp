
<%@ page import="riseup.Seminar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'seminar.label', default: 'Seminar')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-seminar" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-seminar" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'seminar.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="room1" title="${message(code: 'seminar.room1.label', default: 'Room1')}" />
					
						<g:sortableColumn property="room2" title="${message(code: 'seminar.room2.label', default: 'Room2')}" />
					
						<g:sortableColumn property="slot1" title="${message(code: 'seminar.slot1.label', default: 'Slot1')}" />
					
						<g:sortableColumn property="slot2" title="${message(code: 'seminar.slot2.label', default: 'Slot2')}" />
					
						<th><g:message code="seminar.speaker.label" default="Speaker" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${seminarInstanceList}" status="i" var="seminarInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${seminarInstance.id}">${fieldValue(bean: seminarInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: seminarInstance, field: "room1")}</td>
					
						<td>${fieldValue(bean: seminarInstance, field: "room2")}</td>
					
						<td>${fieldValue(bean: seminarInstance, field: "slot1")}</td>
					
						<td>${fieldValue(bean: seminarInstance, field: "slot2")}</td>
					
						<td>${fieldValue(bean: seminarInstance, field: "speaker")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${seminarInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
