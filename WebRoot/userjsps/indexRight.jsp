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
#main #booklist{width:850px;height: 500px;margin-left: 27px;}
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
	margin-left: 580px;
	position: absolute;
	padding-top:0px;
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
	 $(function (){
		/* $.post(
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
			); */
			 $.post(
				"/ShareBook/findLastNewBook.action",
				function(data){
				var data1 = eval("("+data+")");
					var bookul = $("#bookul");
					for(var i=0;i<data1.length;i++){
						bookul.append("<li class='im'><a href='/ShareBook/findBooksBybid.action?bid="+data1[i].bid+"'><img src='"+data1[i].bookImg+"' /></a><span>"+data1[i].dealType+"</span></li>")
						var d = $("#bookul li:eq("+i+") span");
									if(d.text()=="1"){
										d.text("彼此交换");
									}else{
										d.text("无条件交换");
									}  
					}
				},"json"
			); 
			
	});
</script>

<div id="main" style="width:800px">
	<div id="booklist">
		<ul id="bookul">
		</ul>

		<div id="clear1"></div>
	</div>
	
</div>

