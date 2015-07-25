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
				$.ajax(url, {cache: false, 
					success: function(data){
				
						$("#seminar-form").html(data);
					}, error: function(xhr, status, error){alert(xhr.responseText);}
				 });

			    return false;

			}
		</script>
		<style>
			#selectedSeminars {
				border 1px solid black;
			}
		    #selectedSeminars td.btn {
		    	width:4%;
		    	border-bottom 1px solid black;
            }
		    #selectedSeminars td.name {
		    	width:14%;
           		border-bottom 1px solid black;
            }
		    #selectedSeminars td {	
		    	width:20%;
		    	border-bottom:  1px solid black;
            }
		</style>
	</head>
	<body>
	<h3>Seminar Selection</h3>
		<div id="attendees">
		   <p>Click on the attendee name to select seminars or to change selections.</p>
			<table id="selectedSeminars" style="width:100%">
				<tr>
					<td class="btn"> </td><td class="name">Attendee</td>
					<td>Seminar 1</td><td>Seminar 2</td>
					<td>Seminar 3</td><td>Seminar 4</td>
				</tr>
				<g:each in="${attendees}" var="a">
					<tr>
					    <td class="btn"><button onclick="ajaxLoadSeminarSelections(${a.id})">Edit</button></td>
						<td class="name">${a.firstName} ${a.lastName}</td>
						<td>${a.seminar1 ?: 'Not Selected'}</td>
						<td>${a.seminar2 ?: 'Not Selected'}</td>
						<td>${a.seminar3 ?: 'Not Selected'}</td>
						<td>${a.seminar4 ?: 'Not Selected'}</td>
					</tr>
				</g:each> 
			</table>
		</div>
		<div id="seminar-form">
		
		</div>
		<g:link action="order" model="${[confOrderId: confOrder.id]}">
		  <button>Return to Order</button>
		</g:link>
	</body>
</html>