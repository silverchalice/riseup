<%@ page import="riseup.ConfOrder" %>



<div class="fieldcontain ${hasErrors(bean: confOrderInstance, field: 'paymentType', 'error')} required">
	<label for="paymentType">
		<g:message code="confOrder.paymentType.label" default="Payment Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="paymentType" from="${confOrderInstance.constraints.paymentType.inList}" required="" value="${confOrderInstance?.paymentType}" valueMessagePrefix="confOrder.paymentType"/>

</div>

<div class="fieldcontain ${hasErrors(bean: confOrderInstance, field: 'attendees', 'error')} ">
	<label for="attendees">
		<g:message code="confOrder.attendees.label" default="Attendees" />
		
	</label>
	<g:select name="attendees" from="${riseup.Attendee.list()}" multiple="multiple" optionKey="id" size="5" value="${confOrderInstance?.attendees*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: confOrderInstance, field: 'buyer', 'error')} required">
	<label for="buyer">
		<g:message code="confOrder.buyer.label" default="Buyer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="buyer" name="buyer.id" from="${riseup.Buyer.list()}" optionKey="id" required="" value="${confOrderInstance?.buyer?.id}" class="many-to-one"/>

</div>

