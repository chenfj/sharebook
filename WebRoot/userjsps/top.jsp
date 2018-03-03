<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<style type="text/css">
		body{margin:0;}
		h3{text-align: center;text-align: center;width: 100px;color: #000;font-family: "微软雅黑";
				font-size: 20px;position: absolute;margin-top: -16px;margin-left: 61px;}
		#top{width:1024px;margin:0 auto;height: 121px;}
		#shu{width:100px;height:101px;}
		#top #nav{width: 1024px; height: 108px;line-height: 50px}
		#top #nav img{width: 43px;height: 43px;margin-top: 14px;margin-left: 45px;}
		#top #nav #nav_sp {display: block; margin-top: -49px; margin-left: 92px;}
		#top #main_nav{height: 40px;background-color: #fff;text-align: center;line-height: 40px;}
		#top #main_nav #a1{border: 1px solid #ece;width: 60px;height: 30px;display: block;
						background-color: #8deafc;border-radius: 12px;line-height: 30px;margin-top: 3px;margin-left: 363px;}
		#top #main_nav #ullist{width: 600px; height: 50px; margin-top: -27px;margin-left: 570px;}
		#top #main_nav #ullist a{text-decoration: none;color:blue;}
		#top #main_nav li{display: block;float:left;padding-left: 19px;}
		#top #main_nav #curuser{width: 400px;height: 25px;margin-top: -48px;margin-left: 170px;
						font-family: "宋体";font-size: 15px;position: absolute;}
		#top #main_nav #insearch{margin-left: -318px;width: 580px;border-radius: 8px;margin-top: -54px;
						position: absolute;height: 32px;border: 2px solid #c91006;}
		#top #main_nav #seacher{ background-color: rgb(255, 255, 255);width: 32px;height: 32px;margin-top: -55px;
						margin-left: 262px;position: absolute;}
		#top #main_nav #btn_img:hover{cursor:pointer;}
		#top #main_nav #btn_img{width: 32px;margin-left: 263px;margin-top: -55px;position: absolute;}				
		
		*{margin:0px;padding:0px;}
			body{font-size:14px;font-family:"微软雅黑";color:#666;background:#fff;margin: 0;}
			/* start timerbox */
			.box{width:100px;height:100px;border:0px solid #E2E2E2;border-radius:50%;position:absolute;margin-top: -117px;margin-left: 883px;}
			.box #radius{position:absolute;width:10px;height:10px;top:45px;left:45px;background:#111;border-radius:50%;}
			.box #hour{position:absolute;height:20px;width:4px;background:#111;left:48px;top:30px;transform-origin:bottom;}
			.box #min{position:absolute;height:30px;width:3px;background:green;left:48px;top:20px;transform-origin:bottom;}
			.box #sec{position:absolute;height:40px;width:2px;background:red;left:49px;top:10px;transform-origin:bottom;}
			.box ul li{list-style:none;background:#111;width:2px;height:5px;position:absolute;left:50px;
					transform-origin:center 50px;}
			.box ul li:nth-child(5n+1){height:15px;}
			/* timerbox end */
	</style>
	
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" >
		$(function(){
			$("#btn_img").bind("click", function(){
			var bookName = $("#insearch").val();
				if($.trim(bookName)==""){
					alert("请输入要搜索的书名")
				}else{
					window.location.href="/ShareBook/findBookByLikeName.action?bookName="+bookName;
				}
				
			});
		})
		
		
	</script>
   	<div id="top">
   		<div id="nav">
    		<img id ="imgsearch" alt="" src='<c:url value="/images/du.png"></c:url>' align="middle"/> 
    		<span id="nav_sp">绿色书籍网</span>
    	</div>
    	<h3>书籍类别</h3>
    	<div id="main_nav">
    			<form method="post">
					<input type="text"  id="insearch" placeholder="请输入要搜索的书名">
					<input type="button" id="seacher" value="">
    			</form>
    			<img id="btn_img" alt="" src="<c:url value="/images/search.jpg" />">
    			<div id="ullist">
	    			<ul>
	    				<li><a href="<c:url value="/userjsps/search.jsp"/>">高级搜索</a></li>
	    				<li><a href='<c:url value="/userjsps/personinfo.jsp"></c:url>'>个人中心</a></li>
	    				<li><a href='<c:url value="/findUserBooks.action"></c:url>'>我的书库</a></li>
	    				<li><a href='<c:url value="/quit.action"></c:url>'>退出</a></li>
	    			</ul>
    			</div>
    			<div id="curuser">欢迎您<span>：${user.nickName }</span>，感谢您的参与！</div>
    		</div>
   		<!--<img id="shu" alt="" src='<c:url value="/images/sz1.jpg"></c:url>'>
   		--><!-- start timerbox -->
			<div class="box">
				<ul id="kedu">
					<li></li>
				</ul>
				<div id="hour"></div>
				<div id="min"></div>
				<div id="sec"></div>
				<div id="radius"></div>
			</div>
		<!-- timerbox end -->

		<script type="text/javascript">
			(function() {
				//刻度对象
				var keduDom = document.getElementById("kedu");
				var html="";
				for (var i = 0; i < 60; i++) {
					html += "<li style='transform:rotate(" + (i * 6) + "deg)'></li>"
				}
				keduDom.innerHTML = html;

				//秒针旋转
				var secDom = document.getElementById("sec");
				var minDom = document.getElementById("min");
				var hourDom = document.getElementById("hour");
				function drawDate() {
					var date = new Date();
					var sec = date.getSeconds();
					var min = date.getMinutes() + sec / 60;
					var hour = date.getHours() + min / 60;
					secDom.style.transform = "rotate(" + sec * 6 + "deg)";
					minDom.style.transform = "rotate(" + min * 6 + "deg)";
					hourDom.style.transform = "rotate(" + hour * 30 + "deg)";
				}
				drawDate(); 
				setInterval(drawDate, 1000);
			})();
		</script>
   	</div>
  
