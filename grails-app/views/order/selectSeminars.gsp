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

                        $('#seminar-selection-modal').modal('show');

					}, error: function(xhr, status, error){alert(xhr.responseText);}
				 });

			    return false;

			}
		</script>
	</head>
	<body>

			<div class="row">
                <div class="col-md-12">
                    <h3>Seminar Selection</h3>
                    <div id="attendees">
                        <p>Click on the attendee name to select seminars or to change selections.</p>
                        <table id="selectedSeminars" class="table table-striped table-hover">
                            <tr>
                                <td> </td><td class="name">Attendee</td>
                                <td>Seminar 1</td><td>Seminar 2</td>
                                <td>Seminar 3</td><td>Seminar 4</td>
                            </tr>
                            <g:each in="${attendees}" var="a">
                                <tr>
                                    <td>
                                        <g:if test="${a.seminar1}">
                                            <button onclick="ajaxLoadSeminarSelections(${a.id})" class="btn btn-info">Change</button>
                                        </g:if>
                                        <g:else>
                                            <button onclick="ajaxLoadSeminarSelections(${a.id})" class="btn btn-primary">Select</button>
                                        </g:else>
                                    </td>
                                    <td class="name">${a.firstName} ${a.lastName}</td>
                                    <td>${a.seminar1 ?: 'Not Selected'}</td>
                                    <td>${a.seminar2 ?: 'Not Selected'}</td>
                                    <td>${a.seminar3 ?: 'Not Selected'}</td>
                                    <td>${a.seminar4 ?: 'Not Selected'}</td>
                                </tr>
                            </g:each>
                        </table>
                    </div>

                </div>
            </div>


        <div id="seminar-form">

        </div>

    <div class="row">
        <div class="col-md-12">
            <g:link action="order" model="${[confOrderId: confOrder.id]}">
                <button class="btn btn-primary">Return to Order</button>
            </g:link>
            </div>


    </div>



	</body>
</html>
