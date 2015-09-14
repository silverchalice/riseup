<%@ page import="riseup.Attendee" %>



<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="attendee.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${attendeeInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="attendee.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${attendeeInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'age', 'error')} ">
	<label for="age">
		<g:message code="attendee.age.label" default="Age" />
		
	</label>
	<g:field name="age" type="number" value="${attendeeInstance.age}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="attendee.gender.label" default="Gender" />
		
	</label>
	<g:select name="gender" from="${attendeeInstance.constraints.gender.inList}" value="${attendeeInstance?.gender}" valueMessagePrefix="attendee.gender" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="attendee.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${attendeeInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="attendee.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${attendeeInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'church', 'error')} ">
	<label for="church">
		<g:message code="attendee.church.label" default="Church" />
		
	</label>
	<g:textField name="church" value="${attendeeInstance?.church}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="attendee.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${attendeeInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'state', 'error')} ">
	<label for="state">
		<g:message code="attendee.state.label" default="State" />
		
	</label>
	<g:textField name="state" value="${attendeeInstance?.state}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'ticketType', 'error')} ">
	<label for="ticketType">
		<g:message code="attendee.ticketType.label" default="Ticket Type" />
		
	</label>
	<g:select id="ticketType" name="ticketType.id" from="${riseup.TicketType.list()}" optionKey="id" value="${attendeeInstance?.ticketType?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'seminar1', 'error')} ">
	<label for="seminar1">
		<g:message code="attendee.seminar1.label" default="Seminar1" />
		
	</label>
	<g:textField name="seminar1" value="${attendeeInstance?.seminar1}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'seminar2', 'error')} ">
	<label for="seminar2">
		<g:message code="attendee.seminar2.label" default="Seminar2" />
		
	</label>
	<g:textField name="seminar2" value="${attendeeInstance?.seminar2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'seminar3', 'error')} ">
	<label for="seminar3">
		<g:message code="attendee.seminar3.label" default="Seminar3" />
		
	</label>
	<g:textField name="seminar3" value="${attendeeInstance?.seminar3}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'seminar4', 'error')} ">
	<label for="seminar4">
		<g:message code="attendee.seminar4.label" default="Seminar4" />
		
	</label>
	<g:textField name="seminar4" value="${attendeeInstance?.seminar4}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'volunteer', 'error')} ">
	<label for="volunteer">
		<g:message code="attendee.volunteer.label" default="Volunteer" />

	</label>
	<g:textField name="volunteer" value="${attendeeInstance?.volunteer}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'assignedRoom', 'error')} ">
	<label for="assignedRoom">
		<g:message code="attendee.assignedRoom.label" default="Assigned Room" />
		
	</label>
	<g:select id="assignedRoom" name="assignedRoom.id" from="${riseup.Room.list()}" optionKey="id" value="${attendeeInstance?.assignedRoom?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'roomNotes', 'error')} ">
	<label for="roomNotes">
		<g:message code="attendee.roomNotes.label" default="Room Notes" />
		
	</label>
	<g:textArea name="roomNotes" cols="40" rows="5" maxlength="5000" value="${attendeeInstance?.roomNotes}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendeeInstance, field: 'confOrder', 'error')} required">
	<label for="confOrder">
		<g:message code="attendee.confOrder.label" default="Conf Order" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="confOrder" name="confOrder.id" from="${riseup.ConfOrder.list()}" optionKey="id" required="" value="${attendeeInstance?.confOrder?.id}" class="many-to-one"/>

</div>

