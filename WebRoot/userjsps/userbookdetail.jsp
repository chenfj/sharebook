<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bookdetail.jsp' starting page</title>
    
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
		#content #bookimg{height: 350px;width:350px;float:left;margin-top: 30px;margin-left: 138px;}
		#content #bookimg #im{height: 350px;width:350px;float:left;}
		#content #detail{width: 600px;height: 350px;float: left;margin-top: -326px;
				margin-left: 524px;position: relative;}
		#content #detail #table1 { font-family: "微软雅黑";font-size: 15px;}
		#content #detail #table1 td{height: 35px;}
		#content #detail #table1 td a{text-decoration:none;color:#9D141C;font-size: 16px;font-family: "宋体";font-weight: 700;}
		#clear{clear: both;}
		
		.remark ul li{list-style:none;margin:10px 0;padding:15px;}
        .remark ul li .userimg{width:100px;height:100px;border:1px solid red;float:left;border-radius:50%;}
        .remark ul li .center{width:150px;height:80px;float:left;padding:10px;}
        .remark ul li .right{float:left;border:1px solid red;width:650px;height:90px;padding:5px 20px;}
        .remark ul li .clear{clear:both;}

        .myremark{width:600px;height:230px;margin:0 auto;}
        .myremark .title{width:100%;height:40px;border:2px solid #959491;font-size:20px;
                line-height:40px;text-indent:20px;background:#4876FF;color:#FFF;}
        .myremark .content{border:2px solid #959491;border-top:none;width:570px;height:129px;padding:15px 15px;font-size:16px;overflow:scroll;}
        .myremark .btn{width:100%;height:30px;}
        .myremark .btn button{width:50px;height:30px;float:right;background:#4876FF;color:#FFF;
                border:none;cursor:pointer;margin-right:-4px;}
        .myremark .btn button:hover{background:#CCC;color:#111;}
	</style>
  </head>
  
  <body>
    <div id="content">
    	<div id="bookimg">
    		<img id="im" alt="" src='<c:url value="/book_image/23169892-1_w.jpg"/>'>
    	</div>
	    <div id="detail">
	   		<table id="table1">
	   			<tr><td>书名：</td><td>${book.bookName }</td></tr>
	   			<tr><td>作者：</td><td>${book.author }</td></tr>
	   			<tr><td>出版日期：</td><td> <fmt:formatDate value=" ${book.publishTime }" pattern="yyyy-MM-dd"></fmt:formatDate> </td></tr>
	   			<tr><td>上传日期：</td><td><fmt:formatDate value=" ${book.uploadTime }" pattern="yyyy-MM-dd"></fmt:formatDate> </td></tr>
	   			<tr><td>版次：</td><td>${book.edition }</td></tr>
	   			<tr><td>交易类型：</td><td>
	   				<c:choose>
	   					<c:when test="${book.dealType==0 }">无条件交换</c:when>
	   					<c:otherwise>彼此交换</c:otherwise>
	   				</c:choose>
	   			</td></tr>
	   			<tr><td colspan="2"><a href="#">主人详情：</a></td></tr>
	   			<tr><td colspan="2"><a href='<c:url value='/userjsps/userinfo.jsp'></c:url>'>主人资料详情</a></td></tr>
	   		</table>
	    </div>
	    <div id="clear"></div>
	    <div>相关评论</div>
	    <div class="remark">
            <ul>
                <li>
                    <div class="userimg">
                        <img src="" width="" height="" alt=""/>
                    </div>
                    <div class="center">
                        <p class="nickname">昵称:<span>无赖</span></p>
                        <p class="date">发表时间:<span>2015-5-5</span></p>
                    </div>
                    <div class="right">
                        <p>网易126免费邮箱--你的专业电子邮局。14年邮箱运营经验，系统快速稳定，垃圾邮件拦截率超过98%，邮箱容量自动翻倍，支持高达3G超大附件，提供免费网盘及手机 ...</p>
                    </div>
                    <div class="clear"></div>
                </li>
                <li>
                    <div class="userimg">
                        <img src="" width="" height="" alt=""/>
                    </div>
                    <div class="center">
                        <p class="nickname">昵称:<span>无赖</span></p>
                        <p class="date">发表时间:<span>2015-5-5</span></p>
                    </div>
                    <div class="right">
                        <p>发表内容</p>
                    </div>
                    <div class="clear"></div>
                </li>
                <li>
                    <div class="userimg">
                        <img src="" width="" height="" alt=""/>
                    </div>
                    <div class="center">
                        <p class="nickname">昵称:<span>无赖</span></p>
                        <p class="date">发表时间:<span>2015-5-5</span></p>
                    </div>
                    <div class="right">
                        <p>发表内容</p>
                    </div>
                    <div class="clear"></div>
                </li>
            </ul>
        </div>
        <div class="myremark">
        	<form action="#" method="post">
	            <div class="title">我的评论</div>
	            <div class="content" contenteditable="true"></div>
	            <div class="btn">
	                <button type="submit">发表</button>
	            </div>
            </form>
        </div>
    </div>
  </body>
</html>
