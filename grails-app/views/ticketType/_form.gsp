<%@ page import="riseup.TicketType" %>



<div class="fieldcontain ${hasErrors(bean: ticketTypeInstance, field: 'comments', 'error')} required">
	<label for="comments">
		<g:message code="ticketType.comments.label" default="Comments" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="comments" required="" value="${ticketTypeInstance?.comments}"/>

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

