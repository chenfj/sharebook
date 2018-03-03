<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'active.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		#content{margin:0 auto;width:1000px;}
		#content #main{maring:0 auto;width:1000px;height:400px;}
		#content #main img{width: 148px;height: 148px;margin-top: 115px;margin-left: 300px;}
		#content #main a{color: #cd1d23;font-size: 25px;text-decoration: none;font-family: "宋体";font-weight: 800;}
	</style>
  </head>
  
  <body>
    <div id="content">
    	<div id="main">
    		<c:choose>
    		<c:when test="${activeError==2 }">
    		<img alt="" src="/ShareBook/images/cuohao.png"> 对不起，激活失败：激活码错误!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>返回</span><a href="/ShareBook/index.jsp">首页</a>
    		</c:when>
    		<c:otherwise>
    		<img alt="" src="/ShareBook/images/success.jpg">激活成功:去<a href="/ShareBook/userjsps/login.jsp">登录</a>吧! &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;返回<a href="/ShareBook/index.jsp">首页</a>
    		</c:otherwise>
    		</c:choose>
    	</div>
    </div>
  </body>
</html>
