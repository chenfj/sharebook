<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>regist.html</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

<style type="text/css">
#content {
	margin: 0 auto;
	width: 1200px;
	height: 150px;
}

#content #title {
	width: 1200px;
	height: 150px;
}

#content #title #title1 {
	width: 1200px;
	height: 150px;
	text-align: center;
}

#content #title #logimg {
	width: 200px;
	height: 150px;
	width: 200px;
	float: left;
	margin-left: -946px;
	position: absolute;
}

#content #title #head {
	font-family: "宋体";
	font-size: 52px;
	color: #551A8B;
	float: left;
	height: 150px;
	line-height: 150px;
	width: 650px;
	margin-left: 367px;
}

#content #nav {
	width: 1200px;
	height: 30px;
	background-color: #bc3c1a;
}
#content #nav a{color: #fff;text-decoration: none;display: block;width: 100px;}
#content #nav #a1{color: #FFF;text-decoration: none;font-size: 20px;margin-left: 30px;}
#content #nav #a2{margin-top: -24px;margin-left: 1000px;}
#content #nav #a3{margin-top: -21px;margin-left: 1096px;}
#content #main #center {
	border: 1px;
	width: 1200;
	height: 450px;
	border: 1px solid;
	text-align: center;
	line-height: 450px;
}
#content #main #center #asked{width: 422px;height: 200px;text-align: center;margin: :0 auto;position: absolute;
	margin-top: -211px;margin-left: 588px;line-height: 200px;font-size: 51px;color: #bc3c1a;}	
#content #main #center #intro{width: 300px;height: 500px;margin-top: -431px;margin-left: 90px;}
#content #main #center #intro h5{width: 200px; height: 50px; line-height: 9px; margin-left: 57px; position: absolute; margin-top: -26px; font-size: 21px;}
#content #main #center #introwords{width: 300px; height: 200px; position: relative; margin-top: -187px; line-height: 36px;}
.css3gallery img {
	-webkit-transform: scale(0.8);
	/*Webkit: Scale down image to 0.8x original size*/
	-moz-transform: scale(0.8); /*Mozilla scale version*/
	-o-transform: scale(0.8); /*Opera scale version*/
	-webkit-transition-duration: 0.5s; /*Webkit: Animation duration*/
	-moz-transition-duration: 0.5s; /*Mozilla duration version*/
	-o-transition-duration: 0.5s; /*Opera duration version*/
	opacity: 0.7; /*initial opacity of images*/
	margin: 0 10px 5px 0; /*margin between images*/
}

.css3gallery img:hover {
	-webkit-transform: scale(1.1);
	/*Webkit: Scale up image to 1.2x original size*/
	-moz-transform: scale(1.1); /*Mozilla scale version*/
	-o-transform: scale(1.1); /*Opera scale version*/
	box-shadow: 0px 0px 30px gray;
	/*CSS3 shadow: 30px blurred shadow all around image*/
	-webkit-box-shadow: 0px 0px 30px gray; /*Safari shadow version*/
	-moz-box-shadow: 0px 0px 30px gray; /*Mozilla shadow version*/
	opacity: 1;
}

#main #center #asked a {
	-webkit-transform: scale(0.8);
	/*Webkit: Scale down image to 0.8x original size*/
	-moz-transform: scale(0.8); /*Mozilla scale version*/
	-o-transform: scale(0.8); /*Opera scale version*/
	-webkit-transition-duration: 0.5s; /*Webkit: Animation duration*/
	-moz-transition-duration: 0.5s; /*Mozilla duration version*/
	-o-transition-duration: 0.5s; /*Opera duration version*/
	opacity: 0.7; /*initial opacity of images*/
	margin: 0 10px 5px 0; /*margin between images*/
	text-decoration: none;
	color: #BC3C1A;
	
}

#main #center #asked  a:hover {
	-webkit-transform: scale(1.1);
	/*Webkit: Scale up image to 1.2x original size*/
	-moz-transform: scale(1.1); /*Mozilla scale version*/
	-o-transform: scale(1.1); /*Opera scale version*/
	box-shadow: 0px 0px 30px gray;
	/*CSS3 shadow: 30px blurred shadow all around image*/
	-webkit-box-shadow: 0px 0px 30px gray; /*Safari shadow version*/
	-moz-box-shadow: 0px 0px 30px gray; /*Mozilla shadow version*/
	opacity: 1;
}

</style>
</head>

<body>

	<div id="content">
		<div id=title>
			<div id="title1">
				<img id="logimg" alt="" src="<c:url value='/images/log.jpg'/>"
					align="middle">
				<div id="head">欢迎来到绿色书籍共享网</div>
			</div>
		</div>
		<div id="nav">
			<a href="#" id="a1">网站介绍</a><a id="a2" href="<c:url value='/userjsps/login.jsp'/>" >登录</a>
			<a id="a3" href="<c:url value='/userjsps/regist.jsp'/>">注册</a>
		</div>
		<div id="main">
			<div id="center">
				<div class="css3gallery" style="margin-top: 32px;margin-left: 410px;">
					 <img src="<c:url value='/book_image/20500255-1_b.jpg'/>" alt="css3 gallery" title="css3 gallery" />
					<img src="<c:url value='/book_image/23169892-1_b.jpg'/>" alt="css3 gallery" title="css3 gallery" />
					<img src="<c:url value='/book_image/20773347-1_b.jpg'/>" alt="css3 gallery"title="css3 gallery" />
				</div>
				<div id="asked"><a href="<c:url value='/userjsps/regist.jsp'/>" ><span >期待您的加入哦！</span></a></div>
				<div id="intro">
					<h5>求书者</h5>
					<img alt="" src='<c:url value="/images/qiuhu.jpg"></c:url>'><br>
					<div id="introwords">此网站纯属公益网站，专门为读者提供方便。在这里你可以跟任何人交换书籍，当然也不建议免您费赠送额哦！</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>

