<%@ page import="riseup.Order" %>



<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'paymentType', 'error')} required">
	<label for="paymentType">
		<g:message code="order.paymentType.label" default="Payment Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="paymentType" from="${orderInstance.constraints.paymentType.inList}" required="" value="${orderInstance?.paymentType}" valueMessagePrefix="order.paymentType"/>

</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'attendees', 'error')} ">
	<label for="attendees">
		<g:message code="order.attendees.label" default="Attendees" />
		
	</label>
	<g:select name="attendees" from="${riseup.Attendee.list()}" multiple="multiple" optionKey="id" size="5" value="${orderInstance?.attendees*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: orderInstance, field: 'buyer', 'error')} required">
	<label for="buyer">
		<g:message code="order.buyer.label" default="Buyer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="buyer" name="buyer.id" from="${riseup.Buyer.list()}" optionKey="id" required="" value="${orderInstance?.buyer?.id}" class="many-to-one"/>

</div>

