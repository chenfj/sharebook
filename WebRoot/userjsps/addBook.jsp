<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		#content #top_img{width: 413px;height: 88px;display: block;margin-top: 50px;margin-left: 530px;}
		#content #my{height: 88px;width: 100px;line-height: 88px;margin-top: -91px;position: absolute;
				margin-left: 293px;font-size: 25px;color: #620D0D;}
		#content{width:1200px;margin:0 auto;}
		#content #detail{width: 600px;height:350px;float: left;margin-top: 63px;margin-left: 466px;position: relative;}
		#content #detail #table1 { font-family: "微软雅黑";font-size: 15px;width: 600px;height: 360px;}
		#content #detail #table1 td{height: 35px;}
		#content #detail #table1 td a{text-decoration:none;color:#9D141C;font-size: 16px;font-family: "宋体";font-weight: 700;}
		#content #detail #table1 insub{display: block; margin-left: -249px;}
		#insub{cursor:pointer; display: block; margin-left: -331px;}
		#clear{clear: both;}
	</style>
	<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
	<link rel="stylesheet" href="js/jquery.datepick.css" type="text/css">
	<script type="text/javascript" src="js/jquery.datepick.js"></script>
	<script type="text/javascript" src="js/jquery.datepick-zh-CN.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#publishdate').datepick({dateFormat: 'yy-mm-dd'}); 
	});
	
	$(function(){
			$.post(
					"/ShareBook/ajaxFindAllCategory.action",
					function(data){
						var categorySelect = $("#category");
						for(var i=0;i<data.length;i++){
							categorySelect.append("<option value='"+data[i].cid+"'>"+data[i].categoryName+"</option>")
						}
					},"json"
				);
	});
	function checkBookMess(){
		var bookName = $("#bookName").val();
		var publishTime = $("#publishdate").val();
		var author = $("#author").val();
		var press = $("#press").val();
		var edition = $("#edition").val();
		var file = $("#file").val();
		var category = $("#category").val();
		var dealType = $("#dealType").val();
		
		if(bookName==null||$.trim(bookName)==""){
			$("#boo").html('<font color="red">书名不能为空</font>');
			return false;
		}
		if(publishTime==null||$.trim(publishTime)==""){
			$("#pub").html('<font color="red">出版时间不能为空</font>');
			return false;
		}
		if(author==null||$.trim(author)==""){
			$("#aut").html('<font color="red">作者不能为空</font>');
			return false;
		}
		if(press==null||$.trim(press)==""){
			$("#pre").html('<font color="red">出版社不能为空</font>');
			return false;
		}
		if(edition==null||$.trim(edition)==""||!/^[1-9]$/.test(edition.trim())){
			$("#edi").html('<font color="red">请输入一位有效数字</font>');
			return false;
		}
		if(file==null||$.trim(file)==""){
			$("#fil").html('<font color="red">请上传图书图片</font>');
			return false;
		}
		if(category==null||$.trim(category)=="0"){
			$("#cat").html('<font color="red">请选择图书类别</font>');
			return false;
		}
		if(dealType==null||$.trim(dealType)=="2"){
			$("#dea").html('<font color="red">请选择交易类型</font>');
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
	    <div id="detail">
	    	<form action='<c:url value="/addBook.action"></c:url>' enctype="multipart/form-data" method="post" onsubmit="return checkBookMess()">
		   		<table id="table1">
		   			<tr><td>书名：</td><td><input type="text" name="bookName" id="bookName"/><span id="boo">${booError }</span></td></tr>
		   			<tr><td>作者：</td><td><input type="text" name="author" id="author"/><span id="aut">${autError }</span></td></tr>
		   			<tr><td>出版日期：</td><td><input id="publishdate" type="text" name="publishTime"/><span id="pub">${pubError }</span></td></tr>
		   			<tr><td>出版社：</td><td><input id="press" type="text" name="press"/><span id="pre">${preError }</span></td></tr>
		   			<tr><td>版次：</td><td><input type="text"  name="edition" id="edition"/><span id="edi">${ediError }</span></td></tr>
		   			<tr><td>图书图片：</td><td><input type="file" name="file" id="file"/><span id="fil">${fileError }${fileSizeError }</span></td></tr>
		   			<tr><td>图书类别：</td>
		   				<td>
		   					<select id="category" name="category">
		   						<option value="0">请选择</option>
		   					</select><span id="cat">${catError }</span>
		   				</td>
		   			</tr>
		   			<tr><td>交易类型：</td><td><select id="dealType" name="dealType"><option value="2">-请选择-</option><option value="1">彼此互换</option><option value="0">无条件借阅</option></select><span id="dea">${deaError }</span></td></tr>
		   			<tr><td colspan="2" align="center"><input id="insub" type="submit" value="提交"></td></tr>
		   		</table>
		   	</form>
	    </div>
	    <div id="clear"></div>
  	</div>
  		<jsp:include page="buttom.jsp"></jsp:include>
  </body>
</html>
