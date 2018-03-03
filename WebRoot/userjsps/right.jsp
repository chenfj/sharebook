<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
body {
	margin: 0px;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
}

/* #main {
	width: 960px;
	height: 600px;
	float: left;
	background-color: #ECE;
	margin-top: 20px;
	margin-left: 190px;
	position: absolute;
	padding-left: 46px;
	padding-top: 5px;
} */
#main #booklist{width:850px;height: 505px;margin-left: 27px;}
#main #booklist ul .im {
	float: left;
	padding: 14px;
	width: 200px;
	height: 200px;
    padding: 14px 24px;
}

#clear1 {
	clear: both;
}

#main {
	width: 800px;
	height: 550px;
	float: left;
	background-color: #ece;
	margin-top: 20px;
	margin-left: 175px;
	position: absolute;
}

#main #booklist a {
	display: block;
}

#main #booklist span {
	display: block;
	text-align: center;
}

#main #page {
	width: 550px;
	height: 25px;
	margin-left: 468px;
	padding-top: 10px;
}

#main #page li {
	list-style: none;
	display: block;
	float: left;
	padding: 6px;
}
#booklist ul img{width: 200px;height:200px;}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	/* $(function (){
		$.post(
				"/ShareBook/findAllUserBooks.action",
				function(data){
					
					var jsonData = eval("("+data+")");
					var bookul = $("#bookul");
					for(var i=0;i<jsonData.beanList.length;i++){
					alert()
						bookul.append("<li class='im'><a href=''><img src='"+jsonData.beanList[i].bookImg+"' /></a><span>"+jsonData.beanList[i].bookName+"</span></li>")
					}
					var pageul = $("#pageul");
					pageul.append();
					
					
				},"json"
			);
	}); */
</script>
<script type="text/javascript">
	function _go() {

		var pc = $("#pageCode").val();//获取文本框中的当前页码
		if (!/^[1-9]\d*$/.test(pc)) {//对当前页码进行整数校验
			alert('请输入正确的页码');
			return;
		}
		if (pc > ${pb.tp}) {//判断当前页码是否大于最大页
			alert('请输入正确的页码！');
			return;
		}
		location = "${pb.url}?pc=" + pc;

	}
</script>



<div id="main" style="width:800px;height: 505px">
	<div id="booklist">
		<ul>
		<c:choose>
			<c:when test="${ empty pb.beanList }">
			<li style="font-size: 24px; margin-top: 86px; margin-left: 289px;">抱歉！没有搜索到相关书籍</li>
			</c:when>
			<c:otherwise> 
				<c:forEach items="${pb.beanList }" var="bidtv">
				<li class="im"><a href='<c:url value="/findBooksBybid.action?bid=${bidtv.bid }"></c:url>' ><img
						src="/ShareBook/${bidtv.bookImg }" /></a>
						<c:choose>
							<c:when test="${bidtv.dealType==0}">
								<span>无条件交换</span>
							</c:when>
							<c:otherwise>
								<span>彼此交换</span>
							</c:otherwise>
						</c:choose>
				</li>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</ul>
		
		<div id="clear1"></div>
		<div id="page">
			<ul>
				<c:choose>
					<c:when test="${!empty record }">
						<li></li>
					</c:when>
					<c:otherwise>
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
					</c:otherwise>
				</c:choose>

			</ul>
		</div>
	</div>
	
</div>
