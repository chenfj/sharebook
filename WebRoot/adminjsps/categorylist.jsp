<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userlist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <div id="">
    <table>
    	<tr><td colspan="3">分类列表</td></tr>
    	<tr><td colspan="3">添加分类</td></tr>
    	<tr><td>序号</td><td>类别名称</td><td>操作</td></tr>
    	<tr><td>1</td><td>经济管理</td><td><a href="#">修改</a>|<a href="#">删除</a></td></tr>
    </table>
  
  </div>
  </body>
</html>
