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
			$(".addCategory").bind("click", function(){
				window.location.href="/ShareBook/adminjsps/addCategory.jsp";
			});
			$(".returnCategory").bind("click", function(){
				window.location.href="/ShareBook/findAllCategory.action";
			});
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
			<button class="addCategory" type="button">继续添加</button>
			<button class="returnCategory" type="button">返回列表</button>
            <h2>添加类别</h2>
            <form id="cform" action="/ShareBook/addCategory.action" method="post" >
            <table>
                <tr><td>类别名称</td><td><input type="text" name="category" id="category"></td></tr>
                 <tr>
                    <td colspan="2">
                        <button class="handle" type="button">保存</button>
                    </td>
                 </tr>
            </table>
            </form>
            <div id="mes">${cateMsg }</div>
            
        </div>
    </div>
    <div id="user" style="margin-top: -200px">
            	当前用户:<span>${admin.loginName }</span>
     </div>
      <div id="exit">
      	<a href="/ShareBook/exitAdmin.action" style="text-decoration: none; margin-top: -826px;margin-left: 929px;; position: absolute; color: rgb(255, 255, 255);">退出</a>
      </div>
</body>
</html>