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
	<style>
		#userlist{width:1000px;height:600px;margin:0 auto;}
	</style>
  </head>
  
  <body>
    <div id="userlist">
    	<table>
    		<tr><th>用户列表</th></tr>
    		<tr><td>用户名称</td><td>昵称</td><td>email</td><td>地址</td><td>操作</td></tr>
    		<tr><td>用户名称</td><td>昵称</td><td>email</td><td>地址</td><td><a href="">删除</a></td></tr>
    	</table>
    </div>
  </body>
</html>
