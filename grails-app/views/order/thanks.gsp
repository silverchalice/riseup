<%@ page import="riseup.TicketType" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta name="layout" content="simple"/>
    <title>Believers Bible Conference 2015 // Register</title>

</head>

<body>
<div class="row">
    <div class="col-md-10 col-md-offset-1">
        <h1>Thank you!</h1>
    </div>
</div>
<div class="row">
    <g:if test="${check}">
      <div class="col-md-10 col-md-offset-1">
        <p>Please send your check or money order, payable to <i>Believers Bible Conference</i> and send it to:
        </p>
        <p>
        Believers Bible Conference 2015
        61 Harneywold Drive
        Saint Louis, MO 63136
        </p>
      </div>
    </g:if>
    <div class="col-md-10 col-md-offset-1">
        <p>Now would be a great time to make your seminar selections.</p>
    </div>
</div>

<div class="row">
    <div class="col-md-10 col-md-offset-1">
        <div class="well">
            <g:link controller='order' action="seminars" params="${[id: buyer?.id]}">Select Seminars</g:link>
        </div>
    </div>
</div>

</body>
</html>
