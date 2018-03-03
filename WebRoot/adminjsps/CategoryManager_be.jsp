<%@ page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		$(function(){
			$(".addCategory").bind("click", function(){
				window.location.href="adminjsps/addCategory.jsp";
			});
		})
	</script>
</head>
<body>
    <div id="top"><h3>ShareBook后台管理</h3></div>
    <div id="center">
    	<jsp:include page="/public/admin_left.jsp"></jsp:include>
        <div class="category_right">
			<button class="addCategory" type="button">添加分类</button>
            <h2>分类列表</h2>
            <table>
                <tr>
                    <th>序号</th>
                    <th>类别名称</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${categoryList }" var="category" varStatus="s">
                <tr>
                    <td>${s.count }</td>
                    <td>${category.categoryName }</td>
                    <td>
                        <a href='<c:url value="/findCategoryById.action?cid=${category.cid }"/>'><button class="handle" type="button" style="color:red">修改</button></a>
                    </td>
                </tr>
                </c:forEach>
            </table>
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