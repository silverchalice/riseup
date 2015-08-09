<%@ page import="riseup.TicketType" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta name="layout" content="simple"/>
    <title>Believers Bible Conference 2015 // Register</title>

    <script type="text/javascript">
        $(document).ready(function () {

            <g:if test="${!number}">
            $('#addAttendee').click(function () {
                $('#firstName').val($('#pFirstName').val());
                $('#lastName').val($('#pLastName').val());
                $('#email').val($('#pEmail').val());
                $('#city').val($('#pCity').val());
                $('#state').val($('#pState').val());
                $('#phone').val($('#pPhone').val());
            });
            </g:if>

            $("#saveNewAttendee").click(function() {
                jQuery.ajax({
                    type: 'POST',
                    data: $('#purchaserInfo,#attendeeAdd').serialize(),
                    url: '/order/addAttendee',
                    update: $('#atl'),
                    success: function (data, textStatus) {
                        $('#atl').html(data);
                        $("#newAttendee").modal('hide');
                        $('#attendeeAdd')[0].reset();
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
                return false;
            });

            $("#atl").on('click', "#addAttendee", function () {
                $('#newAttendee').modal('show');
                return false;
            });
        });
    </script>

</head>

<body>
<div class="row">
    <div class="col-md-offset-1 col-md-10">
        <h1>Register</h1>

        <div class="well">
            <h3>Purchaser Information</h3>
            <g:form name="purchaserInfo" id="purchaserInfo" url="[controller: 'order', action: 'addAttendee']">

                <div class="form-group">
                    <label>First name:</label>
                    <input type="text" id="pFirstName" name="pFirstName" value="${buyer?.firstName}"
                           class="form-control"/>
                </div>

                <div class="form-group">
                    <label>Last name:</label>
                    <input type="text" id="pLastName" name="pLastName" value="${buyer?.lastName}" class="form-control"/>
                </div>

                <div class="form-group">
                    <label>Email address:</label>
                    <input type="text" id="pEmail" name="pEmail" value="${buyer?.email}" class="form-control"/>
                </div>

                <div class="form-group">
                    <label>Password:</label>
                    <input type="password" name="pPassword" class="form-control"/>
                </div>

                <div class="form-group">
                    <label>Confirm:</label>
                    <input type="password" name="pConfirm_password" class="form-control"/>
                </div>

                <div class="form-group">
                    <label for="pAddress1">Address:</label>
                    <input type="text" id="pAddress1" name="pAddress1" value="${buyer?.address1}" class="form-control"/>
                </div>

                <div class="form-group">
                    <label for="pAddress2">Address 2:</label>
                    <input type="text" id="pAddress2" name="pAddress2" value="${buyer?.address2}" class="form-control"/>
                </div>

                <div class="form-group">
                    <label for="pCity">City:</label>
                    <input type="text" id="pCity" name="pCity" value="${buyer?.city}" class="form-control"/>
                </div>

                <div class="form-group">
                    <label for="pState">State / Province:</label>
                    <input type="text" id="pState" name="pState" value="${buyer?.state}" class="form-control"/>
                </div>

                <div class="form-group"><label>Zip / Postal:</label>
                    <input type="text" name="pZip" value="${buyer?.zip}" class="form-control"/>
                </div>

                <div class="form-group"><label>Phone number:</label>
                    <input type="text" id="pPhone" name="pPhone" value="${buyer?.phone}" class="form-control"/>
                </div>
            </g:form>
        </div>

        <div class="modal fade" id="newAttendee">
            <div class="modal-dialog">

                <g:form name="attendeeAdd" id="attendeeAdd" >
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Add new attendee</h4>
                        </div>

                        <div class="modal-body">

                            <div class="form-group row">

                                <div class="col-sm-6">
                                    <label>First name:</label>
                                    <input type="text" id="firstName" name="firstName" value="" class="form-control"/>
                                </div>

                                <div class="col-sm-6">
                                    <label>Last name:</label>
                                    <input type="text" id="lastName" name="lastName" value="" class="form-control"/>
                                </div>

                            </div>

                            <div class="form-group row">
                                <div class="col-sm-6">
                                    <label>Age:</label>
                                    <input type="text" name="age" value="" class="form-control"/>

                                </div>

                                <div class="col-sm-6">
                                    <label>Gender:</label>
                                    <g:select name="gender" from="${['Male', 'Female']}" class="form-control"/>

                                </div>
                            </div>


                            <div class="form-group row">
                                <div class="col-sm-6">
                                    <label>Church:</label>
                                    <input type="text" name="church" class="form-control"/>

                                </div>

                                <div class="col-sm-6">
                                    <label>Email address:</label>
                                    <input type="text" id="email" name="email" class="form-control"/>

                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-6">
                                    <label>City:</label>
                                    <input type="text" id="city" name="city" class="form-control"/>
                                </div>

                                <div class="col-sm-6">
                                    <label>State:</label>
                                    <input type="text" id="state" name="state" class="form-control"/>
                                </div>
                            </div>


                            <div class="form-group row">
                                <div class="col-sm-6">
                                    <label>Phone number:</label>
                                    <input type="text" id="phone" name="phone" class="form-control"/>
                                </div>

                                <div class="col-sm-6">
                                    <label>Ticket type:</label>
                                    <g:select name="ticketType" from="${TicketType.list()}" optionKey="id"
                                              class="form-control"/>
                                </div>
                            </div>

                            <div>
                                <label for="roomNotes">Guestroom Notes (Roommate names, special needs, etc.):</label>
                                <textarea id="roomNotes" name="roomNotes" rows="5" cols="40">
                                </textarea>
                            </div>

                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                            <input type="submit" value="Save Selections" class="btn btn-success" id="saveNewAttendee"/>
                        </div>
                    </div><!-- /.modal-content -->
                </g:form>
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->



        <div id="atl" class="well">
            <g:render template="attendeeList"/>
        </div>
    </div>
</div>
</body>
</html>
