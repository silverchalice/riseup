
<%@ page import="riseup.Seminar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'seminar.label', default: 'Seminar')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-seminar" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-seminar" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list seminar">
			
				<g:if test="${seminarInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="seminar.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${seminarInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seminarInstance?.room1}">
				<li class="fieldcontain">
					<span id="room1-label" class="property-label"><g:message code="seminar.room1.label" default="Room1" /></span>
					
						<span class="property-value" aria-labelledby="room1-label"><g:fieldValue bean="${seminarInstance}" field="room1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seminarInstance?.room2}">
				<li class="fieldcontain">
					<span id="room2-label" class="property-label"><g:message code="seminar.room2.label" default="Room2" /></span>
					
						<span class="property-value" aria-labelledby="room2-label"><g:fieldValue bean="${seminarInstance}" field="room2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seminarInstance?.slot1}">
				<li class="fieldcontain">
					<span id="slot1-label" class="property-label"><g:message code="seminar.slot1.label" default="Slot1" /></span>
					
						<span class="property-value" aria-labelledby="slot1-label"><g:fieldValue bean="${seminarInstance}" field="slot1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seminarInstance?.slot2}">
				<li class="fieldcontain">
					<span id="slot2-label" class="property-label"><g:message code="seminar.slot2.label" default="Slot2" /></span>
					
						<span class="property-value" aria-labelledby="slot2-label"><g:fieldValue bean="${seminarInstance}" field="slot2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seminarInstance?.speaker}">
				<li class="fieldcontain">
					<span id="speaker-label" class="property-label"><g:message code="seminar.speaker.label" default="Speaker" /></span>
					
						<span class="property-value" aria-labelledby="speaker-label"><g:link controller="speaker" action="show" id="${seminarInstance?.speaker?.id}">${seminarInstance?.speaker?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${seminarInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="seminar.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${seminarInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:seminarInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${seminarInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
