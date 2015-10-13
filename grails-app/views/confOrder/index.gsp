
<%@ page import="riseup.ConfOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'confOrder.label', default: 'ConfOrder')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-confOrder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-confOrder" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="paymentType" title="${message(code: 'confOrder.paymentType.label', default: 'Payment Type')}" />
					
						<g:sortableColumn property="checkReceived" title="${message(code: 'confOrder.checkReceived.label', default: 'Check Received')}" />
					
						<th><g:message code="confOrder.buyer.label" default="Buyer" /></th>
					
						<g:sortableColumn property="paid" title="${message(code: 'confOrder.paid.label', default: 'Paid')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${confOrderInstanceList}" status="i" var="confOrderInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${confOrderInstance.id}">${fieldValue(bean: confOrderInstance, field: "paymentType")}</g:link></td>
					
						<td><g:formatBoolean boolean="${confOrderInstance.checkReceived}" /></td>
					
						<td>${fieldValue(bean: confOrderInstance, field: "buyer")}</td>
					
						<td><g:formatBoolean boolean="${confOrderInstance.paid}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${confOrderInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
