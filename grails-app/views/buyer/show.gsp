
<%@ page import="riseup.Buyer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'buyer.label', default: 'Buyer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-buyer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-buyer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list buyer">
			
				<g:if test="${buyerInstance?.address1}">
				<li class="fieldcontain">
					<span id="address1-label" class="property-label"><g:message code="buyer.address1.label" default="Address1" /></span>
					
						<span class="property-value" aria-labelledby="address1-label"><g:fieldValue bean="${buyerInstance}" field="address1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${buyerInstance?.address2}">
				<li class="fieldcontain">
					<span id="address2-label" class="property-label"><g:message code="buyer.address2.label" default="Address2" /></span>
					
						<span class="property-value" aria-labelledby="address2-label"><g:fieldValue bean="${buyerInstance}" field="address2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${buyerInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="buyer.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${buyerInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${buyerInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="buyer.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${buyerInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${buyerInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="buyer.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${buyerInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${buyerInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="buyer.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${buyerInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${buyerInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="buyer.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${buyerInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${buyerInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="buyer.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${buyerInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:buyerInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${buyerInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
