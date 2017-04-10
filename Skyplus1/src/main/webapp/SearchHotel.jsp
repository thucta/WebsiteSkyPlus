<%@page import="entity.InforRating"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import=" entity.City"%>
<%@ page import=" entity.Information"%>
<%@page import="skyplus.config.Config"%>
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
<body style="font-family: sans-serif;">
	<%
		List<InforRating> information = (List<InforRating>) request.getAttribute("search");
		if (information == null) {
			information = (List<InforRating>) request.getAttribute("TopHotel");
			if (information == null) {
				request.getRequestDispatcher("./GetTopHotels").forward(request, response);
				return;
			}

			else {
				String temp = (String) request.getAttribute("Message");
				if (temp != null) {
	%>
	<script type="text/javascript">
		alert("Không tồn tại khách sạn với điều kiện đã tìm.Hãy tham khảo một số khách sạn sau");
	</script>
	<%
		}
			}
		}
	%>


	<!-- Header Section -->
	<script>
		$(document).ready(function() {
			$('#city').change(function() {
				giatri = this.value;
				$('#district').load('./GetDistrictforCity?id_tinh=' + giatri);
			});
		});
	</script>
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
		<%-- <img src="<%=Config.URLFORIMG + information.get(0).getInFor().getImages().get(0)%>"  style="width: 100% ;height:500px"> --%>
		<!-- <div class="section-padding">
			<div class="container">
				<div class="head-overlay">
					
				</div>
				/.head-overlay
			</div>
			/.container
		</div> -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel"
			style="width: 100%; height: 500px;">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>

			<div class="carousel-inner" role="listbox"
				style="width: 100%; height: 100%;">
				<%
					for (int i = 0; i < information.size(); i++) {
						if (i == 0) {
				%>
				<div class="item active">
					<%
						} else {
					%>
					<div class="item">
						<%
							}
						%>
						<img
							src="<%=Config.URLFORIMG + information.get(i).getInFor().getImages().get(0)%>"
							alt="Chania" style="width: 100%; height: 100%;">

					</div>


					<%
						}
					%>
				</div>
				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>




			<!-- /.section-padding -->
		</div>
		<!-- /.head-overlay -->
	</section>
	<!-- /#page-head -->
	<!-- Page Head -->


	<!-- Main Content Section -->

	<section id="main-content" class="main-content text-center">
	<div class="container">
		<div class="row">
			<div class="col-md-9">
				<div class="section-padding">
					<div class="row">
						<%
							if (information == null) {
						%>
						<div>không tìm thấy nhà hàng thỏa yêu cầu</div>
						<%
							} else {
						%>
						<div class="col-md-6">
							<div class=" pull-left">
								<div class="tile-group no-margin no-padding stream-list"
									style="width: 100%;">
									<div class="widget-details">
										<%
											for (int i = 0; i < information.size(); i = i + 2) {
										%>
										<a
											href="<%="./GetSingleInformation?partner=1&name=" + information.get(i).getInFor().getId()%>">
											<div class="tile-wide ol-transparent" data-role="tile">
												<img class="imgforsearch"
													src="<%=Config.URLFORIMG + information.get(i).getInFor().getImages().get(0)%>"
													alt="Item Image">
												<h3 class="section-title" style="padding: 0;">
													<span style="text-align: right;"><%=information.get(i).getInFor().getName()%></span>
												</h3>
												<p>
													<%=information.get(i).getInFor().getNumber() + ","
							+ information.get(i).getInFor().getStreet() + " " + information.get(i).getInFor().getWard()
							+ " " + information.get(i).getInFor().getDistrict() + " "
							+ information.get(i).getInFor().getProvince()%></p>

												<p>
													Giá:
													<%=information.get(i).getPrice() + ""%></p>

											</div>
										</a>
										<%
											}
										%>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">

							<div class=" pull-right">
								<div class="tile-group no-margin no-padding stream-list"
									style="width: 100%;">
									<div class="widget-details">
										<%
											for (int i = 1; i < information.size(); i = i + 2) {
										%>
										<a
											href="<%="./GetSingleInformation?partner=1&name=" + information.get(i).getInFor().getId()%> ">
											<div class="tile-wide ol-transparent" data-role="tile">
												<img class="imgforsearch"
													src="<%=Config.URLFORIMG + information.get(i).getInFor().getImages().get(0)%>"
													alt="Item Image">
												<h3 class="section-title">
													<span><%=information.get(i).getInFor().getName()%></span>
												</h3>
												<p>
													<%=information.get(i).getInFor().getNumber() + ","
							+ information.get(i).getInFor().getStreet() + " " + information.get(i).getInFor().getWard()
							+ " " + information.get(i).getInFor().getDistrict() + " "
							+ information.get(i).getInFor().getProvince()%></p>

												<p>
													Giá:
													<%=information.get(i).getPrice() + ""%></p>


											</div>
										</a>
										<%
											}
										%>

									</div>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
				</div>




				<!-- <nav class="window-location text-center">
				<ul>
					<li class="prev-post"><a href="#"><i
							class="flaticon-arrow395"></i></a></li>
					<li class="post-close"><a href="#"><i
							class="flaticon-login12"></i></a></li>
					<li class="next-post"><a href="#"><i
							class="flaticon-pointer45"></i></a></li>
				</ul>
				</nav> -->
			</div>

			<div class="col-md-3">
				<aside id="sidebar" class="sidebar">
				<div class="widget widget_search">
					<h4 class="widget-title">Tìm kiếm</h4>
					<!-- /.widget-title -->
					<div class="widget-details">
						<form action="./Search" class="search-form" method="get">
							<input type="hidden" id="partner" name="partner" value="1">
							<input type="text" id="search" name="search" class="search"
								placeholder="Tìm Kiếm Tên Khách Sạn...." required>
							<button type="submit" id="search-submit" class="search-submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
					</div>
					<!-- /.widget-details -->
				</div>
				<!-- /.widget -->

				<hr class="thin" style="background-color: #e74c3c">
				<form action="./Filter">

					<input type="hidden" id="partner" name="partner" value="1">
					<div class="widget widget_categories">
						<h4 class="widget-title">Thành Phố</h4>
						<!-- /.widget-title -->
						<div class="widget-details">
							<div class="categories-list">
								<select id="city" name="city" class="form-control">
									<option value="">Chọn tỉnh</option>
									<%
										List<City> cities = (List<City>) request.getAttribute("cities");
										if (cities == null) {
											request.getRequestDispatcher("/GetTopHotels").forward(request, response);
											return;
										} else {
											for (int i = 0; i < cities.size(); i++) {
									%>
									<option value="<%=cities.get(i).getID()%>">
										<%=cities.get(i).getTitle()%></option>
									<%
										}
										}
									%>
								</select>
							</div>
							<!-- /.categories-list -->
						</div>
						<!-- /.widget-details -->
					</div>
					<!-- /.widget -->


					<div class="widget widget_instagram_photos">
						<h4 class="widget-title">Quận/Huyện</h4>
						<!-- /.widget-title -->
						<div class="widget-details">
							<span id="district"> <select class="form-control"
								name="districtselction">
									<option value="">Chọn huyện</option>
							</select>
							</span>
						</div>
						<!-- /.widget-details -->
					</div>
					<!-- /.widget -->
					<button type="submit" id="btnSearch2"
						style="color: #e74c3c; border: 5px, #333; background-color: #fff">
						Tìm Kiếm <i class="fa fa-search"></i>
					</button>
				</form>

				<hr class="thin" style="background-color: #e74c3c">
				<form action="./SearchType">
					<input type="hidden" id="partner" name="partner" value="1">
					<div class="widget widget_categories">
						<h4 class="widget-title">Lọc theo Hạng</h4>
						<!-- /.widget-title -->
						<div class="widget-details">
							<div class="categories-list">
								<select id="rating" name="rating" class="form-control">
									<option value="">Chọn rating</option>
									<option value="1">Khách sạn 1 sao</option>
									<option value="2">Khách sạn 2 sao</option>
									<option value="3">Khách sạn 3 sao</option>
									<option value="4">Khách sạn 4 sao</option>
									<option value="5">Khách sạn 5 sao</option>
								</select>
							</div>
							<!-- /.categories-list -->
						</div>
						<!-- /.widget-details -->
					</div>
					<!-- /.widget -->
					<button type="submit" id="btnSearch2"
						style="color: #e74c3c; border: 5px, #333; background-color: #fff">
						Tìm Kiếm <i class="fa fa-search"></i>
					</button>
				</form>

				<hr class="thin" style="background-color: #e74c3c">
				<form action="./SearchMoney">
					<input type="hidden" id="partner" name="partner" value="1">
					<div class="widget widget_categories">
						<h4 class="widget-title">Lọc theo Giá</h4>
						<!-- /.widget-title -->
						<div class="widget-details">
							<div class="categories-list">
								<select id="rating" name="money" class="form-control">
									<option value="0">Chọn Giá</option>
									<option value="1">Dưới 500.000</option>
									<option value="2">Từ 500.000 đến 1.000.000</option>
									<option value="3">Từ 1.000.000 đến 1.500.000</option>
									<option value="4">Từ 1.500.000 đến 2.000.000</option>
									<option value="5">Trên 2.000.000</option>
								</select>
							</div>
							<!-- /.categories-list -->
						</div>
						<!-- /.widget-details -->
					</div>
					<!-- /.widget -->
					<button type="submit" id="btnSearch2"
						style="color: #e74c3c; border: 5px, #333; background-color: #fff">
						Tìm Kiếm <i class="fa fa-search"></i>
					</button>
				</form>
				</aside>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container --> </section>
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


	<!-- Include jQuery Js -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- Include jQuery Js -->
	<script>
		window.jQuery
				|| document
						.write('<script src="assets/js/jquery-1.11.2.min.js"><\/script>')
	</script>
	<!-- Include Plugins Js </-->
	<script src="assets/js/custom.min.js"></script>
	<!-- Include WOW Min Js -->
	<script src="assets/js/wow.min.js"></script>
	<!-- Include Waypoint Js -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>

</body>
</html>
