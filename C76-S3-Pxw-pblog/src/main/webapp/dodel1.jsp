<%@page import="util.DBHelper"%><%@ page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pid = request.getParameter("pid");
	String sql = "delete from cartitem_tbl where pid=?";
	DBHelper.update(sql, pid);
	response.sendRedirect("index.jsp");
%>