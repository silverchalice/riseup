<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="simple">
		<title>Hotel Room Assignment</title>
	</head>
	<body>
		<div id="attendees">
			<table>
				<thead>
					<th><td>First Name</td><td>LastName</td><td>Assigned Room</td></th>
				</thead>
				<tbody>
					<g:each in="${attendees}" var="a">
						<tr><td>${a.firstName}</td><td>${a.lastName}</td><td>${a.assignedRoom ?: ''}</td></tr>
					</g:each> 
				</tbody>
			</table>
		</div>
	</body>
</html>