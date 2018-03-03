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
		#content{width:1024px;margin:0 auto;}
		#content #bookimg{height: 350px;width:350px;float:left;margin-top: 30px;margin-left: 157px;}
		#content #bookimg #im{height: 350px;width:350px;float:left;}
		#content #detail{width: 600px;height: 350px;float: left;margin-top: -326px; margin-left: 424px; position: relative; padding-left: 163px;}
		#content #detail #table1 { font-family: "微软雅黑";font-size: 15px;}
		#content #detail #table1 td{height: 35px;}
		#content #detail #table1 td a{text-decoration:none;color:#9D141C;font-size: 16px;font-family: "宋体";font-weight: 700;}
		#clear{clear: both;}
		#content #link{width: 120px;height: 50px;margin-top: -12px;margin-left: 187px;font-size: 26px;font-family: "宋体";color: red;}
		#content #link a{text-decoration: none;}
		.remark {margin-left: 137px;}
		.remark ul li{list-style:none;margin:10px 0;padding:15px;}
        .remark ul li .userimg{width:100px;height:100px;float:left;border-radius:50%;}
       	.remark ul li .userimg img{width: 100px;height: 100px;border-radius: 50%;}
        .remark ul li .center{width:150px;height:80px;float:left;padding:10px;}
        .remark ul li .right{float: left;border: 2px solid #eee;width: 600px;height: 90px;padding: 5px 20px;border-radius: 7px;}
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
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
		function findRemarks(bid){
		
					$.post(
					"/ShareBook/findMyBookRemarks.action",
					{"bid":bid},
					function(data){
						if(data.length>0){
							$(".remark ul").html("");
							for(var i=0;i<data.length;i++){
								$(".remark ul").append("<li><div class='userimg'><img src='"+data[i].headimg+"' width='' height='' alt=''/></div><div class='center'><p class='nickname'>昵称:<span>"+data[i].nickName+"</span></p><p class='date'><span>"+data[i].formalTime+"</span></p></div><div class='right'><p>"+data[i].content+"</p></div><div class='clear'></div></li>");
						    }
						}else{
							$(".remark ul").append("<li>暂无评论，快去评论吧！</li>")
						}
						 
					},"json"
				);
		}
		
		function deployRemark(bid){
			var content = $(".myremark .content").text();
			if(content.length==0||content.length>=250){
				alert("内容不能为空或不能超过250个字哦")
				return false;
			}else{
				$.post(
					"/ShareBook/addRemarks.action",
					{"bid":bid,"content":content},
					function(data){
						if(data>0){
							$(".remark ul").append("<li><div class='userimg'><img src='${user.headimg}' width='' height='' alt=''/></div><div class='center'><p class='nickname'>昵称:<span>${user.nickName}</span></p><p class='date'>发表时间:<span>2015-5-5</span></p></div><div class='right'><p>"+content+"</p></div><div class='clear'></div></li>");
						}else{
							$(".remark .title").append("<span>发表失败</span>");
						}
						 
					},"json"
				);
				
			
			}
		}
	</script>
  </head>
  
  <body>
  	<jsp:include page="head.jsp"></jsp:include>
    <div id="content">
    	<div id="bookimg">
    		<img id="im" alt="" src='<c:url value="/${book.bookImg }"/>'>
    	</div>
	    <div id="detail">
	   		<table id="table1">
	   			<tr><td>书名：</td><td>${book.bookName }</td></tr>
	   			<tr><td>作者：</td><td>${book.author }</td></tr>
	   			<tr><td>出版日期：</td><td> <fmt:formatDate value="${book.publishTime }" pattern="yyyy-MM-dd"/> </td></tr>
	   			<tr><td>上传日期：</td><td><fmt:formatDate value="${book.uploadTime }" pattern="yyyy-MM-dd"/></td></tr>
	   			<tr><td>版次：</td><td>${book.edition }</td></tr>
	   			<tr><td>交易类型：</td><td>
	   				<c:choose>
	   					<c:when test="${book.dealType==0 }">无条件交换</c:when>
	   					<c:otherwise>彼此交换</c:otherwise>
	   				</c:choose>
	   			</td></tr>
	   			<tr><td>图书状态：</td><td style="color:red">${book.dealState }</td></tr>
	   			<tr><td colspan="1">主人联系方式：</td><td>${user.phone }</td></tr>
	   		</table>
	    </div>
	    <div id="clear"></div>
	    <div id="link"><a href="javascript:findRemarks(${book.bid })">与我相关</a></div>
	    <div class="remark">
            <ul>
               
            </ul>
        </div>
        <div class="myremark">
        	
	            <div class="title">我的评论</div>
	            <div class="content" contenteditable="true"></div>
	            <div class="btn">
	                <button type="button"  onclick="return deployRemark(${book.bid });">发表</button>
	            </div>
          
        </div>
    </div>
    	<jsp:include page="buttom.jsp"></jsp:include>
  </body>
</html>
