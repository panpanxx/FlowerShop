<%@ page language="java" import="java.util.*,dao.umDao,domain.User" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	request.setCharacterEncoding("UTF-8");
	int id=Integer.parseInt(request.getParameter("id"));
	umDao dao=new umDao();
	User obj=dao.findById(id);
 %>

<html>
  <head>
    
    <title>更新用户信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="./css/back.css" type="text/css">
  </head>
 <script type="text/javascript">
  	function myBack(){
  		location.href="um.jsp";
  	}
  
  	function mySubmit(){
  		var un=document.forms[0].username;
  		var pw=document.forms[0].password;
  		var password_msg=document.getElementById("password_msg");
  		password_msg.innerHTML="";
  		var username_msg=document.getElementById("username_msg");
  		username_msg.innerHTML="";
  		if(un.value.length==0){
  			username_msg.innerHTML="<font color='red'>*用户名为必填项</font>";
  			un.focus();
  			return ;
  		}
  		if(pw.value.length==0){
  			password_msg.innerHTML="<font color='red'>*密码为必填项</font>";
  			pw.focus();
  			return ;
  		}
  		
  		
  		document.forms[0].submit();
  	}
  </script>
  
  <body>
  <div class="header">
  <div id="title"><p>roseonly管理系统<p></div>
  </div>
  <div class="content">
   <h1 align="center">修改信息</h1>
	<form action="userupdateservelet" method="post" >
		<input type="hidden" name="id" value="<%=obj.getId()%>">
		<table align="center" width="50%">
			<!-- 姓名 -->
			<tr>
				<td align="right" width="37%">Username:</td>
				<td align="left" width="25%"><input type="text" name="username" value="<%=obj.getUsername()%>" ></td> 
				<td>
					<div id="username_msg" align="left"></div>
				</td>
			</tr>

	<tr>
				<td align="right" width="37%">Password:</td>
				<td align="left" width="25%"><input type="text" name="password" value="<%=obj.getPassword()%>" ></td> 
				<td>
					<div id="password_msg" align="left"></div>
				</td>
			</tr>


			
			<!-- 按钮 -->
			<tr>
				<td align="center" colspan="3">
					<input type="button" value="修改" onclick="mySubmit()">
					    
					<input type="button" value="返回"  onclick="myBack()">
				</td>
			</tr>
		</table>
	</form>
   </div>
  </body>
</html>
