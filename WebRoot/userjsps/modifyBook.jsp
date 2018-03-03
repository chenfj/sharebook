<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		#content #top_img{width: 413px;height: 88px;display: block;margin-top: 0;margin-left: 400px;}
		#content #my{height: 88px;width: 100px;line-height: 88px;margin-top: -91px;position: absolute;
				margin-left: 192px;font-size: 25px;color: #620D0D;}
		#content{width:1200px;margin:0 auto;padding-top: 35px;}
		#content #bookimg{height: 350px;width:350px;float:left;margin-top: 30px;margin-left: 138px;}
		#content #bookimg #im{height: 350px;width:350px;float:left;}
		#content #detail{width: 600px;height: 350px;float: left;margin-top: -326px;
				margin-left: 524px;position: relative;}
		#content #detail #table1 { font-family: "微软雅黑";font-size: 15px;}
		#content #detail #table1 td{height: 35px;}
		#content #detail #table1 input{height: 35px;}
		#content #detail #table1 td a{text-decoration:none;color:#9D141C;font-size: 16px;font-family: "宋体";font-weight: 700;}
		#clear{clear: both;}
	</style>
	<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
	<link rel="stylesheet" href="js/jquery.datepick.css" type="text/css">
	<script type="text/javascript" src="js/jquery.datepick.js"></script>
	<script type="text/javascript" src="js/jquery.datepick-zh-CN.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#publishTime').datepick({dateFormat: 'yy-mm-dd'}); 
	});
	
	function checkModifyBookMess(){
		var bookName = $("#bookName").val();
		var publishTime = $("#publishTime").val();
		var author = $("#author").val();
		var press = $("#press").val();
		var edition = $("#edition").val();
		
		if(bookName.trim()==""||bookName==null){
			$("#boo").html('<font color="red">书名不能为空</font>');
			return false;
		}
		if(publishTime.trim()==""||publishTime==null){
			$("#pub").html('<font color="red">出版时间不能为空</font>');
			return false;
		}
		if(author.trim()==""||author==null){
			$("#aut").html('<font color="red">作者不能为空</font>');
			return false;
		}
		if(press.trim()==""||press==null){
			$("#pre").html('<font color="red">出版社不能为空</font>');
			return false;
		}
		if(edition.trim()==""||edition==null||!/^[1-9]{1,2}$/.test(edition.trim())){
			$("#edi").html('<font color="red">请输入有效数字</font>');
			return false;
		}
	}
</script>
  </head>
  
  <body>
  	<jsp:include page="head.jsp"></jsp:include>
  	<div id="content">
  		<div id="top_img">
    		<img alt="" src='<c:url value="/images/sj1.jpg"></c:url>'>
    	</div>
    	<div id="my" >我的书架</div>
  		<div id="bookimg">
    		<img id="im" alt="" src='<c:url value="/${book.bookImg }"/>'>
    	</div>
	    <div id="detail">
	    	<form action='<c:url value="/modifyBook.action?bid=${book.bid }"></c:url>' method="post" onsubmit="return checkModifyBookMess()">
		   		<table id="table1">
		   			<tr><td>书名：</td><td><input type="text" value="${book.bookName }" name="bookName" id="bookName"/><span id="boo"></span></td></tr>
		   			<tr><td>作者：</td><td><input type="text" value="${book.author }" name="author" id="author"/><span id="aut"></span></td></tr>
		   			<tr><td>出版社：</td><td><input type="text" value="${book.press }" name="press" id="press"/><span id="pre"></span></td></tr>
		   			<tr><td>出版日期：</td><td><input type="text" value=' <fmt:formatDate value="${book.publishTime }" pattern="yyyy-MM-dd"/>' name="publishTime" id="publishTime"><span id="pub"></span></td></tr>
		   			<tr><td>版次：</td><td><input type="text"value="${book.edition }" name="edition" id="edition"/><span id="edi"></span></td></tr>
		   			<tr><td>交易类型：</td><td><select id="dealType" name="dealType" id="dealType">
		   							
		   								<c:choose>
		   									<c:when test="${book.dealType ==0}"><option value="0" selected="selected">无条件借阅</option></c:when>
		   									<c:otherwise><option value="1" selected="selected">彼此互换</option></c:otherwise>
		   								</c:choose>
		   								
		   							<option value="1">彼此互换</option><option value="0">无条件借阅</option></select><span id="dea"></span></td></tr>
			   		<tr><td colspan="2" align="center"><input type="submit" value="保存" style="cursor: pointer;"></td></tr>
		   		</table>
		   	</form>
	    </div>
	    <div id="clear"></div>
  	</div>
  		<jsp:include page="buttom.jsp"></jsp:include>
  </body>
</html>
