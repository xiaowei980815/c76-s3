<%@page import="java.util.List"%>
<%@page import="util.DBHelper"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Marten - Pet Food eCommerce Bootstrap4 Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.png">

<!-- all css here -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet" href="assets/css/simple-line-icons.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/slick.css">
<link rel="stylesheet" href="assets/css/meanmenu.min.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<div class="slider-area">
		<div class="slider-active owl-dot-style owl-carousel">
			<div class="single-slider pt-100 pb-100 yellow-bg">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-12 col-sm-7">
							<div class="slider-content slider-animated-1 pt-114">
								<h3 class="animated">We keep pets for pleasure.</h3>
								<h1 class="animated">
									Food & Vitamins <br>For all Pets
								</h1>
								<div class="slider-btn">
									<a class="animated" href="product-details.jsp">SHOP NOW</a>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-12 col-sm-5">
							<div class="slider-single-img slider-animated-1">
								<img class="animated"
									src="assets/img/slider/slider-single-img.png" alt="">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="single-slider pt-100 pb-100 yellow-bg">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-7 col-12">
							<div class="slider-content slider-animated-1 pt-114">
								<h3 class="animated">We keep pets for pleasure.</h3>
								<h1 class="animated">
									Food & Vitamins <br>For all Pets
								</h1>
								<div class="slider-btn">
									<a class="animated" href="product-details.jsp">SHOP NOW</a>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-5 col-12">
							<div class="slider-single-img slider-animated-1">
								<img class="animated"
									src="assets/img/slider/slider-single-img-2.png" alt="">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="food-category food-category-col pt-100 pb-60">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-4">
					<div class="single-food-category-2 text-center mb-30">
						<div class="single-food-hover">
							<img src="assets/img/product/food-catigory-1.png" alt="">
						</div>
						<h3>狗粮</h3>
					</div>
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="single-food-category-2 text-center mb-30">
						<div class="single-food-hover">
							<img src="assets/img/product/food-catigory-2.png" alt="">
						</div>
						<h3>猫粮</h3>
					</div>
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="single-food-category-2 text-center mb-30">
						<div class="single-food-hover">
							<img src="assets/img/product/food-catigory-3.png" alt="">
						</div>
						<h3>鱼食</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="product-area pt-95 pb-70 gray-bg">
		<div class="container">
			<div class="section-title text-center mb-55">
				<h4>人气最高的</h4>
				<h2>近期产品</h2>
			</div>
			<div class="row">
				<%
					sql = "select * from product_tbl where hot=1";
					List<Map<String, Object>> list1 = DBHelper.selectList(sql);
					for (Map<String, Object> cartitem : list1) {
						pageContext.setAttribute("c", cartitem);
				%>
				<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
					<div class="product-wrapper mb-10">

						<div class="product-img">
							<a href="product-details.jsp?pid=${c.pid}"> <img
								src="${c.image}" alt="">
							</a>
						</div>

						<div class="product-content">
							<h4>
								<a href="product-details.jsp?pid=${c.pid}">${c.pname }</a>
							</h4>
							<div class="product-price">
								<span class="new">￥${c.dprice }</span> <span class="old">￥${c.price}</span>
							</div>
						</div>

					</div>

				</div>

				<%
					}
				%>
			</div>
		</div>
	</div>





	<%@ include file="common/footer.jsp"%>
	<!-- modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span class="ti-close" aria-hidden="true"></span>
		</button>
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<div class="qwick-view-left">
						<div class="quick-view-learg-img">
							<div class="quick-view-tab-content tab-content">
								<div class="tab-pane active show fade" id="modal1"
									role="tabpanel">
									<img src="assets/img/quick-view/l1.jpg" alt="">
								</div>
								<div class="tab-pane fade" id="modal2" role="tabpanel">
									<img src="assets/img/quick-view/l2.jpg" alt="">
								</div>
								<div class="tab-pane fade" id="modal3" role="tabpanel">
									<img src="assets/img/quick-view/l3.jpg" alt="">
								</div>
							</div>
						</div>
						<div class="quick-view-list nav" role="tablist">
							<a class="active" href="#modal1" data-toggle="tab"> <img
								src="assets/img/quick-view/s1.jpg" alt="">
							</a> <a href="#modal2" data-toggle="tab" role="tab"> <img
								src="assets/img/quick-view/s2.jpg" alt="">
							</a> <a href="#modal3" data-toggle="tab" role="tab"> <img
								src="assets/img/quick-view/s3.jpg" alt="">
							</a>
						</div>
					</div>
					<div class="qwick-view-right">
						<div class="qwick-view-content">
							<h3>Dog Calcium Food</h3>
							<div class="product-price">
								<span>$19.00 </span>
							</div>
							<div class="product-rating">
								<i class="ion-star theme-color"></i> <i
									class="ion-star theme-color"></i> <i
									class="ion-star theme-color"></i> <i
									class="ion-star theme-color"></i> <i
									class="ion-star theme-color"></i>
							</div>
							<p>Lorem ipsum dolor sit amet, consectetur adip elit, sed do
								amt tempor incididun ut labore et dolore magna aliqua. Ut enim
								ad mi , quis nostrud veniam exercitation .</p>
							<div class="quick-view-select">
								<div class="select-option-part">
									<label>Size*</label> <select class="select">
										<option value="">- Please Select -</option>
										<option value="">XS</option>
										<option value="">S</option>
										<option value="">M</option>
										<option value="">L</option>
										<option value="">XL</option>
										<option value="">XXL</option>
									</select>
								</div>
								<div class="select-option-part">
									<label>Color*</label> <select class="select">
										<option value="">- Please Select -</option>
										<option value="">orange</option>
										<option value="">pink</option>
										<option value="">yellow</option>
									</select>
								</div>
							</div>
							<div class="quickview-plus-minus">
								<div class="cart-plus-minus">
									<input type="text" value="2" name="qtybutton"
										class="cart-plus-minus-box">
								</div>
								<div class="quickview-btn-cart">
									<a class="btn-style" href="#">add to cart</a>
								</div>
								<div class="quickview-btn-wishlist">
									<a class="btn-hover" href="#"><i class="ti-heart"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- all js here -->
	<script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
	<script src="assets/js/popper.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.counterup.min.js"></script>
	<script src="assets/js/waypoints.min.js"></script>
	<script src="assets/js/elevetezoom.js"></script>
	<script src="assets/js/ajax-mail.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>
