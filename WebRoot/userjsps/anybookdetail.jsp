<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<link rel="stylesheet" href="css/style.css" media="screen" />
<script src="js/jquery-1.7.1.js"></script>
<script type="text/javascript">
</script>
<style>
#content {width: 1200px;margin: 0 auto;}
#content #bookimg {height: 350px;width: 350px;float: left;margin-top: 30px;margin-left: 138px;}
#content #bookimg #im {height: 350px;width: 350px;float: left;}
#content #detail {width: 600px;height: 350px;float: left;margin-top: -363px;margin-left: 524px;position: relative;}

#content #detail #table1 {font-family: "微软雅黑";font-size: 15px;}
#content #detail #table1 td {height: 35px;}
#content #detail #table1 td a {text-decoration: none;color: #9D141C;font-size: 16px;font-family: "宋体";font-weight: 700;}
#clear {clear: both;}

.remark {margin-left: 137px;}
.remark ul li {	list-style: none;margin: 10px 0;padding: 15px;}
.remark ul li .userimg {width: 100px;height: 100px;float: left;border-radius: 50%;}
.remark ul li .userimg img {width: 100px;height: 100px;border-radius: 50%;}
.remark ul li .center {width: 150px;height: 80px;float: left;padding: 10px;}
.remark ul li .right {float: left;border: 2px solid #eee;width: 600px;height: 90px;padding: 5px 20px;border-radius: 7px;font-size: 15px;}
.remark ul li .clear {clear: both;}
.myremark {width: 600px;height: 230px;margin: 0 auto;}
.myremark .title {width: 100%;height: 40px;border: 2px solid #959491;font-size: 20px;line-height: 40px;text-indent: 20px;background: #4876FF;color: #FFF;}
.myremark .content {border: 2px solid #959491;border-top: none;width: 570px;height: 129px;padding: 15px 15px;font-size: 16px;overflow: scroll;}
.myremark .btn {width: 100%;height: 30px;}
.myremark .btn button {width: 50px;height: 30px;float: right;background: #4876FF;color: #FFF;border: none;cursor: pointer;margin-right: -4px;}
.myremark .btn button:hover {background: #CCC;color: #111;}

.relative a {margin-left: 200px;font-size: 23px;text-decoration: none;font-family: "宋体";color: rgb(157, 20, 28);}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function findRemarks(bid) {

		$
				.post(
						"/ShareBook/findMyBookRemarks.action",
						{
							"bid" : bid
						},
						function(data) {
							if (data.length > 0) {
								$(".remark ul").html("");
								for (var i = 0; i < data.length; i++) {
									$(".remark ul")
											.append(
													"<li><div class='userimg'><img src='"+data[i].headimg+"' width='' height='' alt=''/></div><div class='center'><p class='nickname'>昵称:<span>"
															+ data[i].nickName
															+ "</span></p><p class='date'><span>"+data[i].formalTime+"</span></p></div><div class='right'><p>"
															+ data[i].content
															+ "</p></div><div class='clear'></div></li>");
								}

							}else{
								$(".remark ul").append("<li id='noremark'>暂无评论，快去评论吧！</li>")
							}

						}, "json");
	}

	function deployRemark(bid) {
		var content = $(".myremark .content").text();
		if (content.length == 0 || content.length >= 105) {
			alert("内容不能为空或不能超过250个字哦")
			return false;
		} else {
			$
					.post(
							"/ShareBook/addRemarks.action",
							{
								"bid" : bid,
								"content" : content
							},
							function(data) {
								if (data > 0) {
								var bjElement=$("#noremark");
      							bjElement.remove();
									$(".remark ul")
											.append(
													"<li><div class='userimg'><img src='${user.headimg}' width='' height='' alt=''/></div><div class='center'><p class='nickname'>昵称:<span>${user.nickName}</span></p><p class='date'>发表时间:<span>2015-5-5</span></p></div><div class='right'><p>"
															+ content
															+ "</p></div><div class='clear'></div></li>");
															
													
								} else {
									$(".remark .title").append(
											"<span>发表失败</span>");
								}

							}, "json");

		}
	}
	$(function(){
		$("#pichuan .row1").click(function(){
		var picIndex=$("#pichuan .row1").index($(this));
		$(".parinforma").hide();
		$("#pichuan").hide();
		$(".parinforma").eq(picIndex).slideDown("normal");
	})
	
	$("#teamcont .closebtn").click(function(){
		$(".parinforma").hide();
		$("#pichuan").show();
})
	
	})
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
				<tr>
					<td>书名：</td>
					<td>${book.bookName }</td>
				</tr>
				<tr>
					<td>作者：</td>
					<td>${book.author }</td>
				</tr>
				<tr>
					<td>出版社：</td>
					<td>${book.press }</td>
				</tr>
				<tr>
					<td>出版日期：</td>
					<td><fmt:formatDate value="${book.publishTime }"
							pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<td>上传日期：</td>
					<td><fmt:formatDate value="${book.uploadTime }"
							pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<td>图书类别：</td>
					<td>${book.category.categoryName }</td>
				</tr>
				<tr>
					<td>版次：</td>
					<td>${book.edition }</td>
				</tr>
				<tr>
					<td>交易类型：</td>
					<td><c:choose>
							<c:when test="${book.dealType==0 }">无条件交换</c:when>
							<c:otherwise>彼此交换</c:otherwise>
						</c:choose></td>
				</tr>
				<tr><td>图书状态：</td><td style="color: red">${book.dealState }</td></tr>
				<tr>
					<td colspan="1">主人联系方式：</td>
					<td>${user.phone }</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="pichuan">
							<div class="partener">
								<div class="row1">
									<a href="javascript:void(0)">主人详情</a>
								</div>
								<div class="pinfo"></div>
							</div>
							<div style="clear:both"></div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div id="teamcont">
		<div style="width:600px;margin: 221px 258px 0px; text-align:center">
			<div class="parinforma cssshadow" style="margin-left: -221px;">
				<div class="closebtn"></div>
				<div class="showLeft">
					<div class="partener">
						<img class="row1" src="${book.user.headimg }" />
						<div class="pname">主人头像</div>
						<div class="pinfo"></div>
					</div>
				</div>
				<div class="showRight">
					<div class="huncontent">
						<table width=300px; height=150px;>
							<tr>
								<td>主人昵称：</td>
								<td>${book.user.nickName}</td>
							</tr>
							<tr>
								<td>主人email：</td>
								<td>${book.user.email}</td>
							</tr>
							<tr>
								<td>主人地址：</td>
								<td>${book.user.address}</td>
							</tr>
							<tr>
								<td>主人电话：</td>
								<td>${book.user.phone}</td>
							</tr>
						</table>
					</div>
				</div>
				<div style="clear:both"></div>
			</div>
		</div>
	</div>
		<div id="clear"></div>
		<div class="relative">
			<a href="javascript:findRemarks(${book.bid })" style="color:red">相关评论</a>
		</div>
		<div class="remark">
			<ul>

			</ul>
		</div>
		<div class="myremark">

			<div class="title">我要评论</div>
			<div class="content" contenteditable="true"></div>
			<div class="btn">
				<button type="button" onclick="return deployRemark(${book.bid });">发表</button>
			</div>
		</div>
	</div>
	
		<jsp:include page="buttom.jsp"></jsp:include>

	 <div
		style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
	</div>
</body>
</html>
