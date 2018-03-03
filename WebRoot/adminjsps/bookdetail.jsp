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
    
    <title>My JSP 'bookdetail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		#content{width:1200px;margin:0 auto;}
		#content #bookimg{height: 350px;width:350px;float:left;}
		#content #detail{width:850px;height: 350px;float:left;margin-top: 30px;}
		#content #detail #table1 td{height: 35px;}
		#content #remark{margin-top: 60px;margin-left: 20px;}
		#clear{clear: both;}
	</style>
  </head>
  
  <body>
    <div id="content">
    	<div id="bookimg">
    		<img id="im" alt="" src="22886581-1_w.jpg">
    	</div>
	    <div id="detail">
	   		<table id="table1">
	   			<tr><td>书名：</td><td></td></tr>
	   			<tr><td>作者：</td><td></td></tr>
	   			<tr><td>出版日期：</td><td></td></tr>
	   			<tr><td>上传日期：</td><td></td></tr>
	   			<tr><td>版次：</td><td></td></tr>
	   			<tr><td>交易类型：</td><td></td></tr>
	   			<tr><td>主人联系方式：</td><td></td></tr>
	   			<tr><td colspan="2"><a href='<c:url value='/userjsps/userinfo.jsp'></c:url>'>查看主人详情</a></td></tr>
	   		</table>
	    </div>
	    <div id="clear"></div>
	    <div id="remark">
		    <form action="">
			    发表评论：
			    <textarea cols="100" rows="1">
			    </textarea>
			    <input type="submit" value="发表">
		    </form>
		    
		    	关于这本书的评论:13条<br>
		    	<table>
		    		<tr><td><img alt="" src="">登录名昵称：</td><td>评论内容，这本书很好</td></tr>
		    	</table>
	    </div>
    </div>
  </body>
</html>
