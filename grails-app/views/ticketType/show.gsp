
<%@ page import="riseup.TicketType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ticketType.label', default: 'TicketType')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ticketType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ticketType" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ticketType">
			
				<g:if test="${ticketTypeInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="ticketType.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${ticketTypeInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketTypeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="ticketType.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${ticketTypeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketTypeInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="ticketType.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${ticketTypeInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketTypeInstance?.roomSize}">
				<li class="fieldcontain">
					<span id="roomSize-label" class="property-label"><g:message code="ticketType.roomSize.label" default="Room Size" /></span>
					
						<span class="property-value" aria-labelledby="roomSize-label"><g:fieldValue bean="${ticketTypeInstance}" field="roomSize"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:ticketTypeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${ticketTypeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
