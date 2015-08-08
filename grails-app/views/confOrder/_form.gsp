<%@ page import="riseup.ConfOrder" %>



<div class="fieldcontain ${hasErrors(bean: confOrderInstance, field: 'paymentType', 'error')} ">
	<label for="paymentType">
		<g:message code="confOrder.paymentType.label" default="Payment Type" />
		
	</label>
	<g:select name="paymentType" from="${confOrderInstance.constraints.paymentType.inList}" value="${confOrderInstance?.paymentType}" valueMessagePrefix="confOrder.paymentType" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: confOrderInstance, field: 'attendees', 'error')} ">
	<label for="attendees">
		<g:message code="confOrder.attendees.label" default="Attendees" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${confOrderInstance?.attendees?}" var="a">
    <li><g:link controller="attendee" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="attendee" action="create" params="['confOrder.id': confOrderInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'attendee.label', default: 'Attendee')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: confOrderInstance, field: 'buyer', 'error')} required">
	<label for="buyer">
		<g:message code="confOrder.buyer.label" default="Buyer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="buyer" name="buyer.id" from="${riseup.Buyer.list()}" optionKey="id" required="" value="${confOrderInstance?.buyer?.id}" class="many-to-one"/>

</div>

