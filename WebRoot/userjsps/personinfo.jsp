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
    
    <title>My JSP 'personinfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		#body{marign-top:0;}
		#content{width:1024px;height:600px;margin: 0 auto;background-color: #f7f7f7;}
		#title{background-color: #f7f7f7;margin:0 auto;width: 1024px;height: 95px;line-height: 77px;text-align: center;font-family: "宋体";font-size: 35px;}
		#title span{display: block;width: 300px;height: 80px;line-height: 80px;padding-left: 343px;}
		#content #main{width:1024px;}
		#content #main #right{float:left;width:600px;}
		#content #main #right #persontable{margin-top: 10px;margin-left: 200px;}
		#content #main #left{float:left;width:300px;height:300px;margin-left: 70px;}
		#content #main #left #operate{ margin-top: -18px;margin-left: 140px;width: 350px;height: 200px;}
		#content #main #left #operate div{width: 100px; height: 24px; line-height: 30px;margin-top:30px;}
		#content #main #left #operate a{text-decoration: none;}
		#content #left #headimg{width:200px;height:200px;background-color: #fff;margin-top: 20px;
    		margin-left: 100px;}
		#content #left #headimg img{width:200px;height:200px;}
		#clear{clear:both;}
		#content #left #operate #up{display: block; width: 152px; height: 30px; margin-top: -30px; margin-left: 90px;}
	</style>
	<script type="text/javascript" src="/ShareBook/js/jquery.js"></script>
	<script type="text/javascript">
			function upLoadImg(){
				var fileName = $("#up").val();
				if(fileName==""){
					$("#ms").append("<font color='red'>请选择图片</font>"); 
					return false;
				}else{
					return true;
				}
			}
	</script>
  </head>
  
  <body>
  	<jsp:include page="head.jsp"></jsp:include>
    	<div id="title"><span>个人中心</span></div>
    <div id="content">
    	<div id="main">
	    	<div id="left">
	    		<div id="headimg">
	    			<img alt="" src="<c:url value='/${user.headimg }'/>" width="200px" height="200px">
	    		</div>
	    		<div id="operate">
	    			<div id="upload" >
	    					上传头像：
	    				<form id="upForm" action='<c:url value="/upLoadHeadImg.action"></c:url>' enctype="multipart/form-data" method="post" onsubmit="return upLoadImg();">
	    					<input id="up" name="file" type="file" />
	    					<input id="btnUp" type="submit" value="上传"><span id="ms" style="position: absolute;"></span>
	    				</form>
	    			</div>
	    			<div><a href="<c:url value="/userjsps/updatePerson.jsp"/>">修改个人信息</a></div>
	    			<div><a href="<c:url value="/userjsps/updatePassword.jsp"/>">修改密码</a></div>
	    			<div><a href="<c:url value="/userjsps/myIndexHome.jsp"/>">返回</a></div>
	    		</div>
	    	</div>
	    	<div id="right">
	    		<div id="persontable">
	    		<table border="0" bordercolor="write" cellpadding="10" cellspacing="0">
					<tr>
						<th colspan="2">个人信息</th>
					</tr>
					<tr>
						<td>用户名称:</td>
						<td><input type="text" name="userName" value="${user.loginName }" readonly="readonly"/></td>
					</tr>
					<tr>
						<td>E-mail:</td>
						<td><input type="text" name="email" value="${user.email }" readonly="readonly"/></td>
					</tr>
					<tr>
						<td>昵称:</td>
						<td><input type="text" name="nickName" value="${user.nickName }" readonly="readonly"/></td>
					</tr>
					<tr>
						<td>地址:</td>
						<td><input type="text" name="address" value="${user.address }" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td>联系方式:</td>
						<td><input type="text" name="phone"  value="${user.phone }" readonly="readonly"/></td>
					</tr>
					<tr>
						<th colspan="2"><input type="reset" value="重置" /> <input
							type="submit" value="确定" /></th>
					</tr>
				</table>
				</div>
	    	</div>
	    	<div id="clear"></div>
    	</div>
    </div>
    <jsp:include page="buttom.jsp"></jsp:include>
  </body>
</html>
