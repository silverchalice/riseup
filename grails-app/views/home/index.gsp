<!DOCTYPE HTML>
<!--
	Autonomy by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<meta name="layout" content="public"/>
		<title>Welcome to Grails</title>
    <g:javascript library="jquery" plugin="jquery"/>
    <g:javascript src="jquery.cycle2.min.js" />
	</head>
	<body class="homepage">

		<!-- Header -->
		<div id="header">
			<div class="container">

				<!-- Logo -->
				<div id="logo">
					<h1><a href="#">Believers Bible Conference</a></h1>
          <p>Murfreesboro, TN &nbsp; December 29, 2015&#8211;January 1, 2016</p>
				</div>

				<!-- Nav -->
				<nav id="nav">
				</nav>

			</div>
		</div>

		<div id="banner">
		  <img src="${resource(dir:'images/ru', file: 'sd.JPG')}" />
    </div>

		<div id="featured">
			<div class="container">

        <h2>Welcome!</h2>
        <p>Sign up to hear when registration opens.</p>
              <div id="orderFormYo" class="orderForm">
                <g:form name="interest" controller="interested" action="ajaxSave">
                  <table border="1">
                    <thead>
                      <th></th>
                      <th></th>
                    </thead>
                    <tbody>
                      <tr>
                        <td class="name">Name:</td>
                        <td><input type="text" name="name" value="" /></td>
                      </tr>
                      <tr>
                        <td class="name">Email address:</td>
                        <td><input type="text" name="email" value="" /></td>
                      </tr>
                      <tr>
                        <td class="name"></td>
                        <td><g:submitToRemote update="orderFormYo" name="Keep Me Up-To-Date" value="Keep Me Up-To-Date" /></td>
                      </tr>
                    </tbody>
                  </table>
                  
                </g:form>
              </div>

              <p>&nbsp;</p>

				<div class="row">

					<div class="3u">
						<section>
							<a href="#" class="image full"><img src="images/pics02.jpg" alt=""></a>
							<header>
								<h2>Map</h2>
							</header>
							<p>Pellentesque viverra vulputate enim. Aliquam erat volutpat. Pellentesque tristique ante. Sed vel tellus.</p>				
						</section>
					</div>

					<div class="3u">
						<section>
							<a href="#" class="image full"><img src="images/pics03.jpg" alt=""></a>
							<header>
								<h2>Features</h2>
							</header>
							<p>Pellentesque tristique ante. Sed vel tellus. Curabitur sem urna, consequat suscipit mattis placerat, nulla.</p>				
						</section>
					</div>

					<div class="3u">
						<section>
							<a href="#" class="image full"><img src="images/pics04.jpg" alt=""></a>
							<header>
								<h2>Speakers</h2>
							</header>
							<p>Pellentesque viverra vulputate enim. Aliquam erat volutpat. Curabitur sem urna, consequat mattis placerat, nulla.</p>				
						</section>
					</div>

					<div class="3u">
						<section>
							<a href="#" class="image full"><img src="images/pics05.jpg" alt=""></a>
							<header>
								<h2>Schedule</h2>
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
							<p>This is <strong>Autonomy</strong>, a responsive HTML5 site template freebie by <a href="http://templated.co">TEMPLATED</a>. Released for free under the <a href="http://templated.co/license">Creative Commons Attribution</a> license, so use it for whatever (personal or commercial) &ndash; just give us credit! Check out more of our stuff at <a href="http://templated.co">our site</a> or follow us on <a href="http://twitter.com/templatedco">Twitter</a>.</p>
							<p>Donec leo. Vivamus fermentum nibh in augue. Praesent a lacus at urna congue rutrum. Nulla enim eros, porttitor eu, tempus id, varius non, nibh. Duis enim nulla, luctus eu, dapibus lacinia, venenatis id, quam. Vestibulum imperdiet, magna nec eleifend rutrum, nunc lectus vestibulum velit, euismod lacinia quam nisl id lorem. Quisque erat. Vestibulum pellentesque, justo mollis pretium suscipit, justo nulla blandit libero, in blandit augue justo quis nisl. Fusce mattis viverra elit. Fusce quis tortor. Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget, tempus et, tellus. Etiam neque. Vivamus consequat lorem at nisl. Nullam non wisi a sem semper eleifend.</p>
							<p>Sed etiam vestibulum velit, euismod lacinia quam nisl id lorem. Quisque erat. Vestibulum pellentesque, justo mollis pretium suscipit, justo nulla blandit libero, in blandit augue justo quis nisl. Fusce mattis viverra elit. Fusce quis tortor. Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget lorem ipsum dolor.</p>
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
	</body>
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
