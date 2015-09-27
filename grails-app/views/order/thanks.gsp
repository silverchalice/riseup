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
        <h1>Thank you!</h1><h3>You are now registered</h3>
    </div>
</div>
<div class="row">
    <g:if test="${check}">
      <div class="col-md-10 col-md-offset-1">
        <p>Please send your check or money order, payable to <i>Believers Bible Conference</i>,to:
        </p>
        <p>
        Believers Bible Conference 2015<br/>
        61 Harneywold Drive<br/>
        Saint Louis, MO 63136
        </p>
      </div>
    </g:if>
    <div class="col-md-10 col-md-offset-1">
        <p>If you have not done so already, now would be a great time to make your seminar selections.</p>
    </div>
</div>

<div class="row">
    <div class="col-md-10 col-md-offset-1">
        <div class="well">
            <g:link controller='order' action="seminars" params="${[id: order?.id]}">Select or Change Seminars</g:link>
            <g:link controller="home" action="index">Return to Home Page</g:link>
        </div>
    </div>
</div>

</body>
</html>
