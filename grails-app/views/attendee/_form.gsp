<%@ page import="riseup.Attendee" %>



<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="attendee.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${attendeeInstance.constraints.gender.inList}" required="" value="${attendeeInstance?.gender}" valueMessagePrefix="attendee.gender"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="attendee.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${attendeeInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="attendee.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${attendeeInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'age', 'error')} required">
	<label for="age">
		<g:message code="attendee.age.label" default="Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="age" type="number" value="${attendeeInstance.age}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'church', 'error')} required">
	<label for="church">
		<g:message code="attendee.church.label" default="Church" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="church" required="" value="${attendeeInstance?.church}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="attendee.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${attendeeInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="attendee.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${attendeeInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'seminar1', 'error')} required">
	<label for="seminar1">
		<g:message code="attendee.seminar1.label" default="Seminar1" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="seminar1" name="seminar1.id" from="${riseup.Seminar.list()}" optionKey="id" required="" value="${attendeeInstance?.seminar1?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'seminar2', 'error')} required">
	<label for="seminar2">
		<g:message code="attendee.seminar2.label" default="Seminar2" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="seminar2" name="seminar2.id" from="${riseup.Seminar.list()}" optionKey="id" required="" value="${attendeeInstance?.seminar2?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'seminar3', 'error')} required">
	<label for="seminar3">
		<g:message code="attendee.seminar3.label" default="Seminar3" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="seminar3" name="seminar3.id" from="${riseup.Seminar.list()}" optionKey="id" required="" value="${attendeeInstance?.seminar3?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'seminar4', 'error')} required">
	<label for="seminar4">
		<g:message code="attendee.seminar4.label" default="Seminar4" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="seminar4" name="seminar4.id" from="${riseup.Seminar.list()}" optionKey="id" required="" value="${attendeeInstance?.seminar4?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'seminar5', 'error')} required">
	<label for="seminar5">
		<g:message code="attendee.seminar5.label" default="Seminar5" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="seminar5" name="seminar5.id" from="${riseup.Seminar.list()}" optionKey="id" required="" value="${attendeeInstance?.seminar5?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'seminar6', 'error')} required">
	<label for="seminar6">
		<g:message code="attendee.seminar6.label" default="Seminar6" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="seminar6" name="seminar6.id" from="${riseup.Seminar.list()}" optionKey="id" required="" value="${attendeeInstance?.seminar6?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'ticketType', 'error')} required">
	<label for="ticketType">
		<g:message code="attendee.ticketType.label" default="Ticket Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ticketType" name="ticketType.id" from="${riseup.TicketType.list()}" optionKey="id" required="" value="${attendeeInstance?.ticketType?.id}" class="many-to-one"/>

</div>

