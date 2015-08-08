<%@ page import="riseup.TicketType" %>



<div class="fieldcontain ${hasErrors(bean: ticketTypeInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="ticketType.comments.label" default="Comments" />
		
	</label>
	<g:textField name="comments" value="${ticketTypeInstance?.comments}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketTypeInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="ticketType.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${ticketTypeInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketTypeInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="ticketType.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" type="number" value="${ticketTypeInstance.price}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketTypeInstance, field: 'roomSize', 'error')} required">
	<label for="roomSize">
		<g:message code="ticketType.roomSize.label" default="Room Size" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="roomSize" type="number" value="${ticketTypeInstance.roomSize}" required=""/>

</div>

