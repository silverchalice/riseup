<%@ page import="riseup.TicketType" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
            aria-hidden="true">&times;</span></button>
    <h4 class="modal-title">Add new attendee</h4>
</div>

<div class="modal-body">

    <div class="form-group row">

        <div class="col-sm-6">
            <label>First name:</label>
            <input type="text" id="firstName" name="firstName" value="${attendee.firstName}" class="form-control"/>
        </div>

        <div class="col-sm-6">
            <label>Last name:</label>
            <input type="text" id="lastName" name="lastName" value="${attendee.lastName}" class="form-control"/>
        </div>

    </div>

    <div class="form-group row">
        <div class="col-sm-6">
            <label>Age:</label>
            <input type="text" name="age" value="" class="form-control" type="number" value="${attendee.age}"/>

        </div>

        <div class="col-sm-6">
            <label>Gender:</label>
            <g:select name="gender" from="${['Male', 'Female']}" value="${attendee.gender}" class="form-control"/>

        </div>
    </div>


    <div class="form-group row">
        <div class="col-sm-6">
            <label>Church:</label>
            <input type="text" name="church" class="form-control" value="${attendee.church}"/>
        </div>

        <div class="col-sm-6">
            <label>Email address:</label>
            <input id="email" name="email" class="form-control" type="email" value="${attendee.email}"/>

        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-6">
            <label>City:</label>
            <input type="text" id="city" name="city" class="form-control" value="${attendee.city}"/>
        </div>

        <div class="col-sm-6">
            <label>State:</label>
            <input type="text" id="state" name="state" class="form-control" value="${attendee.state}"/>
        </div>
    </div>


    <div class="form-group row">
        <div class="col-sm-6">
            <label>Willing to volunteer:</label>
            <g:select name="volunteer" from="${['Book Room', 'Wherever needed']}"
                      noSelection="['':'-select an area of need-']" class="form-control"  value="${attendee.volunteer}"/>
        </div>
        <div class="col-sm-6">
            <label>Ticket type:</label>
            <g:select name="ticketType" from="${riseup.TicketType.list()}" optionKey="id"
                      class="form-control" value="${attendee.ticketType}"/>
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-12">
            <label for="roomNotes">Guestroom Notes (Roommate names, special needs, etc.):</label>
            <textarea id="roomNotes" name="roomNotes" rows="5" cols="60" class="form-control"  value="${attendee.roomNotes}"></textarea>
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-12">
            <label for="shuttle">Need a ride from the aiport? Enter arrival time and airline:</label>
            <textarea id="shuttle" name="shuttle" rows="2" cols="60" class="form-control"  value="${attendee.shuttle}"></textarea>
        </div>
    </div>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
    <input type="submit" value="Save Attendee" class="btn btn-success" id="saveNewAttendee"/>
</div>