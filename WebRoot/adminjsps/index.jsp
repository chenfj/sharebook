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
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="margin: 0px;">
    <div>
    	<table>
    		<tr>
    			<td colspan="2"><iframe src='<c:url value="/adminjsps/top.jsp"></c:url>' scrolling="no" frameborder="0"width="1200px" height="150px"></iframe></td>
    		</tr>
    		<tr>
    			<td>
    				<iframe name="left" src='<c:url value="/adminjsps/left.jsp"></c:url>'  frameborder="0" scrolling="no"  width="250px" height="450px"></iframe>
    			</td>
    			<td>
    				<iframe name="main" src='<c:url value="/adminjsps/main.jsp"></c:url>' frameborder="0" scrolling="no" width="950px" height="450px"></iframe>
    			</td>
    		</tr>
    		
    	</table>
    </div>
  </body>
</html>
