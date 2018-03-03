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
		#content{width:1024px;height:600px;margin: 0 auto;background-color: #f7f7f7;}
		#title{background-color: #f7f7f7;margin:0 auto;width: 1024px;height: 95px;line-height: 77px;text-align: center;font-family: "宋体";font-size: 35px;}
		#title span{display: block;width: 300px;height: 80px;line-height: 80px;padding-left: 343px;}
		#content #main{width:1024px;}
		#content #main #left{float:left;width:300px;height:300px;margin-left: 70px;}
		#content #main #left #operate{ margin-top: -18px;margin-left: 140px;width: 350px;height: 200px;}
		#content #main #left #operate div{width: 100px; height: 24px; line-height: 30px;margin-top:30px;}
		#content #main #left #operate a{text-decoration: none;}
		#content #left #headimg{width: 200px;height: 200px;background-color: #FFF;margin-top: 20px;margin-left: 100px;}
		#content #left #headimg img{width:200px;height:200px;}
		#clear{clear:both;}
		#content #left #operate #up{display: block; width: 152px; height: 30px; margin-top: -30px; margin-left: 90px;}
		#content #right{width: 300px; height: 300px; margin-top: 45px; margin-left: 604px; position: absolute;}
		#content #right #uptable{width: 300px;height: 200px;}
	</style>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#oldPassword").bind("blur",function() {
				var password = $("#oldPassword").val();
				if(password.trim()==""){
					$("#mess").html('<font color="red">原密码不能为空</font>');
					return false;
				}else{
					if(password!="${user.password}"){
						$("#mess").html('<font color="red">原密码填写错误</font>');
						return false;
					}else{
						$("#mess").html("");
					}
				}
			});
			
			
			$("#updatepass").bind("click",function() {
				var oldpass = $("#oldPassword").val();
				var newpass = $("#newPassword").val();
				var newrepass = $("#newRepassword").val();
				if(oldpass.trim()==""||oldpass==null){
					alert("原密码不能为空");
					return false;
				}
				if(newpass.trim()==""||newpass==null){
					alert("新密码不能为空");
					return false;
				}
				if(newrepass.trim()==""||newrepass==null){
					alert("确认密码不能为空");
					return false;
				}
				if(newpass!=newrepass){
					alert("两次密码不一致");
					return false;
				}
				var flag = window.confirm("您确定要修改密码吗");
				if(flag){
					$("#passform").submit();
				}else{
					return false;
				}
			});
		});
	</script>
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
  	<div id="title"><span>修改密码</span>  </div>
    <div id="content">
    	
    	<div id="main">
	    	<div id="left">
	    		<div id="headimg">
	    			<img alt="" src="<c:url value='/${user.headimg }'/>" width="200px" height="200px">
	    		</div>
	    		<div id="operate">
	    			<div id="upload" >
	    					上传头像：
	    				<form action='<c:url value="/upLoadHeadImg.action"></c:url>' enctype="multipart/form-data" method="post" onsubmit="return upLoadImg()">
	    					<input id="up" name="file" type="file" />
	    					<input type="submit" value="上传"><span id="ms" style="position: absolute;"></span>
	    				</form>
	    			</div>
	    			<div><a href="<c:url value="/userjsps/updatePerson.jsp"/>">修改个人信息</a></div>
	    			<div><a href="<c:url value="/userjsps/updatePassword.jsp"/>">修改密码</a></div>
	    			<div><a href="<c:url value="/userjsps/myIndexHome.jsp"/>">返回</a></div>
	    		</div>
	    	</div>
	    	<div id="right">
	    		<form action='<c:url value="/updatePassword.action"></c:url>' id="passform" method="post">
	    			<table id="uptable">
	    				<tr>
	    					<td>原密码：</td><td><input type="password" name="oldPassword" id="oldPassword"/><span id="mess"></span>${oldError }</td>
	    				</tr>
	    				<tr>
	    					<td>新密码：</td><td><input type="password" name="newPassword" id="newPassword"><span>${newError }</span></td>
	    				</tr>
	    				<tr>
	    					<td>确认密码：</td><td><input type="password" name="newRepassword" id="newRepassword"><span>${equError }</span></td>
	    				</tr>
	    				<tr>
	    					<td colspan="2" align="center"><input type="button" value="提交" id="updatepass"></td>
	    				</tr>
	    				<tr><td colspan="2" align="center"><span style="color:red;font-size:22px;">${uppassMes }</span></td></tr>
	    			</table>
	    		</form>
	    	</div>
	    	<div id="clear"></div>
    	</div>
    </div>
    <jsp:include page="buttom.jsp"></jsp:include>
  </body>
</html>

