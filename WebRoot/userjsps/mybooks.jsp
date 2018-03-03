<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mybooks.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		#mybook{width:1000px;margin:50px auto;}
		#mybook #top_img{width: 413px;height: 88px;display: block;margin-top: 0;margin-left: 400px;}
		#mybook #my{height: 88px;width: 100px;line-height: 88px;margin-top: -91px;position: absolute;
				margin-left: 192px;font-size: 25px;color: #620D0D;}
		#mybook #operate{width:480px;height:35px;margin-left: 77px;margin-top:23px}
		#mybook #operate li{list-style: none; float: left;line-height: 35px;}
		#mybook #operate li{width:83px;height:35px;overflow: hidden;cursor: pointer;}
		#mybook #operate #add{}
		#icon_empty{width: 260px;height: 170px;margin-top: 75px;margin-left: 230px;}
		#icon_empty span{display: block;width: 235px;height: 150px;line-height: 150px;margin-top: -154px;margin-left: 257px;font-size: 22px;font-family: "宋体";}
		#mybook #operate #edit{margin-left: -80px;}
		#mybook #operate #see{margin-left: -240px;}
		#mybook #operate #del{margin-left: -160px;}
		#mybook #operate #return{background: rgb(245, 248, 249) none repeat scroll 0% 0%; height: 33px; border: 1px solid #D3DBDE;cursor: pointer;}
		#mybook #blist{width: 800px;margin: 0 auto;}
		#mybook #btable{width: 800px;height: 400px;margin-top: 16px;font-family: "宋体";font-size: 15px;}
		#mybook #btable td{text-align: center;}
		#mybook #page{width: 550px;height: 25px;margin-left: 519px;}
		#mybook #page li{list-style: none;display: block;float:left;padding: 6px;}
	</style>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
	function _go() {
	
		var pc = $("#pageCode").val();//获取文本框中的当前页码
		if(!/^[1-9]\d*$/.test(pc)) {//对当前页码进行整数校验
			alert('请输入正确的页码');
			return;
		}
		if(pc > ${pb.tp}) {//判断当前页码是否大于最大页
			alert('请输入正确的页码！');
			return;
		}
		location = "${pb.url}?pc=" + pc;
		
	}
	function goModifyBook(){
		var itemElements=document.getElementsByName("manybox");
			var params = new Array();
			var j=0;
			for(var i = 0;i<itemElements.length;i++){
				var itemElement = itemElements[i];
				if(itemElement.checked){
					params[j]=itemElement.value;
					//alert(params[j]);
					//alert(params.length)
					j++;
				}
			}
			if(params.length>1||params.length==0){
				alert("请选择一条记录修改");
			}else{
				window.location.href='<c:url value="/modifyBookPage.action?params="/>'+params;
			}
		
	}
	function goSeeBook(){
		var itemElements=document.getElementsByName("manybox");
			var params = new Array();
			var j=0;
			for(var i = 0;i<itemElements.length;i++){
				var itemElement = itemElements[i];
				if(itemElement.checked){
					params[j]=itemElement.value;
					//alert(params[j]);
					//alert(params.length)
					j++;
				}
			}
			if(params.length>1||params.length==0){
				alert("请选择一条记录查看");
			}else{
				window.location.href='<c:url value="/findBookPage.action?params="/>'+params;
			}
	}
	function goDelBook(){
		var itemElements=document.getElementsByName("manybox");
			var params = new Array();
			var j=0;
			for(var i = 0;i<itemElements.length;i++){
				var itemElement = itemElements[i];
				if(itemElement.checked){
					params[j]=itemElement.value;
					j++;
				}
			}
			if(params.length==0){
				alert("请选择要删除的记录");
			}else{
				if(window.confirm("您确定要删除"+j+"条记录吗?")){
					window.location.href='<c:url value="/delSomeBook.action?params="/>'+params;
				}
			}
	}
	function deal_state(bid,obj){
	    var dealState = obj.value
		var flag = window.confirm("您确定要更改状态为:"+dealState+"吗？");
		if(flag){
			$.post(
					"/ShareBook/changDealState.action",
					{"bid":bid,"dealState":dealState},
					function(data){
						alert(data);
					},"json"
				);
		}
	}
	
	</script>
  </head>
  
  <body>
  	<jsp:include page="head.jsp"></jsp:include>
    <div id="mybook">
    	<div id="top_img">
    		<img alt="" src='<c:url value="/images/sj1.jpg"></c:url>'>
    	</div>
    	<div id="my" >我的书架</div>
    	<div id="operate">
    		<ul>
    			<li><a href='<c:url value="/userjsps/addBook.jsp"/>'><img id="add" src='<c:url value="/images/lab4.png"/>'/></a></li>
    			<li><a onclick="goModifyBook();" ><img id="edit" src='<c:url value="/images/lab4.png"/>' /></a></li>
    			<li><a onclick="goSeeBook();" ><img id="see" src='<c:url value="/images/lab4.png"/>'/></a></li>
    			<li><a onclick="goDelBook();" ><img id="del" src='<c:url value="/images/lab4.png"/>'/></a></li>
    			<li><a href="userjsps/myIndexHome.jsp"><button id="return">返回首页</button></a></li>
    		</ul>
    	</div>
    	<c:choose>
    	<c:when test="${empty pb.beanList }">
    		<div id="icon_empty"><img alt="" src="images/icon_empty.png"><span>暂无宝贝，快去添加吧</span></div>
    	</c:when>
    	<c:otherwise>
    	<div id="blist">
    		<table id="btable">
    			<tr><td>请选择</td><td>序号</td><td>书名</td><td>作者</td><td>出版社</td><td>上传时间</td><td>图书状态</td></tr>
    			<c:forEach items="${pb.beanList }" var="book" varStatus="s">
    			<tr><td><input type="checkbox" name="manybox" value="${book.bid }"/><input type="hidden" value="${book.bid }"></td><td>${s.count }</td><td>${book.bookName }</td><td>${book.author }</td><td>${book.press }</td><td><fmt:formatDate value="${book.uploadTime }" pattern="yyyy-MM-dd"/></td><td><select id="deal_state" onchange="deal_state(${book.bid},this)"><option value="${book.dealState }" selected="selected">${book.dealState }</option><option value="已借出">已借出</option></select></td></tr>
    			</c:forEach>
    		</table>
    	</div>
    	<div id="page">
    		<ul>
    			<c:choose>
					<c:when test="${pb.pc eq 1 }"><li><a href="${pb.url }?pc=${pb.pc}" >首页</a></li></c:when>
					<c:otherwise><li><a href="${pb.url }?pc=${pb.pc-1}" >上一页</a></li></c:otherwise>
				</c:choose>
    			
    			<c:choose>
					<c:when test="${pb.pc eq pb.tp }"><li><a href="${pb.url }?pc=${pb.pc}" >尾页</a></li></c:when>
					<c:otherwise><li><a href="${pb.url }?pc=${pb.pc+1}" >下一页</a></li></c:otherwise>
				</c:choose>
    			
    			<li><span style="float:left;">第${pb.pc }/${pb.tp}页</span></li>
    			<li> 转到<input type="text" style="width: 32px;" id="pageCode">页</li>
    			<li><a href="javascript:_go();" class="aSubmit">确定</a></li>
    		</ul>
    	</div>
    	</c:otherwise>
    	
    	
    	</c:choose>
    </div>
    <!-- <div style="float: left;"><img alt="" src="images/lianxi2.png"></div> -->
    <jsp:include page="buttom.jsp"></jsp:include>
  </body>
</html>
