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
    	<table>
    		<tr><td colspan="6">待审核图书</td></tr>
    		<tr><td>序号</td><td>书名</td><td>图片</td><td>主人</td><td>上传日期</td><td>操作</td></tr>
    		<tr><td>1</td><td>水浒传</td><td><img alt="" src=""></td><td>小刘</td><td>2015-5-5</td><td><select><option>请选择</option><option>同意</option><option>拒绝</option></select></td></tr>
    	</table>
    </div>
  </body>
</html>
