
<%@ page import="riseup.Attendee" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'attendee.label', default: 'Attendee')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-attendee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-attendee" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'attendee.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'attendee.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="age" title="${message(code: 'attendee.age.label', default: 'Age')}" />
					
						<g:sortableColumn property="gender" title="${message(code: 'attendee.gender.label', default: 'Gender')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'attendee.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="phone" title="${message(code: 'attendee.phone.label', default: 'Phone')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${attendeeInstanceList}" status="i" var="attendeeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${attendeeInstance.id}">${fieldValue(bean: attendeeInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: attendeeInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: attendeeInstance, field: "age")}</td>
					
						<td>${fieldValue(bean: attendeeInstance, field: "gender")}</td>
					
						<td>${fieldValue(bean: attendeeInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: attendeeInstance, field: "phone")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${attendeeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
