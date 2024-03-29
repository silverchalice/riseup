
<%@ page import="riseup.Attendee" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'attendee.label', default: 'Attendee')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-attendee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-attendee" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list attendee">
			
				<g:if test="${attendeeInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="attendee.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${attendeeInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendeeInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="attendee.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${attendeeInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendeeInstance?.age}">
				<li class="fieldcontain">
					<span id="age-label" class="property-label"><g:message code="attendee.age.label" default="Age" /></span>
					
						<span class="property-value" aria-labelledby="age-label"><g:fieldValue bean="${attendeeInstance}" field="age"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendeeInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="attendee.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${attendeeInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendeeInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="attendee.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${attendeeInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendeeInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="attendee.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${attendeeInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendeeInstance?.church}">
				<li class="fieldcontain">
					<span id="church-label" class="property-label"><g:message code="attendee.church.label" default="Church" /></span>
					
						<span class="property-value" aria-labelledby="church-label"><g:fieldValue bean="${attendeeInstance}" field="church"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendeeInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="attendee.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${attendeeInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendeeInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="attendee.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${attendeeInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendeeInstance?.ticketType}">
				<li class="fieldcontain">
					<span id="ticketType-label" class="property-label"><g:message code="attendee.ticketType.label" default="Ticket Type" /></span>
					
						<span class="property-value" aria-labelledby="ticketType-label"><g:link controller="ticketType" action="show" id="${attendeeInstance?.ticketType?.id}">${attendeeInstance?.ticketType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendeeInstance?.seminar1}">
				<li class="fieldcontain">
					<span id="seminar1-label" class="property-label"><g:message code="attendee.seminar1.label" default="Seminar1" /></span>
					
						<span class="property-value" aria-labelledby="seminar1-label"><g:fieldValue bean="${attendeeInstance}" field="seminar1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendeeInstance?.seminar2}">
				<li class="fieldcontain">
					<span id="seminar2-label" class="property-label"><g:message code="attendee.seminar2.label" default="Seminar2" /></span>
					
						<span class="property-value" aria-labelledby="seminar2-label"><g:fieldValue bean="${attendeeInstance}" field="seminar2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendeeInstance?.seminar3}">
				<li class="fieldcontain">
					<span id="seminar3-label" class="property-label"><g:message code="attendee.seminar3.label" default="Seminar3" /></span>
					
						<span class="property-value" aria-labelledby="seminar3-label"><g:fieldValue bean="${attendeeInstance}" field="seminar3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendeeInstance?.seminar4}">
				<li class="fieldcontain">
					<span id="seminar4-label" class="property-label"><g:message code="attendee.seminar4.label" default="Seminar4" /></span>
					
						<span class="property-value" aria-labelledby="seminar4-label"><g:fieldValue bean="${attendeeInstance}" field="seminar4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendeeInstance?.assignedRoom}">
				<li class="fieldcontain">
					<span id="assignedRoom-label" class="property-label"><g:message code="attendee.assignedRoom.label" default="Assigned Room" /></span>
					
						<span class="property-value" aria-labelledby="assignedRoom-label"><g:link controller="room" action="show" id="${attendeeInstance?.assignedRoom?.id}">${attendeeInstance?.assignedRoom?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendeeInstance?.roomNotes}">
				<li class="fieldcontain">
					<span id="roomNotes-label" class="property-label"><g:message code="attendee.roomNotes.label" default="Room Notes" /></span>
					
						<span class="property-value" aria-labelledby="roomNotes-label"><g:fieldValue bean="${attendeeInstance}" field="roomNotes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendeeInstance?.shuttle}">
				<li class="fieldcontain">
					<span id="shuttle-label" class="property-label"><g:message code="attendee.volunteer.shuttle" default="Shuttle" /></span>
					
						<span class="property-value" aria-labelledby="shuttle-label"><g:fieldValue bean="${attendeeInstance}" field="shuttle"/></span>
					
				</li>
				</g:if>

				<g:if test="${attendeeInstance?.volunteer}">
				<li class="fieldcontain">
					<span id="volunteer-label" class="property-label"><g:message code="attendee.volunteer.label" default="Volunteer" /></span>
					
						<span class="property-value" aria-labelledby="volunteer-label"><g:fieldValue bean="${attendeeInstance}" field="volunteer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendeeInstance?.confOrder}">
				<li class="fieldcontain">
					<span id="confOrder-label" class="property-label"><g:message code="attendee.confOrder.label" default="Conf Order" /></span>
					
						<span class="property-value" aria-labelledby="confOrder-label"><g:link controller="confOrder" action="show" id="${attendeeInstance?.confOrder?.id}">${attendeeInstance?.confOrder?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:attendeeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${attendeeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
