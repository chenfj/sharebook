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
    <div id="remarklist">
    	<a href="">添加</a>|<a href="">查看</a>|<a href="">删除</a>
    	<table>
    		<tr><td colspan="6">图书列表</td></tr>
    		<tr><td>序号</td><td>书名</td><td>作者</td><td>主人</td><td>上传日期</td></tr>
    		<tr><td>1</td><td>红楼梦</td><td>曹雪芹</td><td>aaa</td><td>2015-5-5</td></tr>
    	</table>
    	
    </div>
  </body>
</html>
