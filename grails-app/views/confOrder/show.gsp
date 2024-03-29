
<%@ page import="riseup.ConfOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'confOrder.label', default: 'ConfOrder')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-confOrder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-confOrder" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list confOrder">
			
				<g:if test="${confOrderInstance?.paymentType}">
				<li class="fieldcontain">
					<span id="paymentType-label" class="property-label"><g:message code="confOrder.paymentType.label" default="Payment Type" /></span>
					
						<span class="property-value" aria-labelledby="paymentType-label"><g:fieldValue bean="${confOrderInstance}" field="paymentType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${confOrderInstance?.checkReceived}">
				<li class="fieldcontain">
					<span id="checkReceived-label" class="property-label"><g:message code="confOrder.checkReceived.label" default="Check Received" /></span>
					
						<span class="property-value" aria-labelledby="checkReceived-label"><g:formatBoolean boolean="${confOrderInstance?.checkReceived}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${confOrderInstance?.attendees}">
				<li class="fieldcontain">
					<span id="attendees-label" class="property-label"><g:message code="confOrder.attendees.label" default="Attendees" /></span>
					
						<g:each in="${confOrderInstance.attendees}" var="a">
						<span class="property-value" aria-labelledby="attendees-label"><g:link controller="attendee" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${confOrderInstance?.buyer}">
				<li class="fieldcontain">
					<span id="buyer-label" class="property-label"><g:message code="confOrder.buyer.label" default="Buyer" /></span>
					
						<span class="property-value" aria-labelledby="buyer-label"><g:link controller="buyer" action="show" id="${confOrderInstance?.buyer?.id}">${confOrderInstance?.buyer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${confOrderInstance?.paid}">
				<li class="fieldcontain">
					<span id="paid-label" class="property-label"><g:message code="confOrder.paid.label" default="Paid" /></span>
					
						<span class="property-value" aria-labelledby="paid-label"><g:formatBoolean boolean="${confOrderInstance?.paid}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:confOrderInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${confOrderInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
