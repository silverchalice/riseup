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

            $("#saveNewAttendee").click(function () {

                jQuery.ajax({
                    type: 'POST',
                    data: $('#attendeeAdd').serialize(),
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
    <div class="col-md-10 col-md-offset-1">
        <h1>Add Attendees</h1>
    </div>
</div>

<div class="row">
    <div class="col-md-10 col-md-offset-1">

        <h3>Attendees</h3>
        <div id="atl" >
          <g:render template="attendeeList"/>
        </div>
    </div>

</div>

<div class="modal fade" id="newAttendee">
    <div class="modal-dialog">

        <g:form name="attendeeAdd" id="attendeeAdd">
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
                            <input type="text" name="age" value="" class="form-control" type="number"/>

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
                            <input id="email" name="email" class="form-control" type="email"/>

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
                            <label>Willing to volunteer:</label>
                            <g:select name="volunteer" from="${['Book Room', 'Wherever needed']}"
                                      noSelection="['':'-select an area of need-']" class="form-control"/>
                        </div>
                        <div class="col-sm-6">
                            <label>Ticket type:</label>
                            <g:select name="ticketType" from="${TicketType.list()}" optionKey="id"
                                      class="form-control"/>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-12">
                            <label for="roomNotes">Guestroom Notes (Roommate names, special needs, etc.):</label>
                            <textarea id="roomNotes" name="roomNotes" rows="5" cols="60" class="form-control"></textarea>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-12">
                            <label for="shuttle">Need a ride from the aiport? Enter arrival time and airline:</label>
                            <textarea id="shuttle" name="shuttle" rows="2" cols="60" class="form-control"></textarea>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    <input type="submit" value="Save Attendee" class="btn btn-success" id="saveNewAttendee"/>
                </div>

            </div><!-- /.modal-content -->
        </g:form>
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>
</html>
