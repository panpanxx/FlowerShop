<%@ page language="java" import="java.util.*,dao.PromsgDao" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%

	request.setCharacterEncoding("UTF-8");
	PromsgDao dao=new PromsgDao();
	int id=Integer.parseInt(request.getParameter("id"));
	String msg="操作出问题了,请稍后重试,或联系管理员";
	if(dao.remove(id)){
		msg="恭喜你,操作成功,成功删除"+id+"的数据";
	}
	//response.sendRedirect是重定向
	//重定向会让我们的浏览器显示指定的页面,但是对于用户来说无法得知操作是否成功(只能通过查看显示的页面效果来判断)
	//除了重定向以外还有3种提示效果
	
	//1.弹出对话框,等待用户确认消息后再继续前往下一个页面
	//2.显示信息,在一段时间后自动前往下一个页面
	//response.sendRedirect("index.jsp");
 %>
<%--
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="manage.jsp";
</script>
 --%>
<%--
JSP是一个多种代码混杂的编写环境,其中包括的代码可以分为服务器端代码和客户端代码
所谓的服务器端代码是指运行在服务器环境中,由服务器负责解析和执行的代码,在JSP中Java代码就是服务器端代码
而其他的HTML,JS,CSS等代码都是客户端代码,是由浏览器来解析和执行
从请求响应模式的流程来说，是先执行服务器代码,然后执行客户端代码
在这个执行过程中不会去考虑混杂在一起后的先后顺序问题
简单的说,就是执行Java代码的时候,HTML,JS等代码是完全忽略的
而执行HTML,JS等代码的时候,Java代码早已执行完毕，所有Java代码的地方已经变成运行后的结果
 --%>
<%//response.sendRedirect("index.jsp"); %>
<!-- 2.显示信息,在一段时间后自动前往下一个页面 -->
<%-- 
<html>
	<head>
		<meta http-equiv="refresh" content="5;index.jsp">
	</head>
</html>
<h1><%=msg%>,5秒后返回首页,如浏览器无反应,<a href="manage.jsp">请点击</a></h1>
--%>
<div id="msg"><h1><%=msg%>,5秒后返回首页,如浏览器无反应,<a href="manage.jsp">请点击</a></h1></div>
<script type="text/javascript">
	var count=4;
	window.setInterval(function(){
		if(count==0){
			location.href="manage.jsp";
		}
		var div_msg=document.getElementById("msg");
		div_msg.innerHTML="<h1><%=msg%>,"+count+"秒后返回首页,如浏览器无反应,<a href='manage.jsp'>请点击</a></h1>"
		count--;
	}, 1000);
</script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>

  </body>
</html>
