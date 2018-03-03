<%@ page pageEncoding="UTF-8" %>
<div class="left">
    <ul>
        <li><a href="<%=request.getContextPath()%>/findAllUsers.action">用户管理</a></li>
        <li><a href="<%=request.getContextPath()%>/findAllCategory.action">类别管理</a></li>
        <li><a href="<%=request.getContextPath()%>/findAllBooks.action">图书管理</a></li>
        <li><a href="<%=request.getContextPath()%>/findAllRemarks.action">评论管理</a></li>
        <li><a href="<%=request.getContextPath()%>/findNotAgreeBook.action">待审核图书管理</a></li>
    </ul>
</div>