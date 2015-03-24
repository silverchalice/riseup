<%@ page import="riseup.Seminar" %>



<div class="fieldcontain ${hasErrors(bean: seminarInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="seminar.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="5000" required="" value="${seminarInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: seminarInstance, field: 'room1', 'error')} required">
	<label for="room1">
		<g:message code="seminar.room1.label" default="Room1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="room1" required="" value="${seminarInstance?.room1}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: seminarInstance, field: 'room2', 'error')} required">
	<label for="room2">
		<g:message code="seminar.room2.label" default="Room2" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="room2" required="" value="${seminarInstance?.room2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: seminarInstance, field: 'slot1', 'error')} required">
	<label for="slot1">
		<g:message code="seminar.slot1.label" default="Slot1" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="slot1" type="number" value="${seminarInstance.slot1}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: seminarInstance, field: 'slot2', 'error')} required">
	<label for="slot2">
		<g:message code="seminar.slot2.label" default="Slot2" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="slot2" type="number" value="${seminarInstance.slot2}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: seminarInstance, field: 'speaker', 'error')} required">
	<label for="speaker">
		<g:message code="seminar.speaker.label" default="Speaker" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="speaker" name="speaker.id" from="${riseup.Speaker.list()}" optionKey="id" required="" value="${seminarInstance?.speaker?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: seminarInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="seminar.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${seminarInstance?.title}"/>

</div>

