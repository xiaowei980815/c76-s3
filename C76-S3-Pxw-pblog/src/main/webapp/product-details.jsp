<%@page import="java.util.Map"%>
<%@page import="util.DBHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.png">

<!-- all css here -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet" href="assets/css/simple-line-icons.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/jquery-ui.css">
<link rel="stylesheet" href="assets/css/meanmenu.min.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<div class="breadcrumb-area pt-95 pb-95 bg-img"
		style="background-image: url(assets/img/banner/banner-2.jpg);">
		<div class="container">
			<div class="breadcrumb-content text-center">
				<h2>产品详细信息</h2>
				<ul>
					<li><a href="index.jsp">家</a></li>
					<li class="active">产品详细信息</li>
				</ul>
			</div>
		</div>
	</div>
	<%
		String pid = request.getParameter("pid");
		sql = "select * from product_tbl where pid=?";
		Map<String, Object> product = DBHelper.selectOne(sql, pid);
		pageContext.setAttribute("p", product);
	%>
	<div class="shop-area pt-95 pb-100">

		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product-details-img">
						<img src="${p.image}" alt="" />

					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product-details-content">
						<h4>${p.pname}</h4>

						<div class="product-price">
							<span class="new">${p.dprice} </span> <span class="old">${p.price}</span>
						</div>


						<p>${p.price}</p>

						<div class="quality-wrapper mt-30 product-quantity"></div>
						<div class="product-list-action">
							<div class="product-list-action-left">
								<form action="doAddcart.jsp" method="post">
									<input type="hidden" name="pid" value="${p.pid}" /> <input
										type="hidden" name="count" value="1" />
									<div class="buy">
										<input id="addCart" class="addCart" value="加入购物车"
											type="submit">
									</div>
								</form>
							</div>

						</div>
						<div class="social-icon mt-30">
							<ul>
								<li><a href="#"><i class="icon-social-twitter"></i></a></li>
								<li><a href="#"><i class="icon-social-instagram"></i></a></li>
								<li><a href="#"><i class="icon-social-linkedin"></i></a></li>
								<li><a href="#"><i class="icon-social-skype"></i></a></li>
								<li><a href="#"><i class="icon-social-dribbble"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="description-review-area pb-100">
		<div class="container">
			<div class="description-review-wrapper gray-bg pt-40">
				<div class="description-review-topbar nav text-center">
					<a class="active" data-toggle="tab" href="#des-details1">描述</a> <a
						data-toggle="tab" href="#des-details2">更多信息</a> <a
						data-toggle="tab" href="#des-details3">评论</a>
				</div>
				<div class="tab-content description-review-bottom">
					<div id="des-details1" class="tab-pane active">
						<div class="product-description-wrapper">
							<ul>
								<li>${p.desc}</li>

							</ul>
						</div>
					</div>
					<div id="des-details2" class="tab-pane active">
						<div class="product-description-wrapper">
							<%
								sql = "select name ,pdate,message from tie where pid=?";
								List<Map<String, Object>> list2 = DBHelper.selectList(sql, pid);
								for (Map<String, Object> cartitem : list2) {
									pageContext.setAttribute("c1", cartitem);
							%>
							<ul>
								<li>姓名:${c1.name}</li>
								<li>评论时间:${c1.pdate}</li>
								<li>内容:${c1.message}</li>
							</ul>
							<br>
							<%
								}
							%>
						</div>
					</div>
					<div id="des-details3" class="tab-pane">

						<div class="ratting-form-wrapper">
							<h3>添加您的评论 :</h3>
							<div class="ratting-form">
								<form action="tieservlet.s">
									<input type="hidden" name="pid" value="${p.pid}" />
									<div class="row">
										<div class="col-md-6">
											<div class="rating-form-style mb-20">
												<input placeholder="name" name="name" type="text">
											</div>
										</div>

										<div class="col-md-12">
											<div class="rating-form-style form-submit">
												<textarea name="message" placeholder="message"></textarea>
											</div>
										</div>
										<div class="billing-btn">
											<button type="submit">发表评论</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

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
							<a class="active" href="#modal1" data-toggle="tab" role="tab">
								<img src="assets/img/quick-view/s1.jpg" alt="">
							</a> <a href="#modal2" data-toggle="tab" role="tab"> <img
								src="assets/img/quick-view/s2.jpg" alt="">
							</a> <a href="#modal3" data-toggle="tab" role="tab"> <img
								src="assets/img/quick-view/s3.jpg" alt="">
							</a>
						</div>
					</div>
					<div class="qwick-view-right">
						<div class="qwick-view-content">
							<h3>狗钙食品</h3>
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
									<label>颜色*</label> <select class="select">
										<option value="">- 请选择 -</option>
										<option value="">橙色</option>
										<option value="">粉红色</option>
										<option value="">黄色</option>
									</select>
								</div>
							</div>
							<div class="quickview-plus-minus">
								<div class="cart-plus-minus">
									<input type="text" value="2" name="count"
										class="cart-plus-minus-box">
								</div>
								<div class="quickview-btn-cart">
									<a class="btn-style" href="#">加入购物车</a>
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
	<%@ include file="common/footer.jsp"%>


	<!-- all js here -->
	<script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
	<script src="assets/js/popper.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/elevetezoom.js"></script>
	<script src="assets/js/jquery.counterup.min.js"></script>
	<script src="assets/js/waypoints.min.js"></script>
	<script src="assets/js/ajax-mail.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>