<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="simple">
		<title>BBC Registration Report</title>
	</head>
	<body>
		<h3>Registration Report</h3>
		<table>
			<tr>
				<td>OrderId</td>
				<td>Buyer</td>
				<td>Email</td>
				<td>Total</td>
				<td>pmtType</td>
				<td>Paid?</td>
				<td>Chk Rcvd</td>
				<td>Attendees</td>
			</tr>
			<g:each in="${orders}" var="order">
				<tr>
					<td>${order.id}</td>
					<td>${order.buyer.firstName} ${order.buyer.lastName}</td>
					<td>${order.buyer.email}</td>
					<td>${order.calcTotalPrice()}</td>
					<td>${order.paymentType}</td>
					<td>${order.paid}</td>
					<td>${order.checkReceived}</td>
					<td>${order.attendees.size()}</td>
				</tr>
			</g:each>
		</table>
		<h3>Summary</h3>
		<ul>
			<li>Total Registrations: ${count}</li>
			<li>Total Paid: ${paidCount}</li>
			<li>Paid Attendees: ${attendeeCount}</li>
		</ul>
	</body>
</html>