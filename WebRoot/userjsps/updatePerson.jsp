<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<style>
#content {
	width: 1024px;
	height: 600px;
	margin: 0px auto;
	background-color: #f7f7f7;
}

#title{background-color: #f7f7f7;margin:0 auto;width: 1024px;height: 95px;line-height: 77px;text-align: center;font-family: "宋体";font-size: 35px;}
		#title span{display: block;width: 300px;height: 80px;line-height: 80px;padding-left: 343px;}
#content #main {
	width: 1024px;
}

#content #main #right {
	float: left;
	width: 600px;
}

#content #main #right #persontable {
	margin-top: 10px;
	margin-left: 200px;
}

#content #main #left {
	float: left;
	width: 300px;
	height: 300px;
	margin-left: 70px;
}

#content #main #left #operate {
	margin-top: -18px;
	margin-left: 140px;
	width: 350px;
	height: 200px;
}

#content #main #left #operate div {
	width: 100px;
	height: 24px;
	line-height: 30px;
	margin-top: 30px;
}

#content #main #left #operate a {
	text-decoration: none;
}

#content #left #headimg {
	width: 200px;
	height: 200px;
	background-color: #FFF;
	margin-top: 20px;
	margin-left: 100px;
}

#content #left #headimg img {
	width: 200px;
	height: 200px;
}

#clear {
	clear: both;
}

#content #left #operate #up {
	display: block;
	width: 152px;
	height: 30px;
	margin-top: -30px;
	margin-left: 90px;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function checkMess() {
		var nickName = $("#nickName").val();
		var email = $("#email").val();
		var phone = $("#phone").val();
		if ($.trim(nickName) == "" || nickName == null) {
			$("#nic").html('<font color="red">昵称不能为空</font>');
			return false;
		}
		var emailRegex = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
		if (email.trim() == "" || email == null || !emailRegex.test(email)) {
			$("#ema").html('<font color="red">邮箱格式不正确</font>');
			return false;
		}
		var regexPho = /^1[3-9][0-9]{9}$/;
		if (phone.trim() == "" || phone == null || !regexPho.test(phone)) {
			$("#pho").html('<font color="red">请填写有效的手机号</font>');
			return false;
		}
		var flag = window.confirm("您确定要修改信息吗");
		if (flag) {
			$("#uppeoform").submit();
		} else {
			return false;
		}
	}
	$(function() {
		$("#nickName").bind("blur", function() {
			if ($("#nickName").val().trim() != "" && nickName != null) {
				$("#nic").html("");
			}
		});
		$("#email").bind("blur", function() {
			if ($("#email").val().trim() != "" && nickName != null) {
				$("#ema").html("");
			}
		})
		$("#phone").bind("blur", function() {
			if ($("#phone").val().trim() != "" && nickName != null) {
				$("#pho").html("");
			}
		})
	})
</script>
</head>

<body>
	<jsp:include page="head.jsp"></jsp:include>	
    <div id="title"><span>修改信息</span> </div>
	 <div id="content">
    	<div id="main">
	    	<div id="left">
	    		<div id="headimg">
	    			<img alt="" src="<c:url value='/${user.headimg }'/>" width="200px" height="200px">
	    		</div>
	    		<div id="operate">
	    			<div id="upload" >
	    					上传头像：
	    				<form action='<c:url value="/upLoadHeadImg.action"></c:url>' enctype="multipart/form-data" method="post"  onsubmit="return upLoadImg()">
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
	    		<div id="persontable">
	    		<form id ="uppeoform" action="/ShareBook/updatePerson.action"  method="post">
	    		<table border="0" bordercolor="write" cellpadding="10" cellspacing="0">
					<tr>
						<th colspan="2">修改个人信息</th>
					</tr>
					<tr>
						<td>昵称:</td>
						<td><input type="text" name="nickName"  id="nickName" value="${user.nickName }"/><span id="nic">${niError }</span></td>
					</tr>
					<tr>
						<td>E-mail:</td>
						<td><input type="text" name="email" id="email" value="${user.email }"/><span id="ema">${emError }</span></td>
					</tr>
					<tr>
							<td>地址:</td>
							<td><select name="province" id="province">
									<option value="${map.user.address }">${user.address }</option>
									<option value="山西">山西</option>
									<option value="上海">上海</option>
									<option value="北京">北京</option>
							</select><span id="pro"></span></td>
						</tr>
					<tr>
						<td>联系方式:</td>
						<td><input type="text" name="phone"  id="phone" value="${user.phone }"/><span id="pho">${phError }</span></td>
					</tr>
					<tr>
						<th colspan="2"><input type="reset" value="重置" /> <input
							type="button" onclick="return checkMess();" value="确定" /></th>
					</tr>
					<tr><td colspan="2" align="center"><span style="color:red;font-size:22px;">${upPeoError }</span></td></tr>
				</table>
				</form>
				</div>
	    	</div>
	    	<div id="clear"></div>
    	</div>
    </div>
    <jsp:include page="buttom.jsp"></jsp:include>
</body>
</html>


