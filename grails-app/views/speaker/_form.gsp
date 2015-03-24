<%@ page import="riseup.Speaker" %>



<div class="fieldcontain ${hasErrors(bean: speakerInstance, field: 'bio', 'error')} required">
	<label for="bio">
		<g:message code="speaker.bio.label" default="Bio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="bio" cols="40" rows="5" maxlength="100000" required="" value="${speakerInstance?.bio}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: speakerInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="speaker.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${speakerInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: speakerInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="speaker.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${speakerInstance?.lastName}"/>

</div>

