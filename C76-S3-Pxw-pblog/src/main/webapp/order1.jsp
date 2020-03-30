<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>订单界面</title>
    
    <link rel="stylesheet" type="text/css" href="/dog/assets/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/dog/assets/js/easyui/themes/icon.css">
    <script type="text/javascript" src="/dog/assets/js/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/dog/assets/js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript"
	src="/dog/assets/js/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	
	function fmtImage(value, row, index) {
	
		return "<img src='"+value+"' height='40px'>";
	}
	var deleteId = '';
	$(document).on("click","tr",function(){
		deleteId = $(this).find("td:eq(0)").find("div").text();
	});
	function del() {
		var row = $("#dg").datagrid("getSelected");
		if (row == null) {
			$.messager.alert('系统提示', '请选择要编辑的商品', 'error');
			return;
		}
		if(confirm("确认要删除该商品吗?")){
			location.href='dodelorder.jsp?oid='+deleteId;
		}
			
	}
	function set() {
		if(confirm("确认发货吗?")){
			location.href='fahuo.jsp?oid='+deleteId;
		}
	}
	</script>
</head>
<body>
   
    <a class="easyui-linkbutton" onclick="set()">发货</a>
				<a href="javascript:void(0)"
				class="easyui-linkbutton" onclick="del()">退货</a>
    <table id="dg" class="easyui-datagrid" title="订单" style="width:1062px;height:500px"
            data-options="singleSelect:true,collapsible:true,url:'order.s?op=query',method:'get'">
        <thead>
            <tr>
            	<th data-options="field:'oid',width:60">订单编号</th>
                <th data-options="field:'name',width:80">姓名</th>
                <th data-options="field:'addr',width:200">地址</th>
                <th data-options="field:'tel',width:100">电话</th>
                <th data-options="field:'email',width:150">邮箱地址</th>
                <th data-options="field:'pname',width:80">商品名称</th>
                <th data-options="field:'image',width:150,formatter:fmtImage">图片</th>
                <th data-options="field:'dprice',width:60">价格</th>
                <th data-options="field:'count',width:60">数量</th>
                <th data-options="field:'subtotal',width:60">总计</th>
                <th data-options="field:'state',width:60">状态</th>
            </tr>
        </thead>
    </table>
 
</body>
</html>