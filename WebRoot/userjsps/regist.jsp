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
    
    <title>My JSP 'regist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
	
		#menu .items{width: 300px;margin-left: 393px;margin-top: -7px;}
		#menu{width:1024;height:81px;background:#27445C;position:relative;}
		#menu .logo{width:170px;height:63px;margin-left:100px;float:left;cursor:pointer;}
		#menu .items ul{width:600px;height:65px;float:left;cursor:pointer;}
		#menu .items ul li{list-style:none;float:left;color:#FFF;font-size:33px;width:600px;height:65px;text-align:center;line-height:65px;}
		#menu .items ul li:first-child{background:#34495E;}
		#menu .items ul li:hover{background:#34495E;}
		#menu .search{width:90px;height:30px;background:#223242;border-radius:15px;position:absolute;top:17px;right:230px;}
		#menu .search .content{width:30px;float:left;color:#7A8897;padding-left:15px;line-height:30px;outline:none;}
		#menu .search .icon{width:30px;height:30px;right:0px;position:absolute;float:left;}
		#menu .search .icon img{margin-left:0 auto;margin:4px 4px 0 0;}
		#menu .btn{width:100px;height:30px;float:right;margin-right:100px;margin-top:15px;}
			 .btn a{width:50px;height:30px;display:block;text-decoration:none;color:#B8C4CE;font-size:14px;float:
					left;text-align:center;line-height:30px;}
		#menu .btn a:hover{background:#34495E;color:#3498DB;}
		#home .title  items .upload :hover{cursor: pointer;}
		
		#content{width:1024px;height:600px; margin:0 auto;background-color: #f7f7f7;}
		#regist{margin-top: 27px; position: absolute; display: block; font-size: 30px; margin-left: 70px;font-weight: 400;color: gray;}
		#content #left{float:left;margin-top: 137px; margin-left: 285px;}
		#content #left #words{position: absolute;margin-top: -54px;}
		#content #tishi{position: absolute;margin-top: -373px;margin-left: 371px;display: block;}
		#content #right{float:left;margin-top: 38px;margin-left: 195px;}
	</style>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#loginName").bind("blur",function() {
			var loginName = $("#loginName").val();
				if(loginName.trim()==""){
					$("#mess").html('<font color="red">登录名不可以为空</font>');
				}else{
					$.post(
					"/ShareBook/checkUserLoginName.action",
					{"loginName":loginName},
					function(data){
						if(data==0){
							$("#mess").html('<font color="green">登录名可以使用</font>');
						}else if(data==1){
							$("#mess").html('<font color="red">登录名已存在</font>');
						}
					},"json"
				);
				}
			})
			
			$("#email").bind("focus", function(){
				$("#ema").html('<font color="red">请填写有效的邮箱，需邮箱激活才可登录！</font>');
			})
		});
		function checkMess(){
				var password = $("#password").val();
				var rePassword = $("#rePassword").val();
				var nickName = $("#nickName").val();
				var email = $("#email").val();
				var phone = $("#phone").val();
				var province = $("#province").val();
				var loginName = $("#loginName").val();
				if(loginName.trim()==""||loginName.length>30){
					$("#mess").html('<font color="red">登录名不可以为空</font>');
					return false;
				}
				if(password.trim()==""||password==null){
					$("#pas").html('<font color="red">密码不能为空</font>');
					return false;
				}
				if(rePassword.trim()==""||rePassword==null){
					$("#rep").html('<font color="red">确认密码不能为空</font>');
					return false;
				}
				if(password!=rePassword){
					$("#rep").html('<font color="red">两次密码不一致</font>');
					return false;
				}
				if(nickName.trim()==""||nickName==null){
					$("#nic").html('<font color="red">昵称不能为空</font>');
					return false;
				}
				var emailRegex = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
				if(email.trim()==""||email==null||!emailRegex.test(email)){
					$("#ema").html('<font color="red">邮箱格式不正确</font>');
					return false;
				}
				var regexPho=/^1[3-9][0-9]{9}$/;
				if(phone.trim()==""||phone==null||!regexPho.test(phone)){
					$("#pho").html('<font color="red">请填写有效的手机号</font>');
					return false;
				}
				if(province==0){
					$("#pro").html('<font color="red">请选择地址</font>');
					return false;
				}
			}
		
	</script>
  </head>
  
  <body>
  <jsp:include page="head.jsp"></jsp:include>
    <div id="content">
			<h5 id="regist">欢迎注册</h5>
		<div id ="right" align="center">
			<form action="<c:url value='/regist.action'/>"  onsubmit="return checkMess();" method="post">
				<table border="0" bordercolor="write" cellpadding="10" cellspacing="0">
					<tr>
						<th colspan="2">&nbsp;</th>
					</tr>
					<tr>
						<td>登录名:</td>
						<td><input type="text" name="loginName" id="loginName"/><span id="mess"></span></td>
					</tr>
					<tr>
						<td>密码:</td>
						<td><input type="password" name="password" id="password"/><span id="pas"></span></td>
					</tr>
					<tr>
						<td>确认密码:</td>
						<td><input type="password" name="rePassword" id="rePassword"/><span id=rep></span></td>
					</tr>
					<tr>
						<td>昵称:</td>
						<td><input type="text" name="nickName" id="nickName"/><span id="nic"></span></td>
					</tr>
					<tr>
						<td>联系方式:</td>
						<td><input type="text" name="phone"  id="phone" placeholder="必填"/><span id="pho"></span></td>
					</tr>
					<tr>
						<td>E-mail:</td>
						<td><input type="text" name="email" id="email"/><span id="ema"></span></td>
					</tr>
					<tr>
						<td>地址:</td>
						<td><select name="province" id="province">
								<option value="0" selected="selected">--请选择--</option>
								<option value="山西">山西</option>
								<option value="上海">上海</option>
								<option value="北京">北京</option>
								<option value="陕西">陕西</option>
								<option value="辽宁">辽宁</option>
								<option value="湖南">湖南</option>
								<option value="湖北">湖北</option>
								<option value="河南">河南</option>
								<option value="河北">河北</option>
								<option value="江西">江西</option>
								<option value="广东">广东</option>
								<option value="广西">广西</option>
								<option value="浙江">浙江</option>
								<option value="山东">山东</option>
								<option value="西藏">西藏</option>
							 </select><span id="pro"></span>
						</td>
					</tr>
					<tr>
						<th colspan="2"><input type="reset" value="重置" /> <input
							type="submit" value="确定" /></th>
					</tr>
				</table>
			</form>
	<div id="tishi">
		<img alt="" src="<c:url value='/images/tishi.jpg'/>">
	</div>
	<div>
	<c:choose>
	<c:when test="${registSuccess==null}">
		
	</c:when>
	<c:otherwise>
		<c:if test="${registSuccess!=1}">
			由于系统原因，注册失败！
		</c:if>
		注册成功，去邮箱激活吧！
	</c:otherwise>
	</c:choose>
	</div>
	</div>
</div>
<jsp:include page="buttom.jsp"></jsp:include>
  </body>
</html>
