<%@ page pageEncoding="UTF-8" %>
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
			
			$(".handle").bind("click", function(){
				if($.trim($("#category").val())==""){
				 alert("请填写类别名称");
				}else{
					$("#cform").submit()	;			
				}
			});
			
		})
	</script>
</head>
<body>
    <div id="top"><h3>ShareBook后台管理</h3></div>
    <div id="center">
    	<jsp:include page="/public/admin_left.jsp"></jsp:include>
        <div class="category_right">
			<button class="addCategory" type="button">返回列表</button>
            <h2>修改类别名称</h2>
            <form id="cform" action="/ShareBook/modifyCategory.action" method="post" >
            <input type="hidden" value="${category.cid }" name="cid">
            <table>
                <tr><td>类别名称</td><td><input type="text" name="category" id="category" value="${category.categoryName }"></td></tr>
                 <tr>
                    <td colspan="2">
                        <button class="handle" type="button">保存</button>
                    </td>
                 </tr>
            </table>
            </form>
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