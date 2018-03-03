<%@ page pageEncoding="UTF-8" %>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <title>后台首页</title>
    <meta name="Keywords" content="关键字,关键字">
    <meta name="description" content="">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin/admin1.css">
	<script type="text/javascript" src="/ShareBook/js/jquery.js"></script>
	<script type="text/javascript">
		/* $(function(){
			$(".bookImg").bind("mouseover", function(){
				alert($(this).children().value);
			})
		}) */
		
		function delBook(bid){
			var flag = window.confirm("您确定要删除一条记录吗？");
			if(flag){
				window.location.href="/ShareBook/delAdminBook.action?bid="+bid;
			}
		}
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
        <div class="book_right">
            <h2>图书列表</h2>
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
                <c:forEach items="${pb.beanList}" var="book" varStatus="s">
                <tr>
                    <td>${s.count }</td>
                    <td class="bookImg">${book.bookName }<input type="hidden" value="${book.bookImg }"></td>
                    <td>${book.author }</td>
                    <td>${book.loginName }</td>
                    <td>${book.nickName}</td>
                    <td><fmt:formatDate value="${book.uploadTime }" pattern="yyyy-MM-dd"/></td>
                    <td><a style="cursor: pointer;color:red;" onclick="delBook(${book.bid})">删除</a></td>
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