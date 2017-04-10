<%@page import="entity.DetailInfor"%>
<%@page import="skyplus.config.Config"%>
<%@page import="entity.Room"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SkyPlus-With love</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Include Bootstrap Css -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<!-- Include Bootstrap Min Css -->
<link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">
<!-- Include Animate Min Css -->
<link rel="stylesheet" href="assets/css/animate.min.css">
<!-- Include Fontawesome Min Css -->
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<!-- Include Magnific PopUp Css -->
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<!-- bxSlider CSS file -->
<link href="assets/css/jquery.bxslider.css" rel="stylesheet" />
<!-- Include Style Css -->
<link rel="stylesheet" href="assets/css/style.css">
<!-- Include Responsive Css -->
<link rel="stylesheet" href="assets/css/responsive.min.css">
<!-- Include Login Css -->
<!-- <link rel="stylesheet" href="assets/css/login.css"> -->
<!-- Include Bootstrap social Css -->
<link rel="stylesheet" href="assets/css/bootstrap-social.css">
<!-- Include Modernizer Js -->
<script src="assets/js/modernizr-2.8.3-respond-1.4.2.min.js"></script>

</head>
<body style="font-family: sans-serif;">
	<%
	DetailInfor information = (DetailInfor) request.getSession().getAttribute("MainInformation");
	%>
	<!-- Header Section -->

	<header id="masthead"
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
			<li class="active"><a href="index.jsp#main-slider">Trang Chủ</a></li>
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
		<!-- /.navbar-collapse -->
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </header>
	<!-- /#masthead -->

	<!-- Header Section -->


	<!-- Page Head -->
	<%
		if (information == null) {
	%>
	<div class="text-center">
		<h1>Không tìm thấy Khách sạn/nhà hàng được yêu cầu</h1>
	</div>
	<%
		} else {
	%>
	<section id="page-head" class="page-head text-center"
		data-stellar-background-ratio="0.1" data-stellar-vertical-offset="0">
	<div class="head-overlay">
		<img style="width: 100%; height: 500px;"
			src="<%=Config.URLFORIMG + information.getInformation().getImages().get(0)%>" />
		<!-- <div class="section-padding">
			<div class="container">
				<div class="head-overlay">
					
				</div>
				/.head-overlay
			</div>
			/.container
		</div> -->
		<!-- /.section-padding -->
	</div>
	<!-- /.head-overlay --> </section>
	<!-- /#page-head -->

	<!-- Page Head -->

	<!-- Main Content Section -->

	<section id="main-content" class="main-content">
	<div class="container">
		<div class="row">

			<div class="col-md-9">
				<form action="./BookRoom" method="post" id="contactform">
					<article class="post type-post">
					<div class="post-head media">
						<div class="media-body">
							<h2 class="entry-title"><%=information.getInformation().getName()%></h2>
							<!-- /.entry-title -->
							<div class="share-post pull-right">
								<ul class="share-list">
													<%
										String linkRating = "#";
										String linkImg="images/Tim.png";
											if (information.getStatus() == (-1)) {
												linkRating = "./Login.jsp";
											} else {
												if (information.getStatus() == 0) {
													linkRating = "./IncreaseRating?partner=" + information.getInformation().getPartner() + "&name="
															+ information.getInformation().getId();
												} else {
													linkRating = "./DecreaseRating?partner="+ information.getInformation().getPartner() + "&name="
															+ information.getInformation().getId();
													linkImg="images/The-heart.png";
												}
											}
									%> <a href="<%=linkRating%>"> <img src="<%=linkImg %>"
										style="width: 90%; height: 90%"></a>
								</li>
								<div class="comments pull-right">
									<span class="count"><%=information.getRating()%></span> người
									quan tâm
								</div>
								</ul>

								<!-- /.comments -->
							</div>
							<div class="post-meta">
								<div class="entry-meta">
									<div class="author pull-left">5 starts</div>
									<!-- /.author -->

								</div>
								<!-- /.entry-meta -->
							</div>
							<!-- /.post-meta -->
						</div>
					</div>
					</article>

					<!-- /.post-head -->
					<ul>
						<%
							for (int i = 0; i < information.getInformation().getRooms().size(); i++) {
						%>
						<li class="comment parent media">
						<div class="col-md-4 pull-left">
								<div class="comment-content media-body">
									<div class="comment-meta">
										<div class="tile ol-transparent pull-left" data-role="tile">
											<img class="img-circle media-object "
												src="<%=Config.URLFORIMG+information.getInformation().getRooms().get(i).getImage()%>" alt="Item Image">
										</div>
										<!-- /.comment-author -->
									</div>
								<!-- 	/.comment-content -->
								</div>
							</div>
							<div class="col-md-6 pull-right">  
								<span class="section-title"> <a href=""
									style="color: #000;"> <%=information.getInformation().getRooms().get(i).getType()%>
								</a>
								</span>
								<!-- /.comment-meta -->
								<p class="comment-description">
									<span style="color: #e74c3c">Số người tối đa:<%=information.getInformation().getRooms().get(i).getMaxpeople()%></span>
									_____________Hiện tại phòng
									<%=information.getInformation().getRooms().get(i).getDetail()%>
								</p>
								<div class="widget widget_categories">
									<h4 class="widget-title">Số phòng cần đặt</h4>
									<!-- /.widget-title -->
									<div class="widget-details">
										<div class="categories-list">
											<input type="hidden" id="<%=i%>" name="<%=i%>"
												value="<%=information.getInformation().getRooms().get(i).getId()%>">
											<select class="form-control" id="select<%=i%>"
												name="select<%=i%>">
												<option value="0">0 phòng</option>
												<%
													for (int j = 0; j < Integer.parseInt(information.getInformation().getRooms().get(i).getQuanlity()); j++) {
												%>
												<option value="<%=j + 1%>"><%=j + 1%> phòng
												</option>
												<%
													}
												%>



											</select>
										</div>
										<!-- /.categories-list -->
									</div>
									<!-- /.widget-details -->
								</div>
								<!-- /.widget -->
						<!-- 	</div> -->
						</li>
						<%
							}
						%>
					</ul>
					<input type="date" style="visibility: hidden;" name="dateintemp"
						id="dateintemp" min="1899-01-01"> <input type="date"
						style="visibility: hidden;" name="dateouttemp" id="dateouttemp"
						min="1899-01-01">
					<button name="submit" class="btn submit-btn pull-right"
						type="submit" id="submit"
						style="background: #e74c3c; color: #fff;">Đặt phòng</button>
				</form>
			</div>
			<div class="col-md-3">
				<%
					String hotelname = "City Star";
				%>
				<form action="./GetRoomActive?name=<%=hotelname%>">
					<h5>Ngày nhận phòng</h5>
					<input type="date" min="1899-01-01" id="datein" name="datein"
						onchange="myFunction()" onclick="myFunction()"
						style="width: 200px">
					<h5>Ngày trả phòng</h5>
					<input type="date" id="dateout" name="dateout" min="1899-01-01"
						onchange="myFunction()" onclick="myFunction()"
						style="width: 200px">
					<button name="submit" class="btn submit-btn pull-right"
						type="submit" id="submit"
						style="background: #e74c3c; color: #fff;">Check</button>
				</form>
			</div>

		</div>
	</div>
	</section>
	<!-- Room Section -->


	<hr>
	<!-- Booking section -->
	<section id="booking" class="contact">
	<div class="contact-inner">
		<div id="floating-panel">
			<input id="address" type="hidden"
				value="<%=information.getInformation().getNumber() + "," + information.getInformation().getStreet() + "," + information.getInformation().getWard() + ","
						+ information.getInformation().getDistrict() + "," + information.getInformation().getProvince()%>">
			<!--Dia chỉ truyền vào -->
		</div>
		<div class="container-fluid" id="map"
			style="padding-left: 100px; width: 100%; height: 450px;"></div>
		<!-- /#google-map -->

		<!-- /#contactform -->
	</div>
	<!-- /.form-area -->
	</div>
	<!-- /.contact-inner --> </section>

	<%
		}
	%>

	<!-- Booking section -->

	<!-- /#main-content -->

	<!-- Main Content Section -->

	<!-- Footer Section -->

	<footer id="colophon" class="footer site-footer" role="contentinfo">
	<div class="footer-bottom">
		<div class="container">
			<div class="footer-menu pull-left">
				<div class="widget widget_menu">
					<nav class="widget-menu">
					<ul>
						<li><a href="#">Home</a></li>
						<li><a href="#">Sky4++</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
					</nav>
				</div>
			</div>
			<div class="copy-right pull-right">
				&copy; <a href="#" target="_blank">Sky++</a> 2017 - All Reserves.
				Developed by <a href="#" target="_blank">Sky++</a>. Designed by 5
				young guys
			</div>
		</div>
	</div>
	</footer>

	<!-- Footer Section -->



	<div id="scroll-to-top" class="scroll-to-top">
		<span> <i class="fa fa-chevron-up"></i>
		</span>
	</div>
	<!-- /#scroll-to-top -->
	<script type="text/javascript">
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth() + 1; //January is 0!
		var yyyy = today.getFullYear();
		if (dd < 10) {
			dd = '0' + dd
		}
		if (mm < 10) {
			mm = '0' + mm
		}

		today = yyyy + '-' + mm + '-' + dd;
		document.getElementById("datein").setAttribute("min", today);
		document.getElementById("datein").setAttribute("value", today);
		document.getElementById("dateout").setAttribute("min", today);
		document.getElementById("dateout").setAttribute("value", today);
		document.getElementById("dateintemp").setAttribute("value", today);
		document.getElementById("dateouttemp").setAttribute("value", today);
		function myFunction() {
			var x = document.getElementById("in");
			var defaultVal = x.defaultValue;
			var currentVal = x.value;

			var y = document.getElementById("out");
			document.getElementById("out").setAttribute("min", currentVal);

			document.getElementById("out").setAttribute("value", currentVal);

			document.getElementById("dateintemp").setAttribute("value",
					currentVal);
			document.getElementById("dateouttemp").setAttribute("value",
					currentVal);
		}
	</script>



	<!-- Include jQuery Js -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- Include jQuery Js -->
	<script>
		window.jQuery
				|| document
						.write(
								'<script src="assets/js/jquery-1.11.2.min.js"><\/script>')
	</script>
	<!-- Include Plugins Js </-->
	<script src="assets/js/custom.min.js"></script>
	<!-- Include WOW Min Js -->
	<script src="assets/js/wow.min.js"></script>
	<!-- Include Waypoint Js -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
	<!-- Google Maps Script -->
	<script src="http://maps.google.com/maps/api/js?sensor=true"></script>
	<!-- Gmap3.js For Static Maps -->
	<script src="assets/js/gmap3.js"></script>
	<script>
		(
								function(i, s, o, g, r, a, m) {
									i['GoogleAnalyticsObject'] = r;
									i[r] = i[r] || function() {
										(i[r].q = i[r].q || []).push(arguments)
									}, i[r].l = 1 * new Date();
									a = s.createElement(o), m = s
											.getElementsByTagName(o)[0];
									a.async = 1;
									a.src = g;
									m.parentNode.insertBefore(a, m)
								})
						(window, document, 'script',
								'//www.google-analytics.com/analytics.js', 'ga');

		ga('create', 'UA-63948535-1', 'auto');
		ga('send', 'pageview');
	</script>
	<script>
		$(".bxslider")
						.bxSlider(
								{
									auto : !0,
									preloadImages : "all",
									mode : "horizontal",
									captions : !1,
									controls : !0,
									pause : 4000,
									speed : 1200,
									onSliderLoad : function() {
												$(".bxslider>li .slide-inner")
														.eq(1).addClass(
																"active-slide"),
												$(
														".slide-inner.active-slide .slider-title")
														.addClass(
																"wow animated bounceInDown"),
												$(
														".slide-inner.active-slide .slide-description")
														.addClass(
																"wow animated bounceInRight"),
												$(
														".slide-inner.active-slide .btn")
														.addClass(
																"wow animated zoomInUp")
									},
									onSlideAfter : function(e, i, n) {
												console.log(n),
												$(".active-slide").removeClass(
														"active-slide"),
												$(".bxslider>li .slide-inner")
														.eq(n + 1).addClass(
																"active-slide"),
												$(".slide-inner.active-slide")
														.addClass(
																"wow animated bounceInRight")
									},
									onSlideBefore : function() {
												$(".slide-inner.active-slide")
														.removeClass(
																"wow animated bounceInRight"),
												$(
														".one.slide-inner.active-slide")
														.removeAttr("style")
									}
								}),
				$(document)
						.ready(
								function() {
									function e() {
										return "ontouchstart" in document.documentElement
									}
									function i() {
										if ("undefined" != typeof google) {
											var i = {
												center : [ -37.817331,
														144.955652 ],
												zoom : 15,
												mapTypeControl : !0,
												mapTypeControlOptions : {
													style : google.maps.MapTypeControlStyle.DROPDOWN_MENU
												},
												navigationControl : !0,
												scrollwheel : !1,
												streetViewControl : !0
											};
													e() && (i.draggable = !1),
													$("#googleMaps")
															.gmap3(
																	{
																		map : {
																			options : i
																		},
																		marker : {
																			latLng : [
																					23.709921,
																					90.407143 ],
																			options : {
																				icon : "images/mapicon.png"
																			}
																		}
																	})
										}
									}
									$("#masthead #main-menu").onePageNav(), i()
								}), $("#contactform").on
		"submit", function(e) {
			var datein = document.getElementById("datein")
					.getAttribute("value");
			var dateout = document.getElementById("dateout").getAttribute(
					"value");
			alert(datein);
			var selectin = document.getElementById("select1").getAttribute(
					"value");
			e.preventDefault(), $this = $(this), $.ajax({

				type : "POST",
				url : $this.attr("action"),
				data : "datein=" + datein + "&dateout=" + dateout + "&select1="
						+ selectin,
				success : function() {
					alert("Message Sent Successfully")
				}
			});
		};
	</script>
	<script>
		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 14,
				center : {
					lat : 0,
					lng : 0
				}
			});
			var geocoder = new google.maps.Geocoder();

			geocodeAddress(geocoder, map);

		};

		function geocodeAddress(geocoder, resultsMap) {
			var address = document.getElementById('address').value;// truyen vào dia chi o day 
			geocoder
					.geocode(
							{
								'address' : address
							},
							function(results, status) {
								if (status === 'OK') {
									resultsMap
											.setCenter(results[0].geometry.location);
									var marker = new google.maps.Marker({
										map : resultsMap,
										position : results[0].geometry.location
									});
								} else {
									alert('Geocode was not successful for the following reason: '
											+ status);
								}
							});
		};
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAqJEIFGxrlxsbVzQml7Ow83bTvdldNSZE&callback=initMap">
		
	</script>
</body>
</html>
