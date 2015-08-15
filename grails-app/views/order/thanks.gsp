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
    <div class="col-md-10 col-md-offset-1">
        <p>Yo, you're all registered and all, so why not head on over and select some sessions?</p>
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
