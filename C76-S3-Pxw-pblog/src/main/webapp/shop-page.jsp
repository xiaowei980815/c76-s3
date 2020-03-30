<%@page import="java.util.*"%>
<%@page import="util.DBHelper"%><%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商店页面</title>

      
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
	<%@ include file="/common/gg.jsp"%>
	<div class="breadcrumb-area pt-95 pb-95 bg-img"
		style="background-image: url(assets/img/banner/banner-2.jpg);">
		<div class="container">
			<div class="breadcrumb-content text-center">
				<h2>商店页面</h2>
				<ul>
					<li><a href="index.jsp">家</a></li>
					<li class="active">商品页面</li>
				</ul>
			</div>
		</div>
	</div>
	 

	<div class="shop-area pt-100 pb-100 gray-bg">
	
		<div class="container">
			<div class="row flex-row-reverse">
			
				<div class="col-lg-9">
				
					<div class="shop-topbar-wrapper">

						<div class="grid-list-options">
							<ul class="view-mode">
								<li class="active"><a href="#product-grid"
									data-view="product-grid"><i class="ti-layout-grid4-alt"></i></a></li>
								<li><a href="#product-list" data-view="product-list"><i
										class="ti-align-justify"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="grid-list-product-wrapper">
						<div class="product-view product-grid">
						
							<div class="row">
							<%
						
						String cid = request.getParameter("cid");
						String csid = request.getParameter("csid");
						
							 sql = "select a.* from product_tbl a join categorysecond_tbl b " 
										+ " on a.csid = b.csid"
										+ " where 1=1";
							// 第几页
							String pageParam = request.getParameter("page");
							int iPage = pageParam == null ? 1 : Integer.parseInt(pageParam);
							// 每页行数
							int rows = 3;
							DBHelper.Page pPage = null;
							
							if(csid!=null){
								sql += " and b.csid=?";
							
								pPage = DBHelper.selectPageForMysql(sql,iPage,rows,csid);
							} else {
								
								pPage = DBHelper.selectPageForMysql(sql,iPage,rows, null);
							}
							
							
							for(Map<String,Object> p : pPage.getData()){
							%>
								<div class="product-width col-lg-6 col-xl-4 col-md-6 col-sm-6">
									<div class="product-wrapper mb-10">
						
										<div class="product-img">
											<a href="product-details.jsp?pid=<%=p.get("pid")%>"> <img
												src="<%=p.get("image") %>" width="180" height="180"  style="display: inline-block;">
											</a>
											
										</div>
										
										<div class="product-content">
											<h4>
												<a href="product-details.jsp?pid=<%=p.get("pid")%>"><%=p.get("pname") %></a>
											</h4>
											<div class="product-price">
												<span class="new">$<%=p.get("dprice") %> </span> <span class="old">$<%=p.get("price") %></span>
											</div>
										</div>
										
										<div class="product-list-content">
											<h4>
												<a href="product-details.jsp?pid=<%=p.get("pid")%>"><%=p.get("pname") %></a>
											</h4>
											<div class="product-price">
												<span class="new">$<%=p.get("dprice") %> </span> <span class="old">$<%=p.get("price") %></span>
											</div>
											<p><%=p.get("desc") %></p>
											<div class="product-list-action">
												<div class="product-list-action-left">
													 <form action="doAddcart.jsp" method="post">
														<input type="hidden" name="pid" value="<%=p.get("pid")%>" />
														<input type="hidden" name="count" value="1" />
												<div class="buy">
														<input id="addCart" class="addCart" value="加入购物车" type="submit">
												</div>
													</form>
												</div>
												
											</div>
										</div>
									

									
								
									</div>
									
								</div>
								<%}%>
							</div>

							<div class="pagination-style text-center mt-10">
								<ul>
								<% String condition = csid != null ? "csid=" + csid : ("cid=" + cid);%>
									<li><a href="shop-page.jsp?<%=condition %>&page=<%=pPage.getPreviousPage()%>"><i class="icon-arrow-left"></i></a></li>
									<%for(int i=1; i<=pPage.getLastPage() ; i++){ %>
					
									<%if(pPage.getPage()==i){ %>
									<li><a><%=i%></a></li>
									<%} else { %>
									<li><a href="shop-page.jsp?<%=condition %>&page=<%=i%>"><%=i%></a></li>
									<%} %>
							<%} %>
									<li><a href="shop-page.jsp?<%=condition %>&page=<%=pPage.getNextPage()%>"><i class="icon-arrow-right"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
		<div class="col-lg-3">
					<div class="shop-sidebar">
						<%
						String cSql = "select * from category_tbl";
						List<Map<String,Object>> clist = DBHelper.selectList(cSql);
						pageContext.setAttribute("clist", clist);
						%>
						
						<%
						String csSql = "select * from categorysecond_tbl";
						List<Map<String,Object>> cslist = DBHelper.selectList(csSql);
						List<Map<String,Object>> clist1 = (List<Map<String,Object>>)pageContext.getAttribute("clist");

						for(Map<String,Object> c : clist1) {
						%>
						<div class="shop-widget mt-50">
							<h4  style="font-size:30px  " class="shop-sidebar-title"><%=c.get("cname") %></h4><br>
							<%for(Map<String,Object> cs : cslist){%>
							<%if(cs.get("cid").equals(c.get("cid"))){%>
							<ul>
								<li  style="font-size:20px"><a href="shop-page.jsp?csid=<%=cs.get("csid")%>"><%=cs.get("csname") %></a></br>
							</ul>

							<%} %>
							<%} %>
						</div>
						   	<%}%>

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
									<label>Color*</label> <select class="select">
										<option value="">- 请选择 -</option>
										<option value="">橙色</option>
										<option value="">粉红色</option>
										<option value="">黄色</option>
									</select>
								</div>
							</div>
							<div class="quickview-plus-minus">
								<div class="cart-plus-minus">
									<input type="text" value="2" name="qtybutton"
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
	<script src="assets/js/jquery.counterup.min.js"></script>
	<script src="assets/js/waypoints.min.js"></script>
	<script src="assets/js/elevetezoom.js"></script>
	<script src="assets/js/ajax-mail.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>