<%@ page import="riseup.Room" %>



<div class="fieldcontain ${hasErrors(bean: roomInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="room.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${riseup.Attendee.list()}" optionKey="id" required="" value="${roomInstance?.owner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: roomInstance, field: 'size', 'error')} required">
	<label for="size">
		<g:message code="room.size.label" default="Size" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="size" type="number" value="${roomInstance.size}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: roomInstance, field: 'occupants', 'error')} required">
	<label for="occupants">
		<g:message code="room.occupants.label" default="Occupants" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="occupants" from="${riseup.Attendee.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${roomInstance?.occupants*.id}" class="many-to-many"/>

</div>

