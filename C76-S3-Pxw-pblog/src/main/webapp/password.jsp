<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<div class="login-register-tab-list nav">
		<a data-toggle="tab" href="#lg2">
			<h4>找回密码</h4>
		</a>
	</div>
		<div id="lg2" class="tab-pane">
			<div class="login-form-container">
				<div class="login-register-form">
					<form action="passwordchangeservlet.s" method="post">
						<input type="text" name="username" placeholder="用户名">
						 <input name="email" placeholder="电子邮件" type="email">
						 <input name="vcode" placeholder="验证码">
	             			<img alt="" src="vcode.jsp" height="30px"  onclick="src='vcode.jsp?'+new Date()">
						
							<div class="button-box">
							</br>
							<span>
								<button>找回密码</button>
							</span>
							</div>
						</form>
					</div>
				</div>
			</div>
		<%@ include file="common/footer.jsp"%>
</body>
</html>