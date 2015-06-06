
<%@ page import="riseup.TicketType" %>
<!DOCTYPE HTML>
<!--
	Autonomy by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<meta name="layout" content="public_order"/>
		<title>Welcome to Grails</title>
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
    <g:javascript src="jquery.cycle2.min.js" />
    <g:javascript>
      $( document ).ready(function() {
          function addAttendee(){
              jQuery.ajax({type:'POST', data: $('#attendeeAdd').serialize(), url:'/riseup/order/addAttendee',update: $('#atl'), success:function(data,textStatus){
                  $('#atl').html(data);
                  $("#newAttendee").dialog('close');
                  $('#attendeeAdd')[0].reset();
              },error:function(XMLHttpRequest,textStatus,errorThrown){}});
          }

          $("#addAttendee").on('click', function() {
              var dialogYo = $("#newAttendee").dialog({ modal: true, width: 800, autoOpen: false,  buttons: {
                      "Add to attendee list": addAttendee,
                      Cancel: function() {
                          dialogYo.dialog( "close" );
                      }
                  }
              });
              dialogYo.dialog('open');
              return false;
          });
      });
    </g:javascript>
    
	</head>
	<body>

		<div id="featured">
			<div class="container">
				<div class="row">
					<div class="9u">
						<section>
  
              <div class="orderForm">
                <h3>Purchaser Information</h3>
                <table border="1">
                  <thead>
                    <th></th>
                    <th></th>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="name">Name:</td>
                      <td><input type="text" name="name" value="Ho!" /></td>
                    </tr>
                    <tr>
                      <td class="name">Email address:</td>
                      <td><input type="text" name="email" value="Ho!" /></td>
                    </tr>
                    <tr>
                      <td class="name">Password:</td>
                      <td><input type="password" name="password" /></td>
                    </tr>
                    <tr>
                      <td class="name">Confirm:</td>
                      <td><input type="password" name="confirm_password" /></td>
                    </tr>
                    <tr>
                      <td class="name">Address:</td>
                      <td><input type="text" name="address1" /></td>
                    </tr>
                    <tr>
                      <td class="name">City:</td>
                      <td><input type="text" name="city" /></td>
                    </tr>
                    <tr>
                      <td class="name">State / Province:</td>
                      <td><input type="text" name="state" /></td>
                    </tr>
                    <tr>
                      <td class="name">Zip / Postal:</td>
                      <td><input type="text" name="state" /></td>
                    </tr>
                    <tr>
                      <td class="name">Phone number:</td>
                      <td><input type="text" name="phone" /></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            
              <div id="newAttendee" title="Add new attendee">
              <div class="attendeeInfoForm">
                <g:formRemote name="attendeeAdd" id="attendeeAdd" url="[controller: 'order', action: 'addAttendee']" update="atl">
                  <table border="1">
                    <thead>
                      <th></th>
                      <th></th>
                    </thead>
                    <tbody>
                      <tr>
                        <td class="name">First name:</td>
                        <td><input type="text" name="firstName" value="Ho!" /></td>
                      </tr>
                      <tr>
                        <td class="name">Last name:</td>
                        <td><input type="text" name="lastName" value="Ho!" /></td>
                      </tr>
                      <tr>
                        <td class="name">Age:</td>
                        <td><input type="text" name="age" value="Ho!" /></td>
                      </tr>
                      <tr>
                        <td class="name">Gender:</td>
                        <td><g:select name="gender" from="${['Male', 'Female']}" /></td>
                      </tr>
                      <tr>
                        <td class="name">Church:</td>
                        <td><input type="text" name="church" /></td>
                      </tr>
                      <tr>
                        <td class="name">Email address:</td>
                        <td><input type="text" name="email" /></td>
                      </tr>
                      <tr>
                        <td class="name">City:</td>
                        <td><input type="text" name="city" /></td>
                      </tr>
                      <tr>
                        <td class="name">State:</td>
                        <td><input type="text" name="state" /></td>
                      </tr>
                      <tr>
                        <td class="name">Phone number:</td>
                        <td><input type="text" name="phone" /></td>
                      </tr>
                      <tr>
                        <td class="name">Ticket type:</td>
                        <td><g:select name="ticketType" from="${TicketType.list()}" optionKey="id" /></td>
                      </tr>
                    </tbody>
                  </table>
                </g:formRemote>
              </div>
              </div>
              <div id="atl">
                <g:render template="attendeeList" />
              </div>
              <p id="r_end"><span class="left"><input type="submit" value="Purchase" /></span><span class="right"><strong>Total:</strong> $456.78</span></p>
							
						</section>


	
  <g:javascript>
      $(document).ready(function(){
        var images = [
            '<img src="http://malsup.github.io/images/p2.jpg">',
            '<img src="http://malsup.github.io/images/p3.jpg">',
            '<img src="http://malsup.github.io/images/p4.jpg">'
        ];

        for (var i=0; i < images.length; i++) {
            $('.cycle-slideshow').cycle('add', images[i]);
        }
        $(this).prop('disabled', true)
          });
  </g:javascript>
</html>
