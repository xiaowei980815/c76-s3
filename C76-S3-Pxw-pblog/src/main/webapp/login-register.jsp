<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
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
<link rel="stylesheet" href="assets/css/meanmenu.min.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
	<%@ include file="/common/header.jsp" %>
	<div class="breadcrumb-area pt-95 pb-95 bg-img"
		style="background-image: url(assets/img/banner/banner-2.jpg);">
		<div class="container">
			<div class="breadcrumb-content text-center">
				<h2>登录/注册</h2>
				<ul>
					<li><a href="index.jsp">家</a></li>
					<li class="active">登录/注册</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="login-register-area pt-95 pb-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 col-md-12 ml-auto mr-auto">
					<div class="login-register-wrapper">
						<div class="login-register-tab-list nav">
							<a class="active" data-toggle="tab" href="#lg1">
								<h4>登录</h4>
							</a> <a data-toggle="tab" href="#lg2">
								<h4>注册</h4>
							</a>
						</div>
						<div class="tab-content">
							<div id="lg1" class="tab-pane active">
								<div class="login-form-container">
									<div class="login-register-form">
								
										<form action="loginservlet.s" method="post">
											<input type="text" name="username" placeholder="用户名" id="username">
											<input type="password" name="password"
												placeholder="密码" id="password">
												<input name="vcode" placeholder="验证码">
	             								<img alt="" src="vcode.jsp" height="30px"  onclick="src='vcode.jsp?'+new Date()">
											<div class="button-box">
												<div class="login-toggle-btn">
													
													<a href="password.jsp">忘记密码?</a>
												</div>
												<button type="submit">
													<span>登录</span>
												</button>
											</div>
										</form>
									</div>
								</div>
							</div>
							<div id="lg2" class="tab-pane">
								<div class="login-form-container">
									<div class="login-register-form">
										<form action="registerservlet.s" method="post">
											<input type="text" name="username" placeholder="用户名">
											<input type="password" name="password"
												placeholder="密码"> <input name="email"
												placeholder="邮件" type="email">
											<div class="button-box">
												<button type="submit">
													<span>注册</span>
												</button>
											</div>
										</form>
									</div>
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
	<script src="assets/js/jquery.counterup.min.js"></script>
	<script src="assets/js/waypoints.min.js"></script>
	<script src="assets/js/elevetezoom.js"></script>
	<script src="assets/js/ajax-mail.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>
    