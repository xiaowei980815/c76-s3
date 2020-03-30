<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="util.DBHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="header-area">

		<div class="header-bottom transparent-bar">
			<div class="container">
				<div class="row">
					<div class="col-xl-2 col-lg-3 col-md-4 col-sm-4 col-5">
						<div class="logo pt-39">
							<a href="index.jsp"><img alt=""
								src="assets/img/logo/logo.png"></a>
						</div>
					</div>
					<div class="col-xl-8 col-lg-7 d-none d-lg-block">
						<div class="main-menu text-center">
							<nav>
								<ul>
									<li><a href="index.jsp">HOME</a>
										<ul class="submenu">
											<li><a href="index.jsp">商品主页</a></li>
											<li><a href="product.jsp">后台页面1</a></li>
											<li><a href="order1.jsp">后台页面2</a></li>
										</ul></li>
								
									<li><a href="#">页</a>
										<ul class="submenu">
											<li><a href="shop-page.jsp">商店页面</a></li>
											<li><a href="cart.jsp">购物车页面</a></li>
											<li><a href="checkout.jsp">结帐</a></li>
											<li><a href="my-account.jsp">本人账户</a></li>
										</ul></li>
									
									<li><a href="about-us.jsp">关于我们</a></li>
									<li><a href="contact.jsp">联系我们</a></li>
									<li>当前在线人数：${onlineUserSet==null? 0 : onlineUserSet.size()}个</li>
									<li>
									<%if(session.getAttribute("loginedUser")==null){%>
										<a href="login-register.jsp">登录</a>|
									<%} else { %>
										${loginedUser.name}|
									<%} %>
									</li>
									<li id="headerUsername" class="headerUsername">
									${loginedUser.username}
									</li>																
									<li>
									<a  href="Loginoutservlet.s">退出</a>
									</li>	
								</ul>
							</nav>
						</div>
					</div>
					<div class="col-xl-2 col-lg-2 col-md-8 col-sm-8 col-7">
						<div class="search-login-cart-wrapper">
						
							<div class="header-login same-style">
								<a href="login-register.jsp"><i class="icon-user icons"></i></a>
							</div>
							<div class="header-cart same-style">
								<button class="icon-cart">
									<i class="icon-handbag"></i> 
								</button>
								<div class="shopping-cart-content">
							<%	
						 Map<String,Object> user = (Map<String,Object>)session.getAttribute("loginedUser");
					
						//计算购物车总金额
						String sql="select sum(b.dprice*a.count) from cartitem_tbl a"
								+" join product_tbl b on a.pid=b.pid where uid=?";
						Object sum=DBHelper.selectValue(sql, (user==null)?null:user.get("uid"));
						
						//查询购物车商品
						sql="select b.*,a.count from cartitem_tbl a "
						+" join product_tbl b on a.pid=b.pid where uid=?";
						List<Map<String,Object>> list = DBHelper.selectList(sql,(user==null)?null: user.get("uid"));
						for(Map<String,Object> cartitem : list){
							pageContext.setAttribute("c", cartitem);
						%>
						
									<ul>
										<li class="single-shopping-cart">
											<div class="">
												<a href="#"><img alt="" src="${c.image}"  width=60></a>
											</div>
											<div class="shopping-cart-title">
												<h4>
													<a href="#">${c.pname }</a>
												</h4>
												<h6>数量:  ${c.count }</h6>
												<span>￥${c.dprice }</span>
											</div>
											<div class="shopping-cart-delete">
												<a href="dodel1.jsp?pid=${c.pid} "><i class="ti-close"></i></a>
											</div>
											
										</li>
										
										
										
										
							 <%} %>
									</ul>
									<div class="shopping-cart-total">
										
										<h4>
											总计 : <span class="shop-total">￥<%=sum%></span>
										</h4>
										
									</div>
									
									<div class="shopping-cart-btn">
										<a href="cart.jsp">查看购物车</a> <a href="checkout.jsp">结帐</a> <a href="order.jsp">订单详情</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div
						class="mobile-menu-area electro-menu d-md-block col-md-12 col-lg-12 col-12 d-lg-none d-xl-none">
						<div class="mobile-menu">
							<nav id="mobile-menu-active">
								<ul class="menu-overflow">
									<li><a href="#">HOME</a>
										<ul>
											<li><a href="index.jsp">home version 1</a></li>
											<li><a href="index-2.jsp">home version 2</a></li>
										</ul></li>
									<li><a href="#">pages</a>
										<ul>
											<li><a href="about-us.jsp">about us</a></li>
											<li><a href="shop-page.jsp">shop page</a></li>
											<li><a href="shop-list.jsp">shop list</a></li>
											<li><a href="product-details.jsp">product details</a></li>
											<li><a href="cart.jsp">cart page</a></li>
											<li><a href="checkout.jsp">checkout</a></li>
										
											<li><a href="contact.jsp">contact us</a></li>
											<li><a href="my-account.jsp">my account</a></li>
											<li><a href="login-register.jsp">login / register</a></li>
										</ul></li>
									<li><a href="#">Food</a>
										<ul>
											<li><a href="#">Dogs Food</a>
												<ul>
													<li><a href="shop-page.jsp">Grapes and Raisins</a></li>
													<li><a href="shop-page.jsp">Carrots</a></li>
													<li><a href="shop-page.jsp">Peanut Butter</a></li>
													<li><a href="shop-page.jsp">Salmon fishs</a></li>
													<li><a href="shop-page.jsp">Eggs</a></li>
												</ul></li>
											<li><a href="#">Cats Food</a>
												<ul>
													<li><a href="shop-page.jsp">Meat</a></li>
													<li><a href="shop-page.jsp">Fish</a></li>
													<li><a href="shop-page.jsp">Eggs</a></li>
													<li><a href="shop-page.jsp">Veggies</a></li>
													<li><a href="shop-page.jsp">Cheese</a></li>
												</ul></li>
											<li><a href="#">Fishs Food</a>
												<ul>
													<li><a href="shop-page.jsp">Rice</a></li>
													<li><a href="shop-page.jsp">Veggies</a></li>
													<li><a href="shop-page.jsp">Cheese</a></li>
													<li><a href="shop-page.jsp">wheat bran</a></li>
													<li><a href="shop-page.jsp">Cultivation</a></li>
												</ul></li>
										</ul></li>
									<li><a href="#">blog</a>
										<ul>
											<li><a href="blog.jsp">blog page</a></li>
											<li><a href="blog-leftsidebar.jsp">blog left
													sidebar</a></li>
											<li><a href="blog-details.jsp">blog details</a></li>
										</ul></li>
									<li><a href="contact.jsp"> Contact us </a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	