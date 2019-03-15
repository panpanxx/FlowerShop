<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="domain.User"%>
<%@page import="dao.umDao" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <link rel="stylesheet" href="./css/manage.css" type="text/css">
  </head>
   <script type="text/javascript">
   	function myAction(pid){
   		document.forms[0].id.value=pid;
   		document.forms[0].submit();
   	}
   	function altRows(id){
	if(document.getElementsByTagName){  
		
		var table = document.getElementById(id);  
		var rows = table.getElementsByTagName("tr"); 
		 
		for(i = 0; i < rows.length; i++){          
			if(i % 2 == 0){
				rows[i].className = "evenrowcolor";
			}else{
				rows[i].className = "oddrowcolor";
			}      
		}
	}
}

window.onload=function(){
	altRows('alternatecolor');
}
   	
   </script>
   <%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
  response.setContentType("text/html;charset=utf-8");
   %>
   
   <%
  umDao userdao=new umDao();
  ArrayList list = userdao.findAll();
   %> 
  <body>
   <div class="header">
  <div id="title"><p>roseonly管理系统<p></div>
  </div>
  <div class="content">
  <div class="menuy">
  <ul>
  <li><a href="home.jsp">首页</a></li>
  <li><a href="um.jsp">用户管理</a></li>
  <li><a href="manage.jsp">商品管理</a></li>
  <li><a href="">订单管理</a></li>
  <li><a href="">系统设置</a></li>
  </ul>  
  </div>
<div class="show">
<h1 align="center">用户信息</h1>
	<form action="douserremove.jsp" method="post">
		<!-- 用于存放选择的id，然后会随表单提交给服务器处理页面 -->
		<input type="hidden" name="id">
		<table align="center" border="" width="60%" class="altrowstable" id="alternatecolor">
			<tr>
				<td colspan="3" align="center">
					<a href="adduser.jsp">添加新信息</a>
				</td>
			</tr>
			<tr>
			    
				<th>Username</th>
				<th>Password</th>
				<th>Action</th>
				
			</tr>
			 <%for(int i=0;i<list.size();i++){
				User obj1=(User)list.get(i);%>


				
				<tr>
					
					<td><%=obj1.getUsername()%></td>
					<td><%=obj1.getPassword()%></td>
					
					
					
					<td>
						<%-- <a href="doRemove.jsp?id=<%=obj.getId()%>">删除</a> --%>
						<a href="userupdate.jsp?id=<%=obj1.getId()%>">修改</a> 
						<input type="button" value="删除" onclick="myAction('<%=obj1.getId()%>')"/>
					</td>
				</tr>

			<%}%>

		</table>
	</form>

  
  </div>
  </div>
  <div style="width: 100%;height:1px;background: #484848;clear: both; "></div>
  <div class="footer">
  <p>京ICP备13007738号 京公网安备11010502023922
www.roseonly.com.cn；诺誓（北京）商业股份有限公司</p>
  </div>
  </body>
</html>
