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
                    <g:if test="${confOrder.paid}">
                        <h1>Registration Complete</h1>
                        <p><strong>Your registration is complete</strong>, but you can still make seminar selections or change your selections.</p>
                    </g:if>
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
            <g:link controller="home" action="index" >
                <button class="btn btn-primary">Home</button>
            </g:link>
            <g:if test="${!confOrder.paid}">
                <g:link action="register" model="${[confOrderId: confOrder.id]}">
                    <button class="btn btn-primary">Return to Order</button>
                </g:link>
            </g:if>
        </div>
    </div>

    <g:if test="${!confOrder.paid}">
        <div class="well" style="height:90px;">
            <div style="width:200px;float:left;">
                <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
                    <input type="hidden" name="cmd" value="_xclick" />
                    <input type="hidden" name="business" value="info@assemblycare.org">
                    <input type="hidden" name="currency_code" value="USD">
                    <input type="hidden" name="item_name" value="Believers Conference Registration">
                    <input type="hidden" name="amount" value="${amount}" />
                    <input type="hidden" name="return" value="http://bibleconferences.org:9090/thanks/${confOrder?.id}" />
                    <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_paynowCC_LG.gif" border="0" name="submit" alt="PayPal">
                    <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
                </form>
            </div>
            <div style="width:200px; float:left; margin-top:20px;">
                <g:link action="thanks" id="${confOrder?.id}"
                        params="[paymentType:'check']">
                    <button type="button">Pay By Check</button>
                </g:link>
            </div>
        </div>
    </g:if>

    <div class="row">
        <div class="col-md-12">
            <div class="well">
                <p>For registration questions or problems with the website, please email <a href="mailto:registration@bibleconferences.org">registration@bibleconferences.org</a>
                </p>
            </div>
        </div>
    </div>    

    </body>
</html>
