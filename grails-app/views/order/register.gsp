<%@ page import="riseup.TicketType" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta name="layout" content="simple"/>
    <title>Believers Bible Conference 2015 // Register</title>

    <script type="text/javascript">
        $(document).ready(function () {

            $("#purchaserInfo").validate({
                rules: {
                    pFirstName: {
                        required: true
                    },
                    pLastName: {
                        required: true
                    },
                    pEmail: {
                        required: true
                    },
    
                    pAddress1: {
                        required: true
                    },
                    pCity: {
                        required: true
                    },
                    pState: {
                        required: true
                    },
                    pZip: {
                        required: true
                    }
                },
                messages: {
                    pFirstName: {
                        required: "Enter your first name"
                    }
                }
            });

        });
    </script>

</head>

<body>
<div class="row">
    <div class="col-md-10 col-md-offset-1">
        <h1>Register ${confOrder?.paid ? ' - You are already registered.' : ''}</h1>
    </div>
</div>

<g:form name="purchaserInfo" id="purchaserInfo" action="saveRegistration">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">

            <h3>Purchaser Information</h3>

            <div class="well">

                <div class="form-group row">
                    <div class="col-md-6"><label>First name:</label>
                        <input type="text" id="pFirstName" name="pFirstName" value="${buyer?.firstName}"
                               class="form-control"/>
                    </div>

                    <div class="col-md-6"><label>Last name:</label>
                        <input type="text" id="pLastName" name="pLastName" value="${buyer?.lastName}"
                               class="form-control"/>
                    </div>

                </div>

                <div class="form-group row">
                    <div class="col-md-6"><label>Email address:</label>
                        <input type="text" id="pEmail" name="pEmail" type="email" value="${buyer?.email}"
                               class="form-control"/>
                    </div>

                    <div class="col-md-6">
                        <label>Phone number:</label>
                        <input type="text" id="pPhone" name="pPhone" value="${buyer?.phone}" class="form-control"/>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-md-6"><label>Password:</label>
                        <input type="password" name="pPassword" class="form-control"/>
                    </div>

                    <div class="col-md-6"><label>Confirm:</label>
                        <input type="password" name="pConfirm_password" class="form-control"/>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-md-6"><label for="pAddress1">Address:</label>
                        <input type="text" id="pAddress1" name="pAddress1" value="${buyer?.address1}"
                               class="form-control"/>
                    </div>

                    <div class="col-md-6"><label for="pAddress2">Address 2:</label>
                        <input type="text" id="pAddress2" name="pAddress2" value="${buyer?.address2}"
                               class="form-control"/>
                    </div>
                </div>

                <div class="form-group row">

                    <div class="col-md-4">
                        <label for="pCity">City:</label>
                        <input type="text" id="pCity" name="pCity" value="${buyer?.city}" class="form-control"/>
                    </div>

                    <div class="col-md-4">
                        <label for="pState">State / Province:</label>
                        <input type="text" id="pState" name="pState" value="${buyer?.state}" class="form-control"/>
                    </div>

                    <div class="col-md-4">
                        <label>Zip / Postal:</label>
                        <input type="text" name="pZip" value="${buyer?.zip}" class="form-control"/>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="well">
                <g:if test="${confOrder.paid}">
                    <g:link controller='order' action="attendees" params="${[id: confOrder?.id]}">
                        Modify attendee information or select seminars.
                    </g:link>
                </g:if>
                <g:else>
                    <g:submitButton name="submit" value="Save and Add Attendees" class="btn btn-primary"/>
                </g:else>
            </div>

        </div>
    </div>
</g:form>
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="well">
                <p>For registration questions or problems with the website, please email <a href="mailto:registration@bibleconferences.org">registration@bibleconferences.org</a>
                </p>
            </div>
        </div>
    </div>    
</body>
</html>
