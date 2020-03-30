<%@page import="javax.swing.JOptionPane"%>
<%@page import="util.DBHelper"%><%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	

	Map<String,Object> user = (Map<String,Object>)session.getAttribute("loginedUser");
	Integer uid = (Integer)user.get("uid");
	String sql="select *from myaccount where uid=?";
	List<Map<String,Object>> list = DBHelper.selectList(sql, uid);
	for(Map<String,Object> cartitem : list){
	sql = "insert into order_tbl values(null,?,?,?,?,?,default)";
	DBHelper.update(sql, cartitem.get("name"),cartitem.get("addr"),cartitem.get("tel"),cartitem.get("email"),uid);
	}
	// 获取刚才添加的订单编号
	String oid = "" + DBHelper.selectValue("select max(oid) from order_tbl");
	
	sql = "select a.*,b.dprice from cartitem_tbl a join product_tbl b on a.pid=b.pid where uid=?";
	
	List<Map<String,Object>> list1 = DBHelper.selectList(sql, uid);
	
	// 写入订单明细
	for(Map<String,Object> cartitem : list1){
		sql = "insert into orderitem_tbl values (null,? * ?,?,?,?)";
		DBHelper.update(sql, cartitem.get("count"),
				cartitem.get("dprice"),
				cartitem.get("count"),
				cartitem.get("pid"),
				oid
		
				);
	}
	
	response.sendRedirect("dodelall.jsp");
%>