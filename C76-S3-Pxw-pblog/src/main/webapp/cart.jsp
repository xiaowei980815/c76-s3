<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="util.DBHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Marten - 账单</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
                    <h2>购物车</h2>
                    <ul>
                        <li><a href="index.jsp">主页</a></li>
                        <li class="active">购物车页面</li>
                    </ul>
                </div>
            </div>
        </div>

         <!-- shopping-cart-area start -->
        <div class="cart-main-area pt-95 pb-100">
            <div class="container">
                <h3 class="page-title">您的购物车</h3>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                        <form action="#">
                            <div class="table-content table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>图片</th>
                                            <th>产品名称</th>
                                            <th>产品价格</th>
                                            <th>数量</th>
                                            <th>小计</th>
                                            <th>删除</th>
                                        </tr>
                                    </thead>
                         <tbody>
                        <%
					 
						
						//计算购物车总金额
						 sql="select sum(b.dprice*a.count) from cartitem_tbl a"
								+" join product_tbl b on a.pid=b.pid where uid=?";
						 sum=DBHelper.selectValue(sql, user.get("uid"));
						//查询购物车商品
						sql="select b.*,a.count from cartitem_tbl a "
						+" join product_tbl b on a.pid=b.pid where uid=?";
						List<Map<String,Object>> list1 = DBHelper.selectList(sql, user.get("uid"));
						for(Map<String,Object> cartitem : list1){
							pageContext.setAttribute("c", cartitem);
						%>
                                        <tr>
                                            <td class="product-thumbnail">
                                                <a href="#"><img src="${c.image}" alt=""></a>
                                            </td>
                                            <td class="product-name"><a href="#">${c.pname }</a></td>
                                            <td class="product-price-cart"><span class="amount">￥${c.dprice }</span></td>
                                            <td class="product-quantity">
                                               ${c.count }
                                            </td>
                                            <td class="product-subtotal">${c.dprice * c.count}</td>
                                            <td class="product-remove">
                                            <a href="dodel.jsp?pid=${c.pid} "><i class="ti-trash" ></i></a></td>
                                        </tr>
                                        <%} %>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="cart-shiping-update-wrapper">
                                        <div class="cart-shiping-update">
                                            <a href="shop-page.jsp">继续购物</a>
                                           
                                        </div>
                                        <div class="cart-clear">
                                            <a href="dodelall.jsp">清空购物车</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                     
                                <div class="grand-totall">
                                    
                                  
                                    <a href="checkout.jsp">继续结帐</a>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
          
	<%@ include file="/common/footer.jsp" %>

		
		
		
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
