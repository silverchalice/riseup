
<%@ page import="riseup.TicketType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ticketType.label', default: 'TicketType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ticketType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ticketType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="comments" title="${message(code: 'ticketType.comments.label', default: 'Comments')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'ticketType.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'ticketType.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="roomSize" title="${message(code: 'ticketType.roomSize.label', default: 'Room Size')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ticketTypeInstanceList}" status="i" var="ticketTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ticketTypeInstance.id}">${fieldValue(bean: ticketTypeInstance, field: "comments")}</g:link></td>
					
						<td>${fieldValue(bean: ticketTypeInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: ticketTypeInstance, field: "price")}</td>
					
						<td>${fieldValue(bean: ticketTypeInstance, field: "roomSize")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ticketTypeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
