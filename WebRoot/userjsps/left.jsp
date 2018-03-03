<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<style type="text/css">
		body{margin-top: 0px;}
		{contentEditable="true"}
		li{list-style: none;}
		a{text-decoration: none;}
		#left li{width:100%;height:30px;padding:8px 0 8px 24px;line-height: 30px;}
		#left{width:150px;height:528px;float:left;background-color: #fff;margin-left: 23px;margin-top:20px;}
		#left li a{color:#7E0000}
		#left li a:hover{font-size: 21px;}
	</style>


    <div id="left">
    		<ul>
    			<c:forEach items="${categoryList }" var="category">
    			<li><a href='<c:url value="/findBooksByCategory.action?cid=${category.cid}"></c:url>'>${category.categoryName }</a></li>
    			</c:forEach>
    		</ul>
    	</div>
  
