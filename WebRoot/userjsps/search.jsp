<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'search.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		#search{width: 521px;height: 500px;margin-left: 182px;background-color: #ECE;padding-top: 40px;padding-left: 281px;position: relative;}
	</style>
  </head>
  

  <body style="margin: 0px;">
   
    	<jsp:include page="top.jsp"></jsp:include>
    	<div id="mainContent" style="width:1024px;height:550px;margin:0 auto;">
    	<jsp:include page="left.jsp"></jsp:include>
   

  	<div id="search">
	    <span></span>
		<form action="/ShareBook/findBookByManyCrial.action" method="post" >
	    <table width="250" height="250">
	    	<tr align="center" style="height:50px;"><td colspan="2">高级搜索</td></tr>
	    	<tr><td>书名：</td><td><input type="text" name="bookName"></td></tr>
	    	<tr><td>作者：</td><td><input type="text" name="author"></td></tr>
	    	<tr><td>出版社：</td><td><input type="text" name="press"></td></tr>
	    	<tr><td>版次：</td><td><input type="text" name="edition"></td></tr>
	    	<tr align="center" style="height:50px;"><td colspan="2"><input type="submit" value="查询"/></td></tr>
	    </table>
	   </form>
  		</div>
 </div>
 <jsp:include page="buttom.jsp"></jsp:include>
  </body>
</html>
