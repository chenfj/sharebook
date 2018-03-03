<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userinfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		#userinfo{width:600px;height:500px;margin:0 auto;}
		#userinfo h3{width: 600px;height: 45px;line-height: 45px;text-align: center;}
		#userinfo #headimg{text-align: center;}
		#userinfo #info #table1{width: 300px;height: 220px;margin-left: 191px;margin-top: 20px;} 
		input{border: 0px none;}
	</style>
  </head>
  
  <body>
    <div id="userinfo">
    	<h3>管理员信息</h3>
	    <div id="headimg">
	    	<img width="150px" height="150px" alt="" src='<c:url value='/images/head.jpg'></c:url>' align="middle">
	    	<span>美丽的心灵</span>
	    </div>
	    <div id="info">
	    	<table id="table1" border="0" bordercolor="write" cellpadding="10" cellspacing="0">
					<tr>
						<td>昵称:</td>
						<td><input type="text" name="nickName" value="阳光"/></td>
					</tr>
					<tr>
						<td>E-mail:</td>
						<td><input type="text" name="email" value="1193760156@qq.com"/></td>
					</tr>
					<tr>
						<td>地址:</td>
						<td><input type="text" name="address" value="山西"/></td>
					</tr>
					<tr>
						<td>联系方式:</td>
						<td><input type="text" name="phone" value="15534404684"/></td>
					</tr>
					<tr>
						<th colspan="2"><a href="/ShareBook/userjsps/myIndexHome.jsp"><input type="button" value="返回" /></a></th>
					</tr>
				</table>
	    </div>
    </div>
    <div></div>
  </body>
</html>
