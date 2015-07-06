<%@ page import="riseup.TicketType" %>

<!DOCTYPE HTML>
<html>
	<head>
		<meta name="layout" content="simple"/>
		<title>Believers Bible Conference 2015 // Login</title>
    <g:javascript library="jquery" plugin="jquery"/>
    <g:javascript library="jquery-ui" plugin="jquery-ui"/>
    <link href="${resource(dir: 'css', file: 'jquery-ui.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'jquery-ui.theme.min.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'jquery-ui.theme.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'jquery-ui.structure.min.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'jquery-ui.structure.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'jquery-ui.min.css')}" rel="stylesheet">
    <g:javascript src="jquery-ui.js" />
    <g:javascript src="jquery-ui.min.js" />
    <g:javascript>
      $( document ).ready(function() {
          document.getElementById("password").focus();
      });
    </g:javascript>
    
	</head>
  <body>

            <h1>Seminar selection</h1>
            <g:each in="${order?.attendees}" var="attendee">
              <p>${attendee}</p>f
            </g:each>
            <g:if test="${flash.message}">
              <div class="message">
                ${flash.message}
              </div>
            </g:if>

              <div class="orderForm">
                <g:form name="purchaserInfo" id="purchaserInfo" url="[controller: 'home', action: 'save_new_password']">
                  <table border="1">
                    <thead>
                      <th></th>
                      <th></th>
                    </thead>
                    <tbody>
                      <tr>
                        <td class="name">Attendee:</td>
                        <td><g:select name="attendee.id" from="${order?.attendees}" value="${it}"
          noSelection="['':'Select attendee']"/></td>
                      </tr>
                      <tr>
                        <td class="name">Re-type it:</td>
                        <td><input type="password" name="confirm_password" /></td>
                      </tr>
                      <tr>
                        <td class="name"></td>
                        <td><input type="submit" class="button" value="Update password" /></td>
                      </tr>
                    </tbody>
                  </table>
                </g:form>
              </div>
            </div>
  </body>
</html>
