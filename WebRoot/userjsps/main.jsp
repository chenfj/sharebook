<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	
	-->
	
	<style>
		#content{width:1200px;margin:0 auto;}
		li{list-style: none;}
		a{text-decoration: none;}
		#left li{padding: 8px;}
		#content #left{width:200px;height:600px;float:left;background-color: #fff;}
		#content #left h3{text-align: center;}
		#content #left li a{color:#7E0000}
		#content #nav{height:50px;width:1200px;line-height: 50px}
		#content #nav img{width: 43px;height: 43px;margin-top: -10px;margin-left: 45px;}
		#content #main{width:1000px;height:600px;float:left;background-color: #ece;}
		#content #main #booklist ul .im{float: left;padding: 14px;}
		#clear1{clear: both;}
		#content #main #booklist a{display: block;}
		#content #main #booklist span{display: block;text-align: center;}
		#content #main #booklist #page{width: 550px; height: 25px;margin-left: 523px;margin-top: -4px;}
		#content #main #booklist #page li{list-style: none;display: block;float:left;padding: 6px;}
		#content #main #main_nav{height: 40px;background-color: #eff;text-align: center;line-height: 40px;}
		#content #main #main_nav #a1{border: 1px solid #ece;width: 60px;height: 30px;display: block;
						background-color: #8deafc;border-radius: 12px;line-height: 30px;margin-top: 3px;margin-left: 363px;}
		#content #main #main_nav #ullist{width: 600px; height: 50px; margin-top: -27px;margin-left: 71px;}
		#content #main #main_nav li{display: block;float:left;padding-left: 19px;}
		#content #main #main_nav #curtime{width: 400px;height: 25px;margin-top: -48px;margin-left: 653px;
						font-family: "宋体";font-size: 15px;}
		#content #main #main_nav #curuser{width: 400px;height: 25px;margin-top: -58px;margin-left: 670px;
						font-family: "宋体";font-size: 15px;}
		#content #main #main_nav #insearch{margin-left: -501px;width: 580px;border-radius: 8px;margin-top: -27px;
						position: absolute;height: 32px;border: 2px solid #c91006;}
		#content #main #main_nav #seacher{ margin-top: -27px;position: absolute; margin-left: 87px;color: rgb(103, 23, 19);
    					width: 60px;height: 31px;border-radius: 9px;border: 2px solid;background-color: rgb(255, 119, 52);}
		#content #bottom{}
	</style>
  </head>
  
  <body>
    <div id="content">
    	<div id="nav">
    		<img alt="" src='<c:url value="/images/du.png"></c:url>' align="middle"> 
    		绿色书籍网
    	</div>
    	<jsp:include page="left.jsp"></jsp:include>
    	<div id="main">
    		<div id="main_nav">
    			<form>
					<input type="text"  id="insearch">
					<input type="submit" id="seacher" value="搜索">
    			</form>
    			<div id="ullist">
	    			<ul>
	    				<li><a href="<c:url value="/userjsps/search.jsp"/>">高级搜索</a></li>
	    				<li><a href='<c:url value="/userjsps/personinfo.jsp"></c:url>'>个人中心</a></li>
	    				<li><a href='<c:url value="/userjsps/mybooks.jsp"></c:url>'>我的书库</a></li>
	    				<li><a href='<c:url value="/userjsps/index.jsp"></c:url>'>退出</a></li>
	    			</ul>
    			</div>
    			<div id="curtime">当前时间：<span>2015年11月9日23时45分34秒</span></div>
    			<div id="curuser">欢迎您<span>：小李广</span></div>
    		</div>
    		<div id="booklist">
    			<ul>
    				<li class="im"><a href="#"><img src='<c:url value="/book_image/20285763-1_b.jpg"></c:url>' /></a><span>交易类型：互换</span></li>
    				<li class="im"><a href="#"><img src='<c:url value="/book_image/20412979-1_b.jpg"></c:url>' /></a><span>交易类型：互换</span></li>
    				<li class="im"><a href="#"><img src='<c:url value="/book_image/20417467-1_b.jpg"></c:url>' /></a><span>交易类型：互换</span></li>
    				<li class="im"><a href="#"><img src='<c:url value="/book_image/20420983-1_b.jpg"></c:url>' /></a><span>交易类型：互换</span></li>
    				<li class="im"><a href="#"><img src='<c:url value="/book_image/20446562-1_b.jpg"></c:url>' /></a><span>交易类型：互换</span></li>
    				<li class="im"><a href="#"><img src='<c:url value="/book_image/20285763-1_b.jpg"></c:url>' /></a><span>交易类型：互换</span></li>
    				<li class="im"><a href="#"><img src='<c:url value="/book_image/20285763-1_b.jpg"></c:url>' /></a><span>交易类型：互换</span></li>
    			</ul>
    			<div id="clear1"></div>
    			<div id="page">
    				<ul>
    					<li><a href="#">首页</a></li>
    					<li><a href="#">上一页</a></li>
    					<li><a href="#">下一页</a></li>
    					<li><a href="#">尾页</a></li>
    					<li><span style="float:left;">共4页</span></li>
    					<li> 转到<input type="text" style="width: 32px;">页</li>
    					<li><a href="#">确定</a></li>
    				</ul>
    			</div>
    		</div>
    	</div>
    	<div id="bottom">
    	</div>
    </div>
  </body>
</html>
