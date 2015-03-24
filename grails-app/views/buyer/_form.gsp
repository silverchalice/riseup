<%@ page import="riseup.Buyer" %>



<div class="fieldcontain ${hasErrors(bean: buyerInstance, field: 'address1', 'error')} required">
	<label for="address1">
		<g:message code="buyer.address1.label" default="Address1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address1" required="" value="${buyerInstance?.address1}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: buyerInstance, field: 'address2', 'error')} required">
	<label for="address2">
		<g:message code="buyer.address2.label" default="Address2" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address2" required="" value="${buyerInstance?.address2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: buyerInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="buyer.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${buyerInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: buyerInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="buyer.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${buyerInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: buyerInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="buyer.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${buyerInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: buyerInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="buyer.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${buyerInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: buyerInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="buyer.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${buyerInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: buyerInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="buyer.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="state" required="" value="${buyerInstance?.state}"/>

</div>

