<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<title>首页</title>
		<meta name="Keywords" content="关键字,关键字">
		<meta name="description" content="">
		<style type="text/css">
			*{margin:0px;padding:0px;}
			body{font-size:14px;font-family:"微软雅黑";color:#666;}
			#large{width:1024px;margin:0 auto;}
			/* start menu */
			#menu .items{width: 300px;margin-left: 393px;}
			#menu{width:1024px;height:65px;background:#27445C;position:relative;margin:0 auto;}
			#menu .logo{width:170px;height:63px;margin-left:52px;float:left;cursor:pointer;}
			#menu .items ul{width:600px;height:65px;float:left;cursor:pointer;margin-left: -180px;}
			#menu .items ul li{list-style:none;float:left;color:#FFF;font-size:33px;width:600px;height:65px;text-align:center;line-height:65px;}
			#menu .items ul li:first-child{background:#27445C}
			#menu .items ul li:hover{background:#27445C;}
			#menu .search{width:90px;height:30px;background:#223242;border-radius:15px;position:absolute;top:17px;right:230px;}
			#menu .search .content{width:30px;float:left;color:#7A8897;padding-left:15px;line-height:30px;outline:none;}
			#menu .search .icon{width:30px;height:30px;right:0px;position:absolute;float:left;}
			#menu .search .icon img{margin-left:0 auto;margin:4px 4px 0 0;}
			#menu .btn{width:100px;height:30px;float:right;margin-right:100px;margin-top:15px;}
			#menu .btn a{width:50px;height:30px;display:block;text-decoration:none;color:#B8C4CE;font-size:14px;float:
					left;text-align:center;line-height:30px;}
			#menu .btn a:hover{background:#34495E;color:#3498DB;}
			#home .title  items .upload :hover{cursor: pointer;}		
			/* menu end */

			/* start pic */
			#pic{width:1024px;margin:0 auto;}
			#pic .content{width:900px;height:350px;overflow:hidden;margin:0 auto;position:relative;}
			#pic ul{width:900px;height:350px;position:absolute;,margin:0 auto;}
			#pic ul li{float:left;}
			#pic .btn a img{display:none;}
			#pic .btn a.prev{width:90px;height:350px;display:block;position:absolute;top:65px;left: 133px;}
			#pic .btn a.next{width:90px;height:350px;display:block;position:absolute;top:65px;right:144px;}
			/* pic end */

			/* start home */
			#home{width:900px;margin:0 auto;}
			/* start home title */			
			#home .title{width:900px;height:45px;margin:30px auto 5px;display:block;}
			#home .title .upload:hover{cursor: pointer;}		
			#home .title .items{width:244px;height:40px;float:left;}
			#home .title .items ul li{float:left;margin:0 3px;list-style:none;font-size:14px;line-height:40px;}
			#home .title .items ul li:first-child{color:#3498DB;}
			#home .title .upload{width:169px;height:40px;background:#3499DA;float:right;text-align:center;line-height:40px;
					color:#F2E5EA;font-size:16px;border-radius:3px;}
			#home .title .info{width:427px;height:40px;background:#FFEDC7;line-height:40px;font-size:14px;float:right;
					padding:0 20px;margin-right:20px;border-radius:3px;color:#6B3612;}
			#home .title .info a{text-decoration:none;color:#6B3612;}
			#home .title .info a:hover{text-decoration:underline;}
			/* home title end */
			/* start home content */
			#home .content{width:900px;}
			#home .content .item{height:695px;}
			#home .content .item ul li{width:295px;height:337px;float:left;list-style:none;color:#9EAEBB;text-align:center;
					border-bottom:1px solid #EFF1F3;-webkit-transition-duration: 500ms;-moz-transition-duration: 500ms;
					-o-transition-duration: 0.5s;}
			#home .content .item ul li:hover{box-shadow:0 0 5px #666;-webkit-box-shadow:0 0 5px #666;
					-moz-box-shadow:0 0 5px #666;;opacity:1;}
			#home .content .item ul li .a_img{margin:10px auto;width:280px;height:210px;display:block;}
			#home .content .item ul li .a_name{width:280px;height:20px;text-decoration:none;color:#394A58;margin:10px 0;
					display:block;}
			#home .content .item ul li a img{margin-top:0px;}
			#home .content .item ul li a h3{text-align:left;margin-left:100px;}
			#home .content .item ul li span{width:50px;height:20px;margin:5px;display:block;float:left;}
			#home .content .item ul li .dealType{width:90px;height:20px;margin:5px;}
			#home .content .item ul li span img{vertical-align:middle;}
			#home .content .item ul li .original{width:34px;height:20px;background:#DFE5E9;color:#9EAEBB;line-height:20px;margin-left: 80px;}
			#home .content .item ul li .user{clear:both;width:75px;height:35px;display:block;color:#9EAEBB;margin-top: -11px;}
			#home .content .item ul li .user img{border-radius:50%;vertical-align:bottom;margin-top:10px;}
			#home .content .page{width:900px;height:40px;margin:0 auto;margin-bottom:15px;}
			#home .content .page ul li{float:left;list-style:none;width:40px;height:40px;background:#EFF2F5;margin-right:10px;
					color:#99A1A9;text-align:center;line-height:40px;font-size:16px;font-style:italic;font-weight:bold;
					border-radius:2px;}
			#home .content .page ul li:first-child{background:#2C3E50;color:#FFF;}
			#home .content .page ul .sureNum:hover{background:#2C3E50;color:#FFF;cursor:pointer;}
			#home .content .page ul #sure:hover{background:#2C3E50;cursor:pointer;}
			#home .content .page ul .next_page:hover{background:#2C3E50;cursor:pointer;}
			#home .content .page ul li.last_page{width:75px;}
			#home .content .page ul li.to_page{width:60px;text-align:left;text-indent:5px;background:#FFF;border:1px solid #EBEFF3;}
			#home .content .page ul li.to_page:hover{cursor:text;}
			#home .content .page ul li.next_page{width:160px;height:40px;text-align:left;float:right;margin-right:0;}
			#home .content .page ul li.next_page p{width:100px;float:left;text-indent:20px;}
			#home .content .page ul li.next_page img{float:left;margin:5px 0 0 10px;}
			/* home content end */
			/* home end */

			/* start comment */
			#comment_container{width:900px;height:1060px;border-top:1px solid #EFF2F5;}
			#comment{width:1000px;height:100%;margin:0 auto;}
			/* start comment content */
			#comment .content{width:745px;height:100%;float:left;border-right:1px solid #EFF2F5;margin-left: 61px;}
			#comment .content h1{height:36px;color:#5D6D7E;margin:20px 0;}
			#comment .content #conul{width:880px;height:906px;}
			#comment .content ul li{width:723px;height:150px;list-style:none;border-bottom:1px dashed #EFF2F5;}
			#comment .content ul li a{float:left;margin:10px 5px;}
			#comment .content ul li .icon img{width:25px;height:25px;border-radius:50%;}
			#comment .content ul li .text{float:left;width: 500px;height: 120px;margin:10px 10px;}
			#comment .content ul li .text a{margin:0;}
			#comment .content ul li .text p{line-height:22px;}
			#comment .content ul li .text p a{width:85px;height:19px;color:#8C98DB;}
			#comment .content ul li .text .date{color:#BDBDC5;margin-top:8px;font-size:12px;}
			#comment .menu{width:880px;height:40px;margin:30px 0;}
			#comment .menu ul li{width:40px;height:40px;float:left;margin:0 5px;font-size:16px;font-weight:bold;
					font-style: italic;text-align:center;line-height:40px;color:#99A1A7;background:#EFF2F5;border-radius:2px;border:none;}
			#comment .menu ul li:hover{background:#2C3E50;color:#FFF;cursor:pointer;}
			#comment .menu ul li:first-child{background:#2C3E50;color:#FFF;}
			#comment .menu ul li:last-child{float:right;}
			#comment .menu ul li.next_page{width:160px;height:40px;text-align:left;float:right;margin-right:10px;}
			#comment .menu ul li.next_page p{width:100px;float:left;text-indent:20px;}
			#comment .menu ul li.next_page img{float:left;margin:5px 0 0 10px;}
			/* comment content end */
			/* start comment member */
			#comment .member{width:157px;height:100%;float:left;}
			#comment .member h1{font-size:24px;line-height:1.5;margin:20px 15px;}
			#comment .member ul li{width:285px;height:76px;list-style:none;margin-left:10px;padding:12px 0;}
			#comment .member ul li a img{border-radius:50%;float:left;}
			#comment .member ul li .content{width:215px;height:60px;float:left;margin-left:9px;border:none;}
			#comment .member ul li .content h5{color:#3498DB;font-weight:normal;font-size:14px;}
			#comment .member ul li .content p{margin-top:3px;}
			#comment .member ul li .content p:last-child{color:#DBE8F3;}
			/* comment member end */
			/* comment end */
			/* start copyright */
			#copyright{width:1024;height:100px;background:#EFF2F5;padding:55px 0;}
			#copyright .content{width:1024px;height:100px;margin:0 auto;}
			#copyright .content .info{width:402px;height:80px;float:left;}
			#copyright .content .info a img{float:left;}
			#copyright .content .info .details{float:left;margin-left:20px;}
			#copyright .content .info .details h4{font-size:16px;font-weight:500;line-height:26px;}
			#copyright .content .info .details p{color:#BBC6CF;font-size:12px;line-height:20px;}
			#copyright .content .list{width:620px;height:100px;float:right;}
			#copyright .content .list .con{float:left;}
			#copyright .content .list .con .menu{width:500px;height:30px;text-align:right;}
			#copyright .content .list .con .menu a{margin-left:20px;line-height:30px;text-decoration:none;color:#85919B;}
			#copyright .content .list .con p{font-size:12px;color:#C5CCD3;}
			#copyright .content .list img{float:right;}
			/* copyright end */
		</style>
		<!-- <script type="text/javascript" src="js/jquery.js"></script> -->
		<script type="text/javascript"src="js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript">
			 $(function(){
			 var totalPage ="";
				/*图书初始化首页*/
				$
				.post(
						"/ShareBook/findLastNewBook.action",
						function(data) {
								var its =$(".item #itemul");
								for (var i = 0; i < data.length; i++) {
									its.append("<li><a href='/ShareBook/userjsps/regist.jsp' class='a_img'><img src='"+data[i].bookImg+"' width='280' height='210'></a><a href='' class='a_name' title='"+data[i].bookName+"'><h3><span class='dealType'>"+data[i].dealType+"</span></h3></a><span class='original'>主人:</span><span><a href='' class='user'><img src='"+data[i].headimg+"' width='20' height='20'/>"+data[i].nickName+"</a></span></li>");
									var d = $(".item #itemul li:eq("+i+") h3 .dealType");
									if(d.text()=="1"){
										d.text("彼此交换");
									}else{
										d.text("无条件交换");
									}  
								}
						}, "json");
					/*图书总页数*/	
					$
				.post(
						"/ShareBook/totalPagesBook.action",
						function(data) {
								totalPage = data;
								if(totalPage>=1){
									$(".page ul li:eq(4)").after("<li class='last_page'>...<span>"+totalPage+"</span></li>");
								}
						}, "json");	
						
				
				/*评论初始化首页*/
				$.post(
						"/ShareBook/findGreatRemark.action",
						function(data) {
								var its =$("#comment .content #conul");
								for (var i = 0; i < data.length; i++) {
									its.append("<li><a href='/ShareBook/userjsps/regist.jsp'><img src='images/comment11.gif' width='106' height='80' alt='评论'/></a><a href='' class='icon'><img src='"+data[i].headimg+"' width='25' height='25' alt='评论'/></a><div class='text'><h3>"+data[i].nickName+"</h3><p><a href=''>发表</a>: "+data[i].content+"</p><div class='date'>"+data[i].formalTime+"</div></div></li>");
								}
						}, "json");
				/*最新用户*/		
				$.post(
						"/ShareBook/findNewUser.action",
						function(data) {
								var its =$(".member ul");
								for (var i = 0; i < data.length; i++) {
									its.append("<li><a href='/ShareBook/userjsps/regist.jsp'><img src='images/user1.jpeg' width='60' height='60' alt='用户'/></a><div class='content'><h5>"+data[i].nickName+":</h5><p>"+data[i].address+"</p><p>来交换吧</p></div></li>");
								}
						}, "json");
				/*去注册吧超链接*/	
				$(".upload").bind("click", function(){
					window.location.href="/ShareBook/userjsps/regist.jsp"
				});
				/*图书页码翻页*/
				$(".sureNum").bind("click", function(){
					var pageNum = $(this).text();
					$
				.post(
						"/ShareBook/findSomeNewBook.action",
						{"pageNum":pageNum},
						function(data) {
								var its =$(".item #itemul");
								its.html("");
								for (var i = 0; i < data.length; i++) {
									its.append("<li><a href='/ShareBook/userjsps/regist.jsp' class='a_img'><img src='"+data[i].bookImg+"' width='280' height='210'></a><a href='' class='a_name' title='"+data[i].bookName+"'><h3><span class='dealType'>"+data[i].dealType+"</span></h3></a><span class='original'>主人:</span><span><a href='' class='user'><img src='"+data[i].headimg+"' width='20' height='20'/>"+data[i].nickName+"</a></span></li>");
									var d = $(".item #itemul li:eq("+i+") h3 .dealType");
									if(d.text()=="1"){
										d.text("彼此交换");
									}else{
										d.text("无条件交换");
									}  
								}
						}, "json");
				});
				/*输入页码翻页*/
				$("#sure").bind("click", function(){
					var inNum = $(".to_page").text();
					var regix=/^[1-9]{1,9}$/;
					if(regix.test(inNum)){
						if(inNum<=totalPage){
						$.post(
						"/ShareBook/findSomeNewBook.action",
						{"pageNum":inNum},
						function(data) {
								var its =$(".item #itemul");
								its.html("");
								for (var i = 0; i < data.length; i++) {
									its.append("<li><a href='/ShareBook/userjsps/regist.jsp' class='a_img'><img src='"+data[i].bookImg+"' width='280' height='210'></a><a href='' class='a_name' title='"+data[i].bookName+"'><h3><span class='dealType'>"+data[i].dealType+"</span></h3></a><span class='original'>主人:</span><span><a href='' class='user'><img src='"+data[i].headimg+"' width='20' height='20'/>"+data[i].nickName+"</a></span></li>");
									var d = $(".item #itemul li:eq("+i+") h3 .dealType");
									if(d.text()=="1"){
										d.text("彼此交换");
									}else{
										d.text("无条件交换");
									}  
								}
						}, "json");
						}else{
							alert("请输入有效的页码，小于"+totalPage);
						}
					}else{
						alert("请输入数字")
					}
				})
				/*图书下一页*/
				$(".next_page").bind("click", function(){
					$.post(
						"/ShareBook/nextPageBook.action",
						function(data) {
							if(data==0){
								alert("已是最后一页");
							}else{
								var its =$(".item #itemul");
								its.html("");
								for (var i = 0; i < data.length; i++) {
									its.append("<li><a href='/ShareBook/userjsps/regist.jsp' class='a_img'><img src='"+data[i].bookImg+"' width='280' height='210'></a><a href='' class='a_name' title='"+data[i].bookName+"'><h3><span class='dealType'>"+data[i].dealType+"</span></h3></a><span class='original'>主人:</span><span><a href='' class='user'><img src='"+data[i].headimg+"' width='20' height='20'/>"+data[i].nickName+"</a></span></li>");
									var d = $(".item #itemul li:eq("+i+") h3 .dealType");
									if(d.text()=="1"){
										d.text("彼此交换");
									}else{
										d.text("无条件交换");
									}  
								}
							}
								
						}, "json");
				});
				/*评论根据页码查看*/
				$(".remNum").bind("click",function(){
					var remNum = $(this).text();
					$.post(
						"/ShareBook/findSomeNewRemark.action",
						{"pageNum":remNum},
						function(data) {
								var its =$("#comment .content #conul");
								its.html(" ");
								for (var i = 0; i < data.length; i++) {
									its.append("<li><a href='/ShareBook/userjsps/regist.jsp'><img src='images/comment11.gif' width='106' height='80' alt='评论'/></a><a href='' class='icon'><img src='"+data[i].headimg+"' width='25' height='25' alt='评论'/></a><div class='text'><h3>"+data[i].nickName+"</h3><p><a href=''>发表</a>: "+data[i].content+"</p><div class='date'>"+data[i].formalTime+"</div></div></li>");
								}
						}, "json");
				});
				/*评论 根据下一页*/
				$(".menu .next_page").bind("click",function(){
					$.post(
						"/ShareBook/nextPageRemark.action",
						function(data) {
								var its =$("#comment .content #conul");
								its.html("");
								for (var i = 0; i < data.length; i++) {
									its.append("<li><a href='/ShareBook/userjsps/regist.jsp'><img src='images/comment11.gif' width='106' height='80' alt='评论'/></a><a href='' class='icon'><img src='"+data[i].headimg+"' width='25' height='25' alt='评论'/></a><div class='text'><h3>"+data[i].nickName+"</h3><p><a href=''>发表</a>: "+data[i].content+"</p><div class='date'>"+data[i].formalTime+"</div></div></li>");
								}
						}, "json");
				});
			});		
		</script>
	</head>
	<body>
		<div id="large">
		<!-- start menu -->
		<div id="menu">
			<div class="logo"><img src="images/log.png" width="170" height="65" alt="logo"/></div>
			<div class="items">
				<ul>
					<li>欢迎来到绿色书籍共享网</li>
					
				</ul>
			</div>
			<div class="btn">
				<a href="/ShareBook/userjsps/login.jsp">登录</a>
				<a href="/ShareBook/userjsps/regist.jsp">注册</a>
			</div>
		</div>
		<!-- menu end -->

		<!-- start pic -->
		<div id="pic">
			<div class="content">
				<ul>
					<li><a href="#"><img src="images/huan2.jpg" width="900" height="350" alt=""/></a></li>
					<li><a href="#"><img src="images/jing.jpg" width="900" height="350" alt=""/></a></li>
					<li><a href="#"><img src="images/03.jpg" width="900" height="350" alt=""/></a></li>
					<li><a href="#"><img src="images/s11.jpg" width="900" height="350" alt=""/></a></li>
					<li><a href="#"><img src="images/1.png" width="900" height="350" alt=""/></a></li>
					<li><a href="#"><img src="images/2.jpeg" width="900" height="350" alt=""/></a></li>
					<li><a href="#"><img src="images/7.jpeg" width="900" height="350" alt=""/></a></li>
				</ul>
			</div>
			<div class="btn">
				<a href="#" class="prev"><img src="images/prev.png" width="90" height="350" alt="上一张"/></a>
				<a href="#" class="next"><img src="images/next.png" width="90" height="350" alt="下一张"/></a>
			</div>
		</div>
		<!-- pic end -->

		<!-- start home -->
		<div id="home">
			<div class="title">
				<div class="items">
					<ul>
						<li>最近上传的书籍，去看看呗！</li>
						
					</ul>
				</div>
				<div class="upload">去注册吧</div>
				<div class="info">心灵鸡汤：<a href="#">知识因传播而美丽，心灵因交流而贴近~</a></div>
			</div>
			<div class="content">
				<div class="item">
					<ul id="itemul">
					</ul>
				</div>
				
				<div class="page">
					 <ul>
						<li class="sureNum">1</li>
						<li class="sureNum">2</li>
						<li class="sureNum">3</li>
						<li class="sureNum">4</li>
						<li class="sureNum">5</li>
						<li class="to_page" contenteditable="true"></li>
						<li id="sure">确定</li>
						<li class="next_page">
							<p>下一页</p>
							<img src="images/next_page.png" width="30" height="30" alt="下一页"/>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- home end -->

		<!-- start comment_container -->
		<div id="comment_container">
			<div id="comment">
				<div class="content">
					<h1>精彩评论</h1>
					<ul id="conul">
						
					</ul>
					 <div class="menu">
						<ul>
							<li class="remNum">1</li>
							<li class="remNum">2</li>
							<li class="remNum">3</li>
							<li class="remNum">4</li>
							<li class="remNum">5</li>
							<li class="next_page">
								<p>下一页</p>
								<img src="images/next_page.png" width="30" height="30" alt="下一页">
							</li>
						</ul>
					</div> 
				</div>
				<div class="member">
					<h1>欢迎新用户</h1>
					<ul>
					</ul>
				</div>
			</div>
		</div>
		<!-- comment_container end -->

		<!-- start copyright -->
		<div id="copyright">
			<div class="content">
				<div class="info">
					<a href="#"><img src="images/log2.png" width="100" height="80" alt="图标"></a>
					<div class="details">
						<h4>共享知识  交换书籍平台</h4>
						<p>公益平台，国内最早的换书平台!</p>
						<p>为爱好读者提供最好的服务而不断努力着!</p>
					</div>
				</div>
				<div class="list">
					<div class="con">
						<div class="menu">
							<a href="#">小米主题学院</a>
							<a href="#">原讨论组</a>
							<a href="#">商务合作</a>
							<a href="#">问题反馈</a>
							<a href="#">关于我们</a>
						</div>
						<p>京ICP备14007358号-1 \ 京公网安备11010802014104号 \ Powered by © 2008-2015 UI.CN</p>
					</div>
					<img src="images/qrcode.png" width="100" height="100" alt="二维码"/>
				</div>
			</div>
		</div>
		</div>
		<!-- copyright end -->

		<!-- javascript -->

		<script type="text/javascript">
			var islaunch = 0;
			$(".search").click(function() {
				if (islaunch == 0) {
					$(this).css({"width":"200px", "background":"#FFF"});
					$(this).find(".content").css("width","120px");
					$(this).find(".content").text("");
					islaunch = 1;
				}	
			});
			$("#pic .btn a").mouseover(function() {
				$(this).find("img").css("display", "block");
			}).mouseout(function() {
				$(this).find("img").css("display", "none");
			});
			 $("#pic .btn a.prev img").click(function() {
				$("#pic .content ul").prepend($("#pic .content ul li:last"));
				$("#pic .content ul").css("left", "-1180px");
				 $("#pic .content ul").animate({"left" : "0px"}, 1000);
			});
			$("#pic .btn a.next img").click(imgNext);
			function imgNext() {
				 $("#pic .content ul").animate({"left" : "-1180px"}, 1000, function() {
					$("#pic .content ul").append($("#pic .content ul li:first"));
					$("#pic .content ul").css("left", "0px");
				}); 
			}
			 var autoPlay = setInterval(imgNext, 5000);
			$("#pic .content ul").hover(function() {
				clearInterval(autoPlay);
			}, function() {
				autoPlay = setInterval(imgNext, 2000);
			});
		</script>
		<!-- javascript -->

	</body>
</html>
