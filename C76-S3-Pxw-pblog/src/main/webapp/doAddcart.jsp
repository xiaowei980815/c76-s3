<%@page import="util.DBHelper"%><%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Map<String,Object> user = (Map<String,Object>)session.getAttribute("loginedUser");
	String pid = request.getParameter("pid");
	String count = request.getParameter("count");
	String sql = "update cartitem_tbl set count=count+? where uid=? and pid=?";
	// 判断是否更新到 指定用的商品
	int num = DBHelper.update(sql,count,  user.get("uid"), pid);
	
	if(num == 0 ){
		sql = "insert into cartitem_tbl values(null,?,?,?)";
		DBHelper.update(sql, user.get("uid"), pid, count);
	}
	
	response.sendRedirect("cart.jsp");
%>

    