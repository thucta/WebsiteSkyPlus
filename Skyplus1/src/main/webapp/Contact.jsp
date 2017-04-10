<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import=" entity.City"%>
<%@ page import=" entity.Information"%>
<%@	page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SkyPlus With love</title>
<link rel="apple-touch-icon" href="apple-touch-icon.png">
<!-- Include Bootstrap Css -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<!-- Include Bootstrap Min Css -->
<link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">
<!-- Include Fontawesome Min Css -->
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<!-- Include Flaticon Css -->
<link rel="stylesheet" href="assets/css/flaticon.css">
<!-- Include Style Css -->
<link rel="stylesheet" href="assets/css/style.css">
<!-- Include Responsive Css -->
<link rel="stylesheet" href="assets/css/responsive.min.css">
<!-- Include Modernizer Js -->
<script src="assets/js/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<link href="assets/css/metro.css" rel="stylesheet">
<script src="assets/js/metro.js"></script>

<!-- Include Ajax -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

</head>
<body>

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
		<nav id="main-menu" class="collapse navbar-collapse pull-right">			<ul class="nav navbar-nav">
			<li class="active"><a href="index.jsp#main-slider">Trang Chủ</a></li>
			<li><a href="SearchHotel.jsp">Khách Sạn</a></li>
			<li><a href="SearchRestaurant.jsp">Nhà Hàng</a></li>
			<li><a href="index.jsp#contact">Liên Hệ</a></li>
			<%String result = (String)request.getSession().getAttribute("login");
				if(result!=null)
				{
					%>
				<li><a href="ProfileUser.jsp">Trang Cá Nhân</a></li>	
					<% 
				}
				else{
				%>
			<li><a href="Login.jsp">Đăng Nhập</a></li>
			<%} %>
		</ul>
		</nav>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </header>
	<!-- /#masthead -->

	<!-- Header Section -->


	<!-- Page Head -->

	<section id="page-head" class="page-head text-center"
		data-stellar-background-ratio="0.1" data-stellar-vertical-offset="0">
	<div class="head-overlay">
		<div class="section-padding">
			<div class="container">
				<div class="head-overlay">
					<img src="images/blog/1.jpg" />
				</div>
				<!-- /.head-overlay -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.section-padding -->
	</div>
	<!-- /.head-overlay --> </section>
	<!-- /#page-head -->
	<!-- Page Head -->
	
		<h1>Cảm ơn bạn đã quan tâm, chúng tôi đang hoàn thiện chức năng này</h1>
	
	
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

</body>
</html>