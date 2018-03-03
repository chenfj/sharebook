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
		#content #nav{height:50px;width:1200px;text-align:center; background-color: #eee;}
		#content #left{width:200px;height:600px;float:left;background-color: #dfdfdf;}
		#content #left h3{text-align: center;}
		#content #main{width:1000px;height:600px;float:left;background-color: #ece;}
		#content #main #booklist ul .im{float: left;padding: 14px;}
		#clear1{clear: both;}
		#content #main #booklist a{display: block;}
		#content #main #booklist span{display: block;text-align: center;}
		#content #main #booklist #page{width: 550px; height: 25px;}
		#content #main #booklist #page li{list-style: none;display: block;float:left;padding: 6px;}
		#content #main #main_nav{height: 40px;background-color: #eff;text-align: center;line-height: 40px;}
		#content #main #main_nav #a1{border: 1px solid #ece;width: 60px;height: 30px;display: block;
						background-color: #8deafc;border-radius: 12px;line-height: 30px;margin-top: 3px;margin-left: 400px;}
		#content #main #main_nav #ullist{width: 600px; height: 50px; margin-top: -55px; margin-left: 275px;}
		#content #main #main_nav li{display: block;float:left;padding-left: 40px;}
		#content #main #main_nav #curuser{width: 200px;height: 25px;margin-top: -48px;margin-left: 768px;
						font-family: "宋体";font-size: 15px;}
		#content #main #main_nav #insearch{margin-left: -567px;}
		#content #bottom{}
	</style>
  </head>
  
  <body>
    <div id="content">
    	<div id="nav">
    		<%-- <img alt="" src='<c:url value="/images/wel.jpg"></c:url>'> --%>
    		绿色书籍网
    	</div>
    	<div id="left">
    		<h3>书籍类别</h3>
    		<ul>
    			<li><a href="#">计算机技术</a></li>
    			<li><a href="#">哲学类</a></li>
    			<li><a href="#">教科类</a></li>
    			<li><a href="#">励志类</a></li>
    			<li><a href="#">经典著作</a></li>
    			<li><a href="#">少儿读物</a></li>
    			<li><a href="#">生活休闲类</a></li>
    			<li><a href="#">经济管理</a></li>
    			<li><a href="#">其他</a></li>
    		</ul>
    	</div>
    	<div id="main">
    		<div id="main_nav">
    			<form>
					<input type="text"  id="insearch">
					<input type="submit" value="搜索">
    			</form>
    			<div id="ullist">
	    			<ul>
	    				<li><a href="<c:url value="/userjsps/search.jsp"/>">高级搜索</a></li>
	    				<li><a href='<c:url value="/userjsps/personinfo.jsp"></c:url>'>个人中心</a></li>
	    				<li><a href='<c:url value="/userjsps/mybooks.jsp"></c:url>'>我的书库</a></li>
	    				<li><a href='<c:url value="/userjsps/index.jsp"></c:url>'>退出</a></li>
	    			</ul>
    			</div>
    			<div id="curuser">当前用户：<span>张小溪</span></div>
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
