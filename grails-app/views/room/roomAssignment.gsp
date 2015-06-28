<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="simple" />
		<title>Hotel Room Assignment</title>
		<script type="text/javascript">
			function setAttendeeId(attendeeId){
				$("#aIdInput").val(attendeeId);
			}

			function ajaxLoadRooms(){
				var attendeeId = $("#aIdInput").val();
				var url = '/room/loadRooms/' + attendeeId;
				$.ajax(url, {
					success: function(data){
						$("#room-list").html(data);
					}
				 })
			}
			function ajaxNewRoom(){
				var attendeeId = $("#aIdInput").val();
				var url = '/room/newRoom/' + attendeeId;
				$.ajax(url, {
					success: function(data){
						$("#room-list").html(data);
					}
				 })
			}
		</script>
	</head>
	<body>
	<h3>Hello</h3>
		<div id="attendees">
		   <form id="tempForm">
			<table>
				<thead>
					<th><td>Select</td><td>First Name</td><td>LastName</td><td>Assigned Room</td></th>
				</thead>
				<tbody>
					<g:each in="${attendees}" var="a">
						<tr><td><input type="radio" id="${a.id}" onclick="setAttendeeId(${a.id});"/></td>
						<td>${a.firstName}</td><td>${a.lastName}</td>
						<td>${a.assignedRoom ?: ''}</td></tr>
					</g:each> 
				</tbody>
			</table>
			<input type="hidden" id="aIdInput" />
			</form>
		</div>
		<div id="rooms">
			<div id="room-header">
				<button type="button" onclick="ajaxLoadRooms();">Load Available Rooms</button>
				<button type="button" onclick="ajaxNewRoom();">Create New Room</button>
			</div>
			<div id="room-list">
			</div>
		</div>
	</body>
</html>