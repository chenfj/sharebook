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
    
    <title>My JSP 'home.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
		#home_table{width: 1200px; margin: 0px auto;}
	</style>
	
  </head>
  
  <body style="margin: 0px;">
    	
    	<jsp:include page="top.jsp"></jsp:include>
    	<div id="mainContent" style="width:1024px;height:550px;margin:0 auto;">
    	<jsp:include page="left.jsp"></jsp:include>
    	<jsp:include page="indexRight.jsp"></jsp:include>
   		</div>
    	<jsp:include page="buttom.jsp"></jsp:include>
  </body>
</html>
