<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'head.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
	
		#menu .items{width: 300px;margin-left: 393px;}
			#menu{width:1024px;height:81px;background:#27445C;position:relative;margin:0 auto;}
			#menu .logo{width:170px;height:63px;margin-left:52px;float:left;cursor:pointer;}
			#menu .items ul{width:600px;height:65px;float:left;cursor:pointer;margin-left: -224px;margin-top: 8px;}
			#menu .items ul li{list-style:none;float:left;color:#FFF;font-size:33px;width:600px;height:65px;text-align:center;line-height:65px;}
			#menu .items ul li:first-child{background:#27445C}
			#menu .items ul li:hover{background:#27445C;}
			#menu .search{width:90px;height:30px;background:#223242;border-radius:15px;position:absolute;top:17px;right:230px;}
			#menu .search .content{width:30px;float:left;color:#7A8897;padding-left:15px;line-height:30px;outline:none;}
			#menu .search .icon{width:30px;height:30px;right:0px;position:absolute;float:left;}
			#menu .search .icon img{margin-left:0 auto;margin:4px 4px 0 0;}
			#menu .btn{width:100px;height:30px;float:right;margin-right:100px;margin-top: 43px;}
			#menu .btn a{width:50px;height:30px;display:block;text-decoration:none;color:#B8C4CE;font-size:14px;float:
					left;text-align:center;line-height:30px;}
			#menu .btn a:hover{background:#34495E;color:#3498DB;}
			#home .title  items .upload :hover{cursor: pointer;}		
		</style>
  </head>
  
  <body style="margin: 0px auto;">
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
  </body>
</html>
