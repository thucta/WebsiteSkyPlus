
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import=" entity.Users"%>
<%@ page import=" entity.Information"%>
<%@	page import="java.util.List"%>
<html class="no-js" lang="">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta content="profile email" name="google-signin-scope">
<meta name="google-signin-client_id"
	content="644301849009-5a4hqh01gfi4icq76e6jg0n6kqng87i0.apps.googleusercontent.com">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<link rel='shortcut icon' type='image/x-icon' href='../favicon.ico' />
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

<link href="assets/css/metro.css" rel="stylesheet">
<link href="assets/css/metro-icons.css" rel="stylesheet">
<link href="assets/css/metro-responsive.css" rel="stylesheet">

<script src="assets/js/jquery-2.1.3.min.js"></script>
<script src="assets/js/jquery.dataTables.min.js"></script>

<script src="assets/js/metro.js"></script>

<style>
html, body {
	height: 100%;
	width: 100%
}

.page-content {
	padding-top: 3.125rem;
	min-height: 100%;
	height: 100%;
}

.table .input-control.checkbox {
	line-height: 1;
	min-height: 0;
	height: auto;
}

@media screen and (max-width: 800px) {
	#cell-sidebar {
		flex-basis: 52px;
	}
	#cell-content {
		flex-basis: calc(100% - 52px);
	}
}
</style>
</head>
<body>
	<%
		Users user = (Users) request.getAttribute("user");
		if (user == null) {
			String email = (String) request.getSession().getAttribute("login");
			if (email != null) {
				request.getRequestDispatcher("./GetProfilePage").forward(request, response);
				return;
			} else {
				request.getRequestDispatcher("./index.jsp").forward(request, response);
				return;
			}
		}
	%>
	<%
		String result = (String) request.getAttribute("Message");
		if ("thanhcong".equals(result)) {
	%>
	<script type="text/javascript">
		alert("Sửa thông tin thành công");
	</script>
	<%
		} else {
			if ("thatbai".equals(result)) {
	%>
	<script type="text/javascript">
		alert("Sửa thông tin thất bại. Xin thử lại sau");
	</script>

	<%
		}
		}
	%>
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
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp#main-slider">Trang
						Chủ</a></li>
				<li><a href="SearchHotel.jsp">Khách Sạn</a></li>
				<li><a href="SearchRestaurant.jsp">Nhà Hàng</a></li>
				<li><a href="index.jsp#contact">Liên Hệ</a></li>
				<%
					String resultlogin = (String) request.getSession().getAttribute("login");
					if (resultlogin != null) {
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
		</ul>
		</nav>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </header>
	<!-- /#masthead -->
	<!-- Page Head -->

	<section id="page-head" class="page-head text-center"
		data-stellar-background-ratio="0.1" data-stellar-vertical-offset="0">
	<div class="head-overlay">
		<div class="section-padding">
			<div class="container">
				<div class="head-overlay"></div>
				<!-- /.head-overlay -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.section-padding -->
	</div>
	<!-- /.head-overlay --> </section>
	<!-- /#page-head -->


	<form action="./Logout" style="float: right;" id="logout" name="logout">

		<button type="submit" id="btnSearch2" class="search-submit"
			style="color: #e74c3c; border: 5px, #333; background-color: #fff; width: 100px;"
			onclick="signOut();">Đăng Xuất</button>
		<!-- 
					<a href="#" onclick="signOut();">Sign out</a> -->

	</form>

	<section id="main-content" class="main-content">

	<div class="page-content container row">
		<div class="flex-grid no-responsive-future" style="height: 100%;">
			<div class="row" style="height: 80%">
				<div class="cell auto-size padding20 bg-white" id="cell-content">
					<h1 class="text-light">Thông Tin Cá Nhân</h1>
					<hr class="thin" style="background-color: #e74c3c">
					<form action="./Updateuser" method="post">
						<h4 class="widget-title" style="display: inline">Tên:</h4>
						<input type="text" value="<%=user.getFullname()%>" name="name">
						<h4 class="widget-title">Mật khẩu:</h4>
						<input type="password" value="<%=user.getPassword()%>"
							name="password">
						<h4 class="widget-title">Số Điện thoại:</h4>
						<input type="text" value="<%=user.getPhone()%>" name="phone">
						<h4 class="widget-title">Point:</h4>
						<input type="text" value="<%=user.getPoint()%>" disabled="disabled">
						<input name="point" type="hidden" value="<%=user.getPoint()%>">

						<button type="submit" id="btnSua"
							style="color: #e74c3c; border: 5px, #333; background-color: #fff;">
							Sửa</i>
						</button>
					</form>
				</div>

			</div>
			<div class="row" style="height: 100%">
				<div class="cell auto-size padding20 bg-white" id="cell-content">
					<h1 class="text-light">Danh sách phòng đã đặt</h1>
					<hr class="thin" style="background-color: #e74c3c">
					<table class="dataTable border bordered" data-role="datatable"
						data-auto-width="false">
						<thead>

							<tr>

								<td class="sortable-column">STT</td>
								<td class="sortable-column">Tên Khách Sạn</td>
								<td class="sortable-column">Địa Chỉ</td>
								<td class="sortable-column">Loại phòng</td>
								<td class="sortable-column">Số phòng</td>
								<td class="sortable-column">Ngày đặt phòng</td>
								<td class="sortable-column">Ngày trả phòng</td>
							</tr>
						</thead>
						<tbody>
							<%
								for (int i = 0; i < user.getBookings().size(); i++) {
							%>
							<tr>
								<td><%=(i + 1)%></td>
								<td><a
									href="./GetSingleInformation?partner=1&name=<%=user.getBookings().get(i).getRoom().getInformation().getName()%>"><%=user.getBookings().get(i).getRoom().getInformation().getName()%></a></td>
								<td><%=user.getBookings().get(i).getRoom().getInformation().getNumber() + " "
						+ user.getBookings().get(i).getRoom().getInformation().getStreet() + " "
						+ user.getBookings().get(i).getRoom().getInformation().getWard() + " "
						+ user.getBookings().get(i).getRoom().getInformation().getDistrict() + " "
						+ user.getBookings().get(i).getRoom().getInformation().getProvince()%></p></td>
								<td><%=user.getBookings().get(i).getRoom().getType()%></td>
								<td style="width: 50px"><%=String.valueOf(user.getBookings().get(i).getQuanlity())%></td>
								<td><%=user.getBookings().get(i).getDatein()%></td>
								<td><%=user.getBookings().get(i).getDateout()%></td>


							</tr>
							<%
								}
							%>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>

	</section>
	<!-- /#main-content -->


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
	<script>
		function signOut() {

			document.location.href = "https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:8080/Skyplus1/index.jsp#main-slider";
			console.log('User signed out.');

		}
	</script>
	<script>
		$(document).ready(function() {
			$("#logout").on
			"submit", function(e) {
				var x =
	<%=request.getSession().getAttribute("password")%>
		;
				if (x == "gg") {
					alert("vao day nha!");
					e.preventDefault(), $this = $(this), $.ajax({
						type : "POST",
						url : $this.attr("action"),
						success : function() {
						}
					});
				}
			};
		});
	</script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>


</body>
</html>