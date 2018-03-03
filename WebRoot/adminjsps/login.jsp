<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<!--声明当前页面的编码集charset=GBK，gb2312(中文编码)，UTF-8(国际编码)-->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<!---->
		<title>后台-登录</title>
		<meta name="Keywords" content="关键词,关键词">
		<meta name="description" content="">
		
		
		<style type="text/css">
			*{margin:0;padding:0;}
			body{background:url("/ShareBook/images/bg.jpg") no-repeat center fixed;
				background-size:100% 100%;
				font-size:12px;font-family:"微软雅黑";color:#fff;
			}
			img{border:0;}
			/*以"."开头的css样式称之为 类样式*/
			.login{width:400px;height:600px;background:#4d4d4d;margin:50px auto;position:relative;}
			.login .top{width:400px;height:60px;background:#1b1b1b;font-size:20px;
					font-weight:bold;text-align:center;line-height:60px;
			}
			/*新增功能*/
			.login .top span{float:left;margin-left:81px;color:#fff;}
			.login .top .menu{width:60px;height:60px;display:block;background:url("/ShareBook/images/icon-config.png") no-repeat center;float:right;border-left:1px solid #232323;}
			/*切换皮肤按钮*/
			.login .top .box_color{width:111px;height:164px;background:url("/ShareBook/images/white-color-bg.png") no-repeat;position:absolute;right:-114px;display:none;}
			.login .top .box_color a{float:left;margin:15px -5px 5px 18px;}
			
			.login .logo{width:180px;height:180px;background:#1b1b1b;margin:50px auto;
					border-radius:90px;
			}
			.login .logo a{width:180px;height:180px;display:block;background:url("/ShareBook/images/logo.jpg") no-repeat center;}

			.login .text{width:400px;height:150px;}
			.login .text input{width:340px;height:45px;border:0;background:#1b1b1b;
					color:#fff;font-size:16px;font-family:"微软雅黑";
					padding-left:20px;line-height:45px;
					/*margin:上 右 下 左;*/
					margin:20px 0 0 20px; border-radius:4px;
			}
			.login .btn input{width:360px;height:60px;background:url("/ShareBook/images/orange_btn.png") no-repeat;border:0;margin-left:20px;cursor: pointer;}
			
			.login .text .tips{width:350px;height:30px;border:2px solid #ccc;position:absolute;bottom:245px;left:20px;border-radius:4px;font-size:14px;
				color:#fff;padding:5px 0 0 5px;
			}
			.login .text .tips i{background:url("/ShareBook/images/bullet_arrow_down.png") no-repeat;
				padding:11px;position:relative;top:29px;
			}


		</style>

	</head>
<body>
	
	<!--以class="自定义名称"称之为 类样式-->
	<div class="login">
		<form action="/ShareBook/adminLogin.action" method="post" onsubmit="return tz_login();">
			<div class="top">
				<span>绿色书籍共享网后台 登录</span>
				<a class="menu" id="myMenu" href="javascript:void(0);"></a>
				<div class="box_color">
					<a href="javascript:;" to="blue_btn.png"><img src="../images/blue.png"/></a>
					<a href="javascript:;" to="orange_btn.png"><img src="../images/orange.png"/></a>
					<a href="javascript:;" to="green_btn.png"><img src="../images/green.png"/></a>
					<a href="javascript:;" to="red_btn.png"><img src="../images/red.png"/></a>
				</div>
			</div>
			<div class="logo">
				<a href="#"></a>
			</div>
			<div class="text">
				<input type="text" name="username" id="username" tip="提示：请输入用户名,由数字字母下划线构成(4-16)" placeholder="请输入用户名"/>${mes }
				<input type="password" name="password" id="password" tip="请输入密码,由数字字母下划线构成(6-15)" placeholder="请输入密码"/>${error }
			</div>
			<div class="btn">
				<input class="tz_submit" type="submit" value=""/>
			</div>
		</form>
	</div>

<!--引入jQuery的官方类库-->
<script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		// 点击事件
		$("#myMenu").click(function(){
			$(".box_color").show();
		});
		// 当鼠标指针离开元素时，会发生事件
		$(".box_color").mouseleave(function(){
			$(this).hide();
		});
		// 点击图标时，换皮肤
		$(".box_color").find("a").click(function(){
			var to = $(this).attr("to");
			//alert("图片的名称："+to);
			$(".tz_submit").css("background","url('../images/"+to+"')");
		});
		// 失去焦点时
		$(".text input").blur(function(){
			$(this).prev(".tips").remove();
		});

	});

	// 提示层
	function tz_yanzheng($this){
		var tip = $this.attr("tip");
		//alert(tip);
		$this.prev(".tips").remove();
		// 在每个匹配的元素之前插入内容。
		$this.before("<div class='tips'><i></i>"+tip+"</div>");
	}


	// 登录用户名密码验证
	function tz_login(){
		var username = $("#username").val();
		var password = $("#password").val();
		//alert("用户名："+username+"密码："+password);
		if(username.length == 0 || !/^[\da-zA-Z_\u4e00-\u9fa5]{2,16}$/.test(username) ){
			//alert("请您输入正确的用户名 ！");
			tz_yanzheng($("#username"));
			return false;
		}

		if(password.length == 0 || !/^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,15}$/.test(password)){
			//alert("您的密码输入错误 ！");
			tz_yanzheng($("#password"));
			return false;
		}
		return true;
	}




</script>

</body>
</html>