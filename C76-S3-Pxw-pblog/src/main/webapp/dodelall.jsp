<%@page import="util.DBHelper"%>
pageEncoding="UTF-8"%>
<%String sql = "delete from cartitem_tbl";
			DBHelper.update(sql);
			response.sendRedirect("cart.jsp");%>