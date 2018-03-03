<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <title>后台首页</title>
    <meta name="Keywords" content="关键字,关键字">
    <meta name="description" content="">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin/admin1.css">
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
	
	</script>
	<style type="text/css">
		#page{width: 550px;height: 25px;margin-left: 480px;}
		 #page li{list-style: none;display: block;float:left;padding: 6px;}
	</style>
</head>
<body>
    <div id="top"><h3>ShareBook后台管理</h3></div>
    <div id="center">
    	<jsp:include page="/public/admin_left.jsp"></jsp:include>
        <div class="toCheckBook_right">
            <h2>待审核图书列表</h2>
            <c:choose>
            	<c:when test="${empty pb.beanList}">
            		<span style="font-size:23px;display: block;margin-left: 350px;margin-top:90px;" >暂无待审核的图书！</span>
            	</c:when>
            	<c:otherwise>
            		<table>
                <tr>
                    <th>序号</th>
                    <th>书名</th>
                    <th>作者</th>
                    <th>主人</th>
                    <th>昵称</th>
                    <th>上传日期</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pb.beanList}" var="bookvo" varStatus="s">
                <tr>
                    <td>${s.count }</td>
                    <td>${bookvo.bookName }</td>
                    <td>${bookvo.author }</td>
                    <td>${bookvo.loginName }</td>
                    <td>${bookvo.nickName}</td>
                    <td><fmt:formatDate value="${bookvo.uploadTime }" pattern="yyyy-MM-dd"/></td>
                    <td>
                    	<a href='<c:url value="/agreeAddBook.action?bid=${bookvo.bid }&email=${bookvo.email }&bookName=${bookvo.bookName }"></c:url>'><button class="handle" type="button" id="agreeBtn" style="color:red;">同意</button>|</a>
                    	<a href='<c:url value="/notAgreeAddBook.action?bid=${bookvo.bid }&email=${bookvo.email }&bookName=${bookvo.bookName }"></c:url>'><button class="handle" type="button" id="refuseBtn" style="color:red;">拒绝</button></a>	
                    </td>
                </tr>
                </c:forEach>
            </table>
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
    </div>
    <div id="user">
            	当前用户:<span>${admin.loginName }</span>
    </div>
     <div id="exit">
      	<a href="/ShareBook/exitAdmin.action" style="text-decoration: none; margin-top: -826px;margin-left: 929px;; position: absolute; color: rgb(255, 255, 255);">退出</a>
      </div>
</body>
</html>