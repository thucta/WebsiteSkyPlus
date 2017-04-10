<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="UTF-8">
<meta content="profile email" name="google-signin-scope">
<meta name="google-signin-client_id"
	content="314227735611-kr9iuio2v4cj4j10v00kfoanm7fs5ue2.apps.googleusercontent.com">
<title>SkyPlus with Love</title>
<link
	href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'
	rel='stylesheet' type='text/css'>

<!-- Include Fontawesome Min Css -->
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<!-- Include Bootstrap Css -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/login.css">
<link rel="stylesheet" href="assets/css/bootstrap-social.css">
</head>
<body>
	<%
		String data = (String) request.getAttribute("Error");
		if (data != null) {
	%>
	<script>
		alert('Email hoặc password nhập sai!Xin nhập lại');
	</script>
	<%
		}
	%>

	<span id="body"> <header id="masthead"
			class="masthead navbar navbar-default navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#main-menu">
					<i class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="index.jsp#main-slider"><img
					src="images/sky++.PNG" alt="Site Logo"></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<nav id="main-menu" class="collapse navbar-collapse pull-right">
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp#main-slider">Trang
						Chủ</a></li>
				<li><a href="SearchHotel.jsp">Khách Sạn</a></li>
				<li><a href="SearchRestaurant.jsp">Nhà Hàng</a></li>
				<li><a href="index.jsp#contact">Liên Hệ</a></li>
				<%
					String result = (String) request.getSession().getAttribute("login");
					if (result != null) {
				%>
				<li><a href="ProfileUser.jsp">Trang Cá Nhân</a></li>
				<%
					} else {
				%>
				<li><a href="Login.jsp">Đăng Nhập</a></li>
				<%
					}
				%>
			</ul>
			</nav>
		</div>
		<!-- /.container --> </header> <!-- /#masthead --> <!-- Header Section --> <!--Test popup  -->

		<div data-role="dialog" id="dialog-ajax" class="padding20"
			data-close-button="true" data-href="Login.html" data-width="600"></div>

		<!-- Test popup --> <!-- Main Slider -->
		<div class="form">
			<ul class="tab-group">
				<li class="tab "><a href="#signup">Đăng Ký</a></li>
				<li class="tab active"><a href="#login">Đăng Nhập</a></li>
			</ul>
			<div class="tab-content">
				<div id="login">
					<h1>Chào mừng đến với SkyPlus!</h1>
					<form action="./Login" method="post">
						<div class="field-wrap">
							<label> Email <span class="req">*</span>
							</label> <input name="username" type="email" required autocomplete="off" />
						</div>
						<div class="field-wrap">
							<label> Mật khẩu<span class="req">*</span>
							</label> <input name="password" type="password" required
								autocomplete="off" />
						</div>
						<p class="forgot">
							<a href="#">Quên mật khẩu?</a>
						</p>
						<span id="error" style="color: #e74c3c"></span>
						<hr>
						<div class="text-center">
							<div class="g-signin2" data-onsuccess="onSignIn"
								data-theme="dark">
								<a class="btn btn-social-icon btn-google"> <span
									class="fa fa-google"> <script>
										var id_token;
										function onSignIn(googleUser) {
											// Useful data for your client-side scripts:
											var profile = googleUser
													.getBasicProfile();
											/* 		document.getElementById('status1').innerHTML = ('Full Name: ' + profile
															.getName());
													document.getElementById('status2').innerHTML = ("Email: " + profile
															.getEmail()); */
											// The ID token you need to pass to your backend:
											id_token = googleUser
													.getAuthResponse().id_token;
											console
													.log("ID Token: "
															+ id_token);

											if (id_token != null) {
												var xhr = new XMLHttpRequest();

												xhr.onreadystatechange = function() {
													if (xhr.readyState == 4) {
														var data = xhr.responseText;
														document
																.getElementById("body").innerHTML = data;
													}
												}

												xhr
														.open(
																'GET',
																'./Login?password=gg&&fullname='
																		+ profile
																				.getName()
																		+ '&&username='
																		+ profile
																				.getEmail(),
																true);
												xhr.send(null);
											}
										};
									</script>


								</span>

								</a> <span style="color: white">Đăng nhập với Google</span>
							</div>
						</div>
						<hr>
						<button class="button button-block" />
						Đăng Nhập
						</button>
					</form>
				</div>
				<div id="signup">
					<h1>Chào mừng đến với SkyPlus!</h1>
					<form action="./Register" method="post">
						<div class="top-row">
							<div class="field-wrap">
								<label> Họ :<span class="req">*</span>
								</label> <input type="text" required autocomplete="off" name="firstName" />
							</div>
							<div class="field-wrap">
								<label> Tên :<span class="req">*</span>
								</label> <input type="text" required autocomplete="off" name="lastName" />
							</div>
						</div>
						<div class="field-wrap">
							<label> Email <span class="req">*</span>
							</label> <input type="email" required autocomplete="off" name="email"
								id="email" /> <span id="result"> </span>
						</div>
						<div class="field-wrap">
							<label> Mật Khẩu<span class="req">*</span>
							</label> <input type="password" required autocomplete="off"
								name="password" />
						</div>
						<button type="submit" class="button button-block">Đăng Ký</button>
					</form>


				</div>
			</div>
			<!-- tab-content -->
		</div> <!-- /form --> <script
			src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
		<script src="assets/js/login.js"></script> <!-- Include Ajax --> <script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

	</span>

	<script>
		$(document).ready(function() {
			$('#email').change(function() {
				$("#result").text("");
				var email = $("#email").val();
				if (validateEmail(email)) {
					giatri = this.value;
					$('#result').load('./CheckEmail?email=' + giatri);
					if ($('#result').Text == "Email is valid") {
						$("#email").css("color", "green");
					} else {
						$("#email").css("color", "pink");
					}
				} else {
					$("#email").css("color", "red");
				}
			})
		});
		function validateEmail(email) {
			var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			return re.test(email);
		};
		function createCORSRequest(method, url) {
			var xhr = new XMLHttpRequest();
			if ("withCredentials" in xhr) {

				// Check if the XMLHttpRequest object has a "withCredentials" property.
				// "withCredentials" only exists on XMLHTTPRequest2 objects.
				xhr.open(method, url, true);

			} else if (typeof XDomainRequest != "undefined") {

				// Otherwise, check if XDomainRequest.
				// XDomainRequest only exists in IE, and is IE's way of making CORS requests.
				xhr = new XDomainRequest();
				xhr.open(method, url);

			} else {

				// Otherwise, CORS is not supported by the browser.
				xhr = null;

			}
			return xhr;
		}
	</script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>

</body>
</html>