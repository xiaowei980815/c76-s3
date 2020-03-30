<%@page import="util.DBHelper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
							<h4 class="shop-sidebar-title"><%=c.get("cname") %></h4>
							<%for(Map<String,Object> cs : cslist){%>
							<%if(cs.get("cid").equals(c.get("cid"))){%>
							<ul>
								<li><a href="shop-page.jsp?csid=<%=cs.get("csid")%>"><%=cs.get("csname") %></a></li>
							</ul>
							<%} %>
							<%} %>
						</div>
						   	<%} %>

					</div>
				</div>