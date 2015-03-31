<!DOCTYPE HTML>
<!--
	Autonomy by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<meta name="layout" content="public_main"/>
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
              console.log('Hello!');
              alert('added');
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
							<header>
								<h2>Register</h2>
							</header>
							<!--<a href="#" class="image full"><img src="images/pics12.jpg" alt=""></a>-->
							<p>Donec leo. Vivamus fermentum nibh in augue. Praesent a lacus at urna congue rutrum. Nulla enim eros, porttitor eu, tempus id, varius non, nibh.</p>
              <h3>Your info</h3><br />
              <div class="orderForm">
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
                      <td class="name">Confirm password:</td>
                      <td><input type="password" name="confirm_password" /></td>
                    </tr>
                    <tr>
                      <td class="name">Address:</td>
                      <td><input type="text" name="address1" /></td>
                    </tr>
                    <tr>
                      <td class="name">Address (line 2):</td>
                      <td><input type="text" name="address2" /></td>
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
                  </tbody>
                </table>
              </div>
              <br />
              <br />
              <h3>Attendee info &nbsp;&nbsp;<input id="addAttendee" type="submit" value="Add attendee" /></h3><br />
<div id="newAttendee" title="Add new attendee">
              <div class="attendeeInfoForm">
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
                      <td class="name">Phone number:</td>
                      <td><input type="text" name="phone" /></td>
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
                      <td><g:select name="ticketType" from="${['Single $399.00', 'Double $299.00', 'Triple 269.00', 'Quad $249.00', 'Family Rate', 'Commuter Plan A $199.00', 'Commuter Plan B $89.00']}" /></td>
                    </tr>
                  </tbody>
                </table>
              </div>
</div>
              <div class="attendeeForm">
                <table border="1">
                  <thead>
                    <th>Name</th>
                    <th>Ticket type</th>
                  </thead>
                  <tbody>
                    <tr>
                      <td>George Spratt</td>
                      <td>Single</td>
                    </tr>
                    <tr>
                      <td>Wilbur Wright</td>
                      <td>Quad</td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <p id="r_end"><span class="left"><input type="submit" value="Purchase" /></span><span class="right"><strong>Total:</strong> $456.78</span></p>
							
						</section>
					</div>
					<div class="3u">
						<section>
							<header>
								<h2>Donec dictum metus</h2>
							</header>
						</section>
						<section>
							<a href="#" class="image full"><img src="images/pics04.jpg" alt=""></a>
							<header>
								<h2>Donec dictum</h2>
							</header>
							<p>Pellentesque viverra vulputate enim. Aliquam erat volutpat. Curabitur sem urna, consequat mattis placerat, nulla.</p>				
						</section>
						<section>
							<a href="#" class="image full"><img src="images/pics05.jpg" alt=""></a>
							<header>
								<h2>Donec dictum</h2>
							</header>
							<p>Pellentesque viverra vulputate enim. Aliquam erat volutpat. Curabitur sem urna, consequat mattis placerat, nulla.</p>				
						</section>
					</div>		
				</div>
			</div>
		</div>
		<div id="marketing">
			<div class="container">
				<div class="row">
					<div class="3u">
						<section>
							<header>
								<h2>Praesent eleifend</h2>
							</header>
							<ul class="style1">
								<li class="first"><img src="images/pics06.jpg" width="80" height="80" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
								</li>
								<li><img src="images/pics07.jpg" width="80" height="80" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
								</li>
								<li><img src="images/pics08.jpg" width="80" height="80" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
								</li>
							</ul>
						</section>
					</div>
					<div class="3u">
						<section>
							<header>
								<h2>Maecenas lectus</h2>

							</header>
							<ul class="style1">
								<li class="first"><img src="images/pics09.jpg" width="80" height="80" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
								</li>
								<li><img src="images/pics10.jpg" width="80" height="80" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
								</li>
								<li><img src="images/pics11.jpg" width="80" height="80" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
								</li>
							</ul>
						</section>
					</div>
					<div class="6u">
						<section>
							<header>
								<h2>Aenean elementum facilisis ligula</h2>
							</header>
							<a href="#" class="image full"><img src="images/pics12.jpg" alt=""></a>
							<p>Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget, tempus et, tellus. Etiam neque. Vivamus consequat lorem at nisl. Nullam non wisi a sem semper eleifend. Donec mattis libero eget urna. Duis pretium velit ac mauris. Proin eu wisi suscipit nulla suscipit interdum. Aenean lectus lorem, imperdiet. Donec mattis libero eget urna. Duis pretium velit ac mauris.</p>
						</section>
					</div>
				</div>
			</div>
		</div>

		<div id="main">
			<div class="container">
				<div class="row">
					<div class="8u">
						<section>
							<header>
								<h2>Maecenas luctus lectus at sapien</h2>
							</header>
							<p>Sed etiam vestibulum velit, euismod lacinia quam nisl id lorem. Quisque erat. Vestibulum pellentesque, justo mollis pretium suscipit, justo nulla blandit libero, in blandit augue justo quis nisl. Fusce mattis viverra elit. Fusce quis tortor. Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget lorem ipsum dolor. Sed etiam vestibulum velit, euismod lacinia quam nisl id lorem. Quisque erat. Vestibulum pellentesque, justo mollis pretium suscipit, justo nulla blandit libero, in blandit augue justo quis nisl. Fusce mattis viverra elit. Fusce quis tortor. Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget lorem ipsum dolor.</p>
							<p>Donec leo. Vivamus fermentum nibh in augue. Praesent a lacus at urna congue rutrum. Nulla enim eros, porttitor eu, tempus id, varius non, nibh. Duis enim nulla, luctus eu, dapibus lacinia, venenatis id, quam. Vestibulum imperdiet, magna nec eleifend rutrum, nunc lectus vestibulum velit, euismod lacinia quam nisl id lorem. Quisque erat. Vestibulum pellentesque, justo mollis pretium suscipit, justo nulla blandit libero, in blandit augue justo quis nisl. Fusce mattis viverra elit. Fusce quis tortor. Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget, tempus et, tellus. Etiam neque. Vivamus consequat lorem at nisl. Nullam non wisi a sem semper eleifend.</p>
						</section>
					</div>
					<div class="4u">
						<section>
							<header>
								<h2>Lectus at sapien</h2>
							</header>
							<ul class="style">
								<li><a href="#">Pellentesque quis elit non gravida blandit.</a></li>
								<li><a href="#">Lorem ipsum dolor sit amet, adipiscing elit.</a></li>
								<li><a href="#">Phasellus nec erat sit pellentesque congue.</a></li>
								<li><a href="#">Cras vitae metus pellentesque pharetra.</a></li>
								<li><a href="#">Maecenas vitae orci vitae  feugiat eleifend.</a></li>
								<li><a href="#">Pellentesque quis elit non gravida blandit.</a></li>
								<li><a href="#">Lorem ipsum dolor sit amet, adipiscing elit.</a></li>
								<li><a href="#">Maecenas vitae orci  tellus feugiat eleifend.</a></li>
							</ul>
						</section>
					</div>
				</div>
			</div>
		</div>

		<!-- Copyright -->
		<div id="copyright">
			<div class="container">
				Design: <a href="http://templated.co">TEMPLATED</a> Images: <a href="http://unsplash.com">Unsplash</a> (<a href="http://unsplash.com/cc0">CC0</a>)
			</div>
		</div>

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
