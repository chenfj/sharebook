<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/login.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script src="<c:url value='/js/common.js'/>"></script>
	<script src="<c:url value='/js/jquery.js'/>"></script>
	<script type="text/javascript">
		function changeImg(){
			var img = document.getElementById("vCode");
			img.src="/ShareBook/checkCodeServlet?time="+new Date().getTime();
		}
		function checkUserInfo(){
			var loginName = $("#loginname").val();
			var loginPass = $("#loginpass").val();
			var verifycode = $("#verifyCode").val();
			if(loginName.trim()==""||loginName==null){
				$("#loginnameError").css("visibility","visible");
				return false;
			}
			if(loginPass.trim()==""||loginPass==null){
				$("#loginpassError").css("visibility","visible");
				return false;
			}
			if(verifycode.trim()==""||verifycode==null){
				$("#verifyCodeError").css("visibility","visible");
				return false;
			}
		}
		$(function(){
				$("#loginname").bind("blur",function() {
					if($("#loginname").val().trim()!=""){
						$("#loginnameError").css("visibility","hidden");
					}
				});
				$("#loginpass").bind("blur",function() {
					if($("#loginpass").val().trim()!=""){
						$("#loginpassError").css("visibility","hidden");
					}
				})
				$("#verifyCode").bind("blur",function() {
					if($("#verifyCode").val().trim()!=""){
						$("#verifyCodeError").css("visibility","hidden");
					}
				})
			})
		
	</script>
	
	<style type="text/css">
		#slog{width: 400px; height: 74px; margin-top: 2px; margin-left: 35px; position: absolute;}
		.error{visibility: hidden;}
		span{color:#cc3300;font-weight: 900;}
		.login1{position: absolute;margin-left: 420px;}
	</style>
	
  </head>
  
  <body>
  	<jsp:include page="head.jsp"></jsp:include>
	<div class="main">
	  <div id="slog">
	  	欢迎登陆
	  </div>
	  <div>
	    <div class="imageDiv"><img class="img" src="<c:url value='/images/zj.png'/>"/></div>
        <div class="login1">
	      <div class="login2">
            <div class="loginTopDiv">
              <span class="loginTop">用户登录</span>
              <span>
                <a href="<c:url value='/userjsps/regist.jsp'/>" class="registBtn"></a>
              </span>
            </div>
            <div>
              <form target="_top" action="<c:url value='/userLogin.action'/>" onsubmit="return checkUserInfo();" method="post" id="loginForm">
                <input type="hidden" name="method" value="" />
                  <table>
                    <tr>
                      <td width="50"></td>
                      <td><span>${loginMsg}</span><label class="error" id="msg">用户名或密码错误或未激活</label></td>
                    </tr>
                    <tr>
                      <td width="50">用户名</td>
                      <td><input class="input" type="text" name="loginname" id="loginname" value="${user.loginName }"/></td>
                    </tr>
                    <tr>
                      <td height="20">&nbsp;</td>
                      <td><label id="loginnameError" class="error">用户名不能为空</label></td>
                    </tr>
                    <tr>
                      <td>密　码</td>
                      <td><input class="input" type="password" name="loginpass" id="loginpass"/></td>
                    </tr>
                    <tr>
                      <td height="20">&nbsp;</td>
                      <td><label id="loginpassError" class="error">密码不能为空</label><span>${pasError }</span></td>
                    </tr>
                    <tr>
                      <td>验证码</td>
                      <td>
                        <input class="input yzm" type="text" name="verifyCode" id="verifyCode" value=""/>
                        <img id="vCode" src='<c:url value="/checkCodeServlet"></c:url>'/>
                        <a id="verifyCode" onclick="changeImg()">换张图</a>
                      </td>
                    </tr>
                    <tr>
                      <td height="20px">&nbsp;</td>
                      <td><span>${verError }</span><label id="verifyCodeError" class="error">验证码不能为空！</label></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td align="left">
                        <input type="image" id="submit" src="<c:url value='/images/login1.jpg'/>" class="loginBtn"/>
                      </td>
                    </tr>																				
                 </table>
              </form>
            </div>
          </div>
        </div>
      </div>

	</div>
		<jsp:include page="buttom.jsp"></jsp:include>
  </body>
</html>
	