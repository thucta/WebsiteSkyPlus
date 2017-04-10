<%@page import="entity.InforRating"%>
<%@page import="skyplus.config.Config"%>
<%@page import="entity.Service"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import=" entity.Service"%>
<%@ page import=" entity.Partner"%>
<%@ page import=" entity.Information"%>
<%@	page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html class="no-js" lang="">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SkyPlus-With love</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">
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
<!-- Include Bootstrap social Css -->
<link rel="stylesheet" href="assets/css/bootstrap-social.css">
<!-- Include Modernizer Js -->
<script src="assets/js/modernizr-2.8.3-respond-1.4.2.min.js"></script>

</head>
<body style="font-family:Arial;">


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
	</div>
	<!-- /.container --> </header>
	<!-- /#masthead -->

	<!-- Header Section -->
	<!--Test popup  -->

	<div data-role="dialog" id="dialog-ajax" class="padding20"
		data-close-button="true" data-href="Login.html" data-width="600"></div>

	<!-- Test popup -->

	<!-- Main Slider -->

	<section id="main-slider" class="main-slider text-center">
	<div class="head-overlay">
		<ul class="bxslider">
			<li>
				<div class="head-overlay">
					<img src="images/Banner.jpg" />
				</div> <!-- /.head-overlay -->

				<div class="slider-text">
					<div class="slide-inner">
						<h2 class="slider-title"
							data-animation="wow animated bounceInDown">
							Chào mừng đến <span>SkyPlus</span>
						</h2>
						<p class="slide-description">SkyPlus là website kết nối giữa nhà hàng, khách sạn đến với mọi người</p>
						<!-- /.slide-btn-container -->
					</div>
					<!-- /.slide-inner -->
				</div> <!-- /.slider-text -->
			</li>
			<%
				List<Service> services = (List<Service>) request.getAttribute("Services");
				if (services != null)
					for (int i = 0; i < 2; i++) {
			%>
			<li>
				<div class="head-overlay">
					<img src="<%=services.get(i).getName()%>" />
				</div> <!-- /.head-overlay -->
				<div class="slider-text">
					<div class="slide-inner">
						<h2 class="slider-title">
							<%=services.get(i).getName()%>
						</h2>
						<p class="slide-description"><%=services.get(i).getInformations()%></p>

						<!-- /.slide-btn-container -->
					</div>
					<!-- /.slide-inner -->
				</div> <!-- /.slider-text -->
			</li>

			<%
				}
			%>
		</ul>
	</div>
	<!-- /.head-overlay --> <!-- Top looking for --> <!-- Main Slider -->


	<div class="clearfix"></div>
	<!-- /.clearfix --> <!-- Restaurant Section --> <!-- Restaurant Section -->
	<!-- Partner Section --> <section id="place"
		class="portfolio text-center">
	<div class="portfolio-bottom">
		<div class="section-padding">
			<div class="section-top wow animated fadeInUp" data-wow-delay=".5s">
				<h2 class="section-title">
					<span>Wanna</span> Stay and Eat
				</h2>
				<!-- /.section-title -->
				<!--   <p class="section-description">
          </p>/.section-description -->
			</div>
			<!-- /.section-top -->

			<div class="latest-projects wow animated fadeInUp"
				data-wow-delay=".5s" >
				<div class="itemFilter">
					<!-- <a href="#" data-filter="" class="current">All</a> -->
					<%
						List<Partner> partners = (List<Partner>) request.getAttribute("allpartner");

						if (partners != null) {
							for (int i = 0; i < partners.size(); i++) {
					%>
					<a href="#" data-filter=".cat-<%=i + 1%>"><%=partners.get(i).getName()%></a>
					<%
						}
						}
					%>
				</div>
				<!-- /.itemFilter -->

				<div id="project-items" class="project-items">
					<%
						List<InforRating> informations = (List<InforRating>) request.getAttribute("TopRating");
						if (informations == null) {
							request.getRequestDispatcher("./GetAllListForIndex").forward(request, response);
							return;
						}
						if (informations != null) {
							int count = 0;
							int temp = 1;

							for (int i = 0; i < informations.size(); i++) {
								count++;
								if (count == 7) {
									temp = temp + 1;
									count = 0;
								}
					%>
					<div class="item cat-<%=temp%>" style="padding: 2px 2px;">
						<a style="width: 100%;height: 100%;" 
							href="<%="./GetSingleInformation?partner=" + (temp) + "&name="
							+ informations.get(i).getInFor().getId()%>"
							class="image-popup-vertical-fit"> <img style="height: 100%; width: 100%;"
							src="<%=Config.URLFORIMG + informations.get(i).getInFor().getImages().get(0)%>"
							alt="Item Image">
						</a>
						<div class="item-details">
							<h3 class="project-title"><%=informations.get(i).getInFor().getName()%></h3>
							<span class="category"><%=informations.get(i).getInFor().getIntroduction()%></span>
						</div>
						<!-- /.item-details -->
					</div>
					<!-- /.item -->
					<%
						}
						}
					%>
				</div>

				<!-- /#project-items -->
			</div>
			<!-- /.latest-projects -->
		</div>
		<!-- /.section-padding -->
	</div>
	<!-- /.portfolio-bottom --> </section> <!-- Partner Section --> <!-- Contact Section -->

	<section id="contact" class="contact">
	<div class="contact-inner">
		<div class="col-md-7">
		<div id="google-map" class="google-map">
			<div class="google-map-container">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.5164959194935!2d106.7841407134875!3d10.848265160833137!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276bb276eaf7%3A0x56a6a0eafe0e3b09!2zOTcgTWFuIFRoaeG7h24sIEhp4buHcCBQaMO6LCBRdeG6rW4gOSwgSOG7kyBDaMOtIE1pbmgsIFZpZXRuYW0!5e0!3m2!1sen!2s!4v1491448012624" 
				 frameborder="0" style="border:0;width:100%;height:100%" allowfullscreen></iframe>
			</div>

		</div>
		</div>
		<!-- /#google-map -->
<div class="col-md-5">
		<div class=" text-center wow animated fadeInRight"
			data-wow-delay=".75s">
			<h2 class="section-title">
				<span>Liên Hệ</span> với chúng tôi
			</h2>
			<!-- /.section-title -->
			<form action="./SendMail" method="post" id="contactform"
				class="contactform">
				<input id="name" class="form-control" name="name" type="text"
					placeholder="Tên" value="" required> <input id="email"
					class="form-control " name="email" type="email"
					placeholder="Email" value="" required>
				<textarea id="message" class="form-control" name="message"
					placeholder="Lời nhắn" rows="5" required></textarea>
				<button name="submit" class="btn submit-btn" type="submit"
					id="submit">Gửi Mail</button>
			</form>
			<!-- /#contactform -->
		</div>
		</div>
		<!-- /.form-area -->
	</div>
	<!-- /.contact-inner --> </section> <!-- Contact Section --> <!-- Footer Section -->

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
	</footer> <!-- Footer Section -->



	<div id="scroll-to-top" class="scroll-to-top">
		<span> <i class="fa fa-chevron-up"></i>
		</span>
	</div>
	<!-- /#scroll-to-top --> <!-- Include jQuery Js --> <script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- Include jQuery Js --> <script>
		window.jQuery
				|| document
						.write(
								'<script src="assets/js/jquery-1.11.2.min.js"><\/script>')
	</script> <!-- Include WOW Min Js --> <script src="assets/js/wow.min.js"></script>
	<!-- Google Maps Script --> <script
		src="http://maps.google.com/maps/api/js?sensor=true"></script> <!-- Gmap3.js For Static Maps -->
	<script src="assets/js/gmap3.js"></script> <!-- Include Waypoint Js -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
	<!-- Include Ajax MailChimp Js --> <script
		src="assets/js/jquery.ajaxchimp.min.js"></script> <!-- Include Custom Js </-->
	<script src="assets/js/custom.min.js"></script> <script>
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
	</script> <script>
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
								}),
				$("#contactform")
						.on(
								"submit",
								function(e) {
											e.preventDefault(),
											$this = $(this),
											$
													.ajax({
														type : "POST",
														url : $this
																.attr("action"),
														data : $this
																.serialize(),
														success : function() {
															alert("Cảm ơn bạn đã quan tâm, xin vui lòng check mail")
														}
													})
								});
	</script>
</body>
</html>
