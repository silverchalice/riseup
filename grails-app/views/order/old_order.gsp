<%@ page import="riseup.TicketType" %>

<!DOCTYPE HTML>
<!--
	Ex Machina by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<meta name="layout" content="public"/>
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
	<body class="homepage">

	<!-- Header -->

	<!-- Banner -->
		<div id="banner">
			<div class="container">
			</div>
		</div>
	<!-- /Banner -->

	<!-- Main -->
		<div id="page">

			<!-- Extra -->
			<div id="marketing" class="container">
				<div class="row">
					<div class="3u">
						<section style="text-align: center;">
							<header>
								<h2>Mike Attwood</h2>
							</header>
							<p class="subtitle">Mike Attwood was born in Leeds, England. He was saved by God’s grace at the age of 21.&#8230;</p>
							<p><a href="#ma"><img src="${resource(dir: 'images', file: 'Mike-Attwood.jpg')}" alt=""></a></p>
							<a href="#ma" class="button">More</a>
						</section>
					</div>
					<div class="3u">
						<section style="text-align: center;">
							<header>
								<h2>Nathan Bramsen</h2>
							</header>
							<p class="subtitle">Nathan Bramsen was born and raised in Senegal, West Africa. In 2006, he founded&#8230;</p>
							<p><a href="#nb"><img src="${resource(dir: 'images', file: 'bramsen_nathan.jpg')}" alt=""></a></p>
							<a href="#nb" class="button">More</a>
						</section>
					</div>
					<div class="3u">
						<section style="text-align: center;">
							<header>
								<h2>Joe Reese</h2>
							</header>
							<p class="subtitle">Joe Reese was born and raised in Mississippi, and was born again in 1970. He was&#8230;</p>
							<p><a href="#jr"><img src="${resource(dir: 'images', file: 'Joe-Reese.jpg')}" alt=""></a></p>
							<a href="#jr" class="button">More</a>
						</section>
					</div>
					<div class="3u">
						<section>
							<p><a href="#"><img style="margin-top: 120px;" src="${resource(dir: 'images', file: 'Love-Logo.jpg')}" alt=""></a></p>
						</section>
					</div>
				</div>
			</div>
			<!-- /Extra -->
				
			<!-- Main -->
			<div id="main" class="container">
				<div class="row">
					<div class="6u">
						<section>
							<header>
								<h2>Tuesday, December 29th to Friday, January 1st</h2>
								<span class="byline">Space is limited! Sign up to be notified when registration opens.</span>
							</header>
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
            </div>
            </section>

            <section>
							<header>
								<span class="byline">Location</span>
							</header>

              <p><strong>Embassy Suites & Convention Center</strong></p>

              <p>1200 Conference Center Blvd.<br />Murfreesboro, TN, 37129 USA<br />30 minutes from central Nashville, TN</p>
            </section>

            <section>
							<header>
								<span class="byline">General Session Speakers</span>
							</header>

              <a name="ma"></a>
              <p><strong>Mike Attwood</strong> was born in Leeds, England. He was saved by God’s grace at the age of 21. He trained and served with New Tribes Mission and was involved in church planting in the Irish Republic under the auspices of CMML. He has been involved in itinerant Bible teaching and preaching throughout the US, Canada, and overseas. He is married to Ann Marie and they have 5 adult children. Currently they make their home in Springfield, Missouri, USA.</p>

              <a name="nb"></a>
              <p><strong>Nate Bramsen</strong> was born and raised in Senegal, West Africa. In 2006, he founded <a href="http://www.rockintl.org">ROCK International</a>. ROCK is a non-profit organization seeking to be the &#8220;lap of Jesus&#8221; for children trapped in situations of crisis. Now, he oversees various international development projects, youth discipleship ministries, and carries out a limited itinerant speaking schedule. Today, he calls North Africa &#8220;home&#8221;.</p>

              <a name="jr"></a>
              <p><strong>Joe Reese</strong> was born and raised in Mississippi, and was born again in 1970. He was commended to full time work in 1983.  He has travelled extensively teaching the Word of God throughout Canada, USA, and other countries of the world. Joe and his wife Ann live in Deacon, Ontario, Canada.</p>

							<!--<a href="#" class="button">More Details</a>-->
						</section>
					</div>
					<div class="3u">
						<section class="sidebar">
							<header>
								<h2>About</h2>
							</header>
							<ul class="style2">
								<li>
									<a href="#"><img src="images/pics07.jpg" alt=""></a>
									<p>The Believers Bible Conference is for all ages! Children, seniors, and everyone in between are welcome. The children can enjoy the Children’s Program (ages 5-12), and their own menu planned just for them.</p>
								</li>
								<li>
									<a href="#"><img src="images/pics08.jpg" alt=""></a>
									<p>New this year! Optional young adult message and Q&A time after the evening general sessions!
</p>
								</li>
							</ul>						
						</section>
					</div>
					<div class="3u">
						<section class="sidebar">
							<header>
								<h2>Seminars</h2>
							</header>
							<ul class="style1">
								<li>Love the Word</li>
								<li>Love the Assembly</li>
								<li>Love the Quiet Place</li>
								<li>Love Not the World</li>
								<li>Love Service for the Lord</li>
								<li>Love for the Flock/Shepherd</li>
								<li>Love the Home</li>
								<li>Love Young People</li>
								<li>Love the World (Missions)</li>
								<li>Love for Israel</li>
								<li>Love His Appearing</li>
								<li>Love My Neighbord</li>
								<li>Love the Erring One</li>
								<li>Love the Little Children</li>
							</ul>
						</section>
						<section class="sidebar">
							<header>
								<h2>Women Only</h2>
							</header>
							<ul class="style1">
								<li>Love Hospitality</li>
								<li>Loving the Lost</li>
								<li>Loving your Husband/Family</li>
							</ul>
						</section>
						<section class="sidebar">
							<header>
								<h2>Young Adult Messages and Q&A</h2>
							</header>
							<ul class="style1">
								<li>Tuesday Night: Nathan Bramsen</li>
								<li>Wednesday Night: Scott DeGroff</li>
								<li>Thursday Night: Jesse Gentile</li>
							</ul>
						</section>
						<section class="sidebar">
							<header>
								<h2>Speakers</h2>
							</header>
							<ul class="style1">
								<li>Robert Brown</li>
								<li>Bob Dadd</li>
								<li>Grady Dollar</li>
								<li>Jesse Gentile</li>
								<li>Brian Gunning</li>
								<li>Steve Price</li>
								<li>Bruce Scott</li>
								<li>Rex Trogdon</li>
							</ul>
						</section>
					</div>
				</div>
			</div>
			<!-- Main -->

		</div>
	<!-- /Main -->

	<!-- Featured -->
  <!--
		<div id="featured">
			<div class="container">
				<div class="row">
					<section class="4u">
						<div class="box">
							<a href="#" class="image left"><img src="images/pics04.jpg" alt=""></a>
							<h3>Etiam posuere augue</h3>
							<p>Donec nonummy magna quis risus eleifend. </p>
							<a href="#" class="button">More</a>
						</div>
					</section>
					<section class="4u">
						<div class="box">
							<a href="#" class="image left"><img src="images/pics05.jpg" alt=""></a>
							<h3>Etiam posuere augue</h3>
							<p>Donec nonummy magna quis risus eleifend. </p>
							<a href="#" class="button">More</a>
						</div>
					</section>
					<section class="4u">
						<div class="box">
							<a href="#" class="image left"><img src="images/pics06.jpg" alt=""></a>
							<h3>Etiam posuere augue</h3>
							<p>Donec nonummy magna quis risus eleifend. </p>
							<a href="#" class="button">More</a>
						</div>
					</section>
				</div>
				<div class="divider"></div>
			</div>
		</div>
    -->
	<!-- /Featured -->

	<!-- Footer -->
    <!--
		<div id="footer">
			<div class="container">
				<div class="row">
					<div class="3u">
						<section>
							<h2>Maecenas lectus</h2>
							<div class="balloon">
								<blockquote>&ldquo;&nbsp;&nbsp;Donec leo, vivamus ullamcorper fermentum nibh in augue pulvinar ullamcorper metus praesent a lacus at urna congue ullamcorper  rutrum.&nbsp;&nbsp;&rdquo;<br>
									<br>
									<strong>&ndash;&nbsp;&nbsp;John Smith</strong></blockquote>
							</div>
							<div class="ballon-bgbtm">&nbsp;</div>
						</section>
					</div>
					<div class="3u">
						<section>
							<h2>Donec dictum</h2>
							<ul class="default">
								<li>
									<h3>Mauris vulputate dolor sit amet</h3>
									<p><a href="#">Donec leo, vivamus fermentum nibh in augue praesent a lacus at urna congue rutrum.</a></p>
								</li>
								<li>
									<h3>Fusce ultrices fringilla metus</h3>
									<p><a href="#">Donec leo, vivamus fermentum nibh in augue praesent a lacus at urna congue rutrum.</a></p>
								</li>
								<li>
									<h3>Donec dictum metus in sapien</h3>
									<p><a href="#">Donec leo, vivamus fermentum nibh in augue praesent a lacus at urna congue rutrum.</a></p>
								</li>
							</ul>
						</section>
					</div>
					<div class="3u">
						<section>
							<h2>Nulla leifend</h2>
							<p>Donec placerat odio vel elit. Nullam ante orci, pellentesque eget, tempus quis, ultrices in, est. Curabitur sit amet nulla. Nam in massa. Sed vel tellus. Curabitur sem urna, consequat.</p>
							<ul class="style5">
								<li><a href="#"><img src="images/pics07.jpg" alt=""></a></li>
								<li><a href="#"><img src="images/pics08.jpg" alt=""></a></li>
								<li><a href="#"><img src="images/pics09.jpg" alt=""></a></li>
								<li><a href="#"><img src="images/pics10.jpg" alt=""></a></li>
								<li><a href="#"><img src="images/pics11.jpg" alt=""></a></li>
								<li><a href="#"><img src="images/pics12.jpg" alt=""></a></li>
							</ul>
							<a href="#" class="button">More Collections</a>
						</section>
					</div>
					<div class="3u">
						<section>
							<h2>Luctus eleifend</h2>
							<p><strong>Aliquam erat volutpat. Pellentesque tristique ante ut risus. </strong></p>
							<p>Quisque dictum. Integer nisl risus, sagittis convallis, rutrum id, elementum congue, nibh. Suspendisse dictum porta lectus. Donec placerat odio vel elit.</p>
							<p>Donec placerat odio vel elit. Nullam ante orci, pellentesque eget, tempus quis, ultrices in, est. Curabitur sit amet nulla. Nam in massa. Sed vel tellus. Curabitur sem urna, consequat.</p>
							<a href="#" class="button">More Collections</a>
						</section>
					</div>
				</div>
			</div>
		</div>
	<!-- /Footer -->
  -->
	</body>
</html>
