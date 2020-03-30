
<%@page import="util.DBHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String oid=request.getParameter("oid");
String sql="delete from order_tbl where oid=?";
DBHelper.update(sql, oid);
response.sendRedirect("order.jsp");

%>