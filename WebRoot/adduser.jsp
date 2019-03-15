<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>添加用户信息</title>
<link rel="stylesheet" href="./css/back.css" type="text/css">  

  </head>
   <script type="text/javascript">
  	function myBack(){
  		//将浏览器导航为index.jsp,location.href属性可以更改当前浏览器地址栏的内容
  		location.href="um.jsp";
 		//window.location.href="index.jsp";
 
  	}
  	//mySubmit方法用于提交表单，并且在提交之前验证表单数据的格式是否符合要求
  	function mySubmit(){
  		//先来个简单的,验证姓名必须有填写，不能为空
  		//首先获取姓名输入框的数据
  		//document是文档对象，代表整个HTML页面
  		//forms是表单集合，如果存在多个表单的话,索引从0开始，并且是从上往下编号   如果表单有表单名可以用<span style="font-family:FangSong_GB2312;"><strong>document.表单名.控件名.value </strong></span>
  		//user_name是表单下控件的名字
  		//value是获取这个控件的value值
  		//length是一个属性，返回长度
  		//var是变量，JavaScript是弱类型语言,也就是说不区分int,double,Object这些类型
  		//而是统一使用var表示
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
  		document.forms[0].submit();//submit是提交方法
  	}
  </script>
  <body>
  <div class="header">
  <div id="title"><p>roseonly管理系统<p></div>
  </div>
  <div class="content">
    <h1 align="center">新增信息</h1>
	<form action="adduserservelet" method="post" >
		<table align="center" width="50%">
			<!-- 编号 -->
			<tr>
				<td align="right" width="37%">Username:</td>
				<td align="left" width="25%"><input type="text" name="username" ></td> 
				<td>
					<div id="username_msg" align="left"></div>
				</td>
			</tr>

	<tr>
				<td align="right" width="37%">Password:</td>
				<td align="left" width="25%"><input type="text" name="password" ></td> 
				<td>
					<div id="password_msg" align="left"></div>
				</td>
			</tr>
			
			<!-- 按钮 -->
			<tr>
				<td align="center" colspan="3">
					<input type="button" value="添加" onclick="mySubmit()">
					    
					<input type="button" value="返回"  onclick="myBack()">
				</td>
			</tr>
		</table>
	</form>
   </div> 

  </body>
</html>
