<%@ page import="riseup.Interested" %>



<div class="fieldcontain ${hasErrors(bean: interestedInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="interested.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${interestedInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: interestedInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="interested.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${interestedInstance?.email}"/>

</div>

