<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="simple" />
		<title>Seminar Selection</title>
		<script type="text/javascript">
			function setAttendeeId(attendeeId){
				$("#aIdInput").val(attendeeId);
			}

			function ajaxLoadSeminarSelections(attendeeId){
				var url = '/order/loadSeminarSelectionForm/' + attendeeId;
				$.ajax(url, {
					success: function(data){
						$("#seminar-form").html(data);
					}
				 })
			}
		</script>
	</head>
	<body>
	<h3>Hello</h3>
		<div id="attendees">
		   <p>Click on the attendee name to select seminars or to change selections.</p>
			<table>
				<thead>
					<th><td>Attendee</td><td>Seminar 1</td><td>Seminar 2</td><td>Seminar 3</td><td>Seminar 4</td></th>
				</thead>
				<tbody>
					<g:each in="${attendees}" var="a">
						<tr>
							<td><a href="" onclick="ajaxLoadSeminarSelections(${a.id})">
							    ${a.firstName} ${a.lastName}
							</a></td>
							<td>${a.seminar1 ?: 'Not Selected'}</td>
							<td>${a.seminar2 ?: 'Not Selected'}</td>
							<td>${a.seminar3 ?: 'Not Selected'}</td>
							<td>${a.seminar4 ?: 'Not Selected'}</td>
						</tr>
					</g:each> 
				</tbody>
			</table>
		</div>
		<div id="seminar-form">

		</div>
	</body>
</html>