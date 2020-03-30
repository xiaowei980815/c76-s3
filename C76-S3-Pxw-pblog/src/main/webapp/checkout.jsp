<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="util.DBHelper"%><%@page import="java.util.Map"%>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Marten - 结账界面</title>
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
	<%@ include file="/common/header.jsp"%>
	<div class="breadcrumb-area pt-95 pb-95 bg-img"
		style="background-image: url(assets/img/banner/banner-2.jpg);">
		<div class="container">
			<div class="breadcrumb-content text-center">
				<h2>结账</h2>
				<ul>
					<li><a href="index.jsp">主页</a></li>
					<li class="active">结账</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- shopping-cart-area start -->
	<div class="checkout-area pt-95 pb-70">
		<div class="container">
			<h3 class="page-title">结账</h3>
			<div class="row">
				<div class="col-lg-9">
					<div class="checkout-wrapper">
						<div id="faq" class="panel-group">

							<div class="panel panel-default">
								<div class="panel-heading">
									<h5 class="panel-title">
										<span>1</span> <a data-toggle="collapse" data-parent="#faq"
											href="#payment-1">帐单信息</a>
									</h5>
								</div>
								<div id="payment-1" class="panel-collapse collapse">
									<div class="panel-body">
										<div class="billing-information-wrapper">
											<div class="row">
												<%
													sql = "select *from myaccount where uid=?";
													List<Map<String, Object>> list0 = DBHelper.selectList(sql,
															user.get("uid"));
													for (Map<String, Object> cartitem : list0) {
														pageContext.setAttribute("c", cartitem);
												%>
												<div class="col-lg-6 col-md-6">
													<div class="billing-info">
														<label>姓名</label> <input type="text" name="order.name"
															value="${c.name}">
													</div>
												</div>
												<div class="col-lg-6 col-md-6">
													<div class="billing-info">
														<label>电子邮件地址</label> <input type="email"
															name="order.eamil" value="${c.email}">
													</div>
												</div>
												<div class="col-lg-12 col-md-12">
													<div class="billing-info">
														<label>地址</label> <input type="text" name="order.addr"
															value="${c.addr} ">
													</div>
												</div>
												<div class="col-lg-6 col-md-6">
													<div class="billing-info">
														<label>电话</label> <input type="text" name="order.tel"
															value="${c.tel} ">
													</div>
												</div>
												<%
													}
												%>
											</div>


										</div>
									</div>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h5 class="panel-title">
										<span>2</span> <a data-toggle="collapse" data-parent="#faq"
											href="#payment-3">运费</a>
									</h5>
								</div>
								<div id="payment-3" class="panel-collapse collapse ">
									<div class="panel-body">
										<div class="shipping-method-wrapper">
											<div class="shipping-method">
												<p>固定利率10%</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h5 class="panel-title">
										<span>3</span> <a data-toggle="collapse" data-parent="#faq"
											href="#payment-5">订单评审</a>
									</h5>
								</div>
								<div id="payment-5" class="panel-collapse collapse">
									<div class="panel-body">
										<div class="order-review-wrapper">
											<div class="order-review">
												<div class="table-responsive">
													<table class="table">
														<thead>
															<tr>
																<th class="width-1">品名</th>
																<th class="width-2">价格</th>
																<th class="width-3">数量</th>
																<th class="width-4">总计</th>
															</tr>
														</thead>
														<%
															//计算购物车总金额
															sql = "select sum(b.dprice*a.count) from cartitem_tbl a"
																	+ " join product_tbl b on a.pid=b.pid where uid=?";
														sum= DBHelper.selectValue(sql, user.get("uid"))==null?0:sum;
														int sum1=Integer.parseInt(String.valueOf(sum));
														
															//查询购物车商品
															sql = "select b.*,a.count from cartitem_tbl a "
																	+ " join product_tbl b on a.pid=b.pid where uid=?";
															List<Map<String, Object>> list1 = DBHelper.selectList(sql,
																	user.get("uid"));
															for (Map<String, Object> cartitem : list1) {
																pageContext.setAttribute("c", cartitem);
														%>
														<tbody>
															<tr>
																<td>
																	<div class="o-pro-dec">
																		<p>${c.pname }</p>
																	</div>
																</td>
																<td>
																	<div class="o-pro-price">
																		<p>${c.dprice }</p>
																	</div>
																</td>
																<td>
																	<div class="o-pro-qty">
																		<p>${c.count }</p>
																	</div>
																</td>
																<td>
																	<div class="o-pro-subtotal">
																		<p>￥${c.dprice * c.count}</p>
																	</div>
																</td>
															</tr>
															<%
																}
															%>

														</tbody>
														<tfoot>
															<tr>
																<td colspan="3">小计</td>
																<td colspan="1">￥<%=sum1%>
																</td>
															</tr>
															<tr class="tr-f">
																<td colspan="3">运输和装卸(固定费率)</td>
																<td colspan="1">￥<%=sum1*0.1%></td>
															</tr>
															<tr>
																<td colspan="3">总计</td>
																<td colspan="1">￥<%=sum1*1.1%></td>
															</tr>

														</tfoot>
													</table>
												</div>
												<div class="billing-back-btn">
													<span> 忘了一件东西？ <a href="cart.jsp"> 编辑购物车。</a>

													</span>
													<div class="billing-btn">
														<a href="doAddOrder.jsp">结账</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="checkout-progress">
						<h4>签出进度</h4>
						<ul>
							<li>帐单地址</li>
							<li>送货地址</li>
							<li>装运方法</li>
							<li>付款方式</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/common/footer.jsp"%>
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
