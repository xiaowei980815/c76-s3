
<%@page import="util.DBHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String oid = request.getParameter("oid");
	String sql = "update  order_tbl set state='发货' where oid=?";
	DBHelper.update(sql, oid);
	response.sendRedirect("order.jsp");
%>