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
          document.getElementById("email").focus();
      });
    </g:javascript>
    
	</head>
  <body>

            <h1>Log in</h1>
            <g:if test="${flash.message}">
              <div class="message">
                ${flash.message}
              </div>
            </g:if>

              <div class="orderForm">
                <g:form name="purchaserInfo" id="purchaserInfo" url="[controller: 'home', action: 'log_user_in']">
                  <table border="1">
                    <thead>
                      <th></th>
                      <th></th>
                    </thead>
                    <tbody>
                      <tr>
                        <td class="name">Email address:</td>
                        <td><input type="text" id="email" name="email" /></td>
                      </tr>
                      <tr>
                        <td class="name">Password:</td>
                        <td><input type="password" name="password" /></td>
                      </tr>
                      <tr>
                        <td class="name"></td>
                        <td><input type="submit" class="button" value="Log in" /></td>
                      </tr>
                      <tr>
                        <td class="name"></td>
                        <td></td>
                      </tr>
                      <tr>
                        <td class="name"></td>
                        <td><g:link controller="home" action="forgot_password">Forgot your password?</g:link></td>
                      </tr>
                    </tbody>
                  </table>
                </g:form>
              </div>
            </div>
  </body>
</html>
