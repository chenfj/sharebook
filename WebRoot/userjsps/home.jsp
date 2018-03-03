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
    <div>
    	<table id="home_table">
    		<tr>
    			<td colspan="2"><iframe src='<c:url value="/userjsps/top.jsp"></c:url>' scrolling="no" frameborder="0"width="1200px" height="121px"></iframe></td>
    		</tr>
    		<tr>
    			<td>
    				<iframe name="left" src='<c:url value="/userjsps/left.jsp"></c:url>'  frameborder="0" scrolling="no"  width="200px" height="650px"></iframe>
    			</td>
    			<td>
    				<iframe name="right" src='<c:url value="/userjsps/right.jsp"></c:url>'  frameborder="0" scrolling="no"  width="1000px" height="650px"></iframe>
    			</td>
    			
    		</tr>
    		
    	</table>
    </div>
  </body>
</html>
