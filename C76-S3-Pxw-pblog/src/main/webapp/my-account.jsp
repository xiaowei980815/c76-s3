<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
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
        <div class="breadcrumb-area pt-95 pb-95 bg-img" style="background-image:url(assets/img/banner/banner-2.jpg);">
            <div class="container">
                <div class="breadcrumb-content text-center">
                    <h2>我的帐户</h2>
                    <ul>
                        <li><a href="index.jsp">家</a></li>
                        <li class="active">我的帐户</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- my account start -->
        <div class="my-account-area pt-100 pb-70">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="checkout-wrapper">
                            <div id="faq" class="panel-group">
                            <form action="accountservlet.s">
                                <div class="panel panel-default" >
                                    <div class="panel-heading">
                                        <h5 class="panel-title"><span>1</span> <a data-toggle="collapse" data-parent="#faq" href="#my-account-1">编辑您的帐户信息 </a></h5>
                                    </div>
                                    <div id="my-account-1" class="panel-collapse collapse show">
                                        <div class="panel-body" action="accountservlet.s">
                                            <div class="billing-information-wrapper">
                                                <div class="account-info-wrapper">
                                                    <h4>我的帐户信息</h4>
                                                    <h5>你的个人细节</h5>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-6 col-md-6">
                                                        <div class="billing-info">
                                                            <label>姓名</label>
                                                            <input type="text" name="name" >
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 col-md-12">
                                                        <div class="billing-info">
                                                            <label>电子邮件地址</label>
                                                            <input type="email" name="email">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 col-md-12">
                                                        <div class="billing-info">
                                                            <label>地址</label>
                                                            <input type="text" name="addr">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6">
                                                        <div class="billing-info">
                                                            <label>电话</label>
                                                            <input type="text" name="tel">
                                                        </div>
                                                    </div>
                                                   
                                                </div>
                                                <div class="billing-back-btn">
                                                    <div class="billing-back">
                                                        <a href="index-1.jsp"><i class="ti-arrow-up" ></i>退出</a>
                                                    </div>
                                                    <div class="billing-btn">
                                                        <button type="submit" href="my-account.jsp">上传</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </form>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title"><span>2</span> <a data-toggle="collapse" data-parent="#faq" href="#my-account-2">更改密码 </a></h5>
                                    </div>
                                    <form action="passwordsevlet.s">
                                    <div id="my-account-2" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <div class="billing-information-wrapper">
                                                <div class="account-info-wrapper">
                                                    <h4>修改密码</h4>
                                                    <h5>你的密码</h5>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12">
                                                        <div class="billing-info">
                                                            <label>密码</label>
                                                            <input type="password" name="password">
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                                <div class="billing-back-btn">
                                                    <div class="billing-back">
                                                        <a href="index-2.jsp"><i class=" ti-arrow-up"></i> 退出</a>
                                                    </div>
                                                    <div class="billing-btn">
                                                        <button type="submit">继续</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </form>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title"><span>3</span> <a data-toggle="collapse" data-parent="#faq" href="#my-account-3">修改通讯簿条目   </a></h5>
                                    </div>
                                    <div id="my-account-3" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <div class="billing-information-wrapper">
                                                <div class="account-info-wrapper">
                                                    <h4>通讯簿条目</h4>
                                                </div>
                                                <div class="entries-wrapper">
                                                    <div class="row">
                                                        <div class="col-lg-6 col-md-6 d-flex align-items-center justify-content-center">
                                                            <div class="entries-info text-center">
                                                                <p>杰拉尔德·阿姆斯特朗 </p>
                                                                <p> 地址在这里。 </p>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 d-flex align-items-center justify-content-center">
                                                            <div class="entries-edit-delete text-center">
                                                                <a class="edit" href="#">编辑</a>
                                                                <a href="#">删除</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="billing-back-btn">
                                                    <div class="billing-back">
                                                        <a href="index-2.jsp"><i class="ti-arrow-up"></i> 退出</a>
                                                    </div>
                                                    <div class="billing-btn">
                                                        <button type="submit">继续</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
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