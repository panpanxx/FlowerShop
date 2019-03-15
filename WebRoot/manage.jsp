<%@page import="domain.Promsg"%>
<%@ page import="dao.PromsgDao" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>管理界面</title>
<link rel="stylesheet" href="./css/manage.css" type="text/css">
</head>
  <%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
  response.setContentType("text/html;charset=utf-8");
   %>
   
   <%
  	PromsgDao daoi=new PromsgDao();
  	ArrayList list=daoi.findAll();
   %>
   
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
<h1 align="center">商品信息</h1>
	<form action="doremove.jsp" method="post">
		<!-- 用于存放选择的id，然后会随表单提交给服务器处理页面 -->
		<input type="hidden" name="id">
		<table align="center" border="" width="60%" class="altrowstable" id="alternatecolor">
			<tr>
				<td colspan="8" align="center">
					<a href="add.jsp">添加新信息</a>
				</td>
			</tr>
			<tr>
			    
				<th>Prodid</th>
				<th>Pname</th>
				<th>Price</th>
				<th>Stock</th>
				<th>Image</th>
				<th>Sort</th>
				<th>Pnamezhu</th>
				<th>action</th>
				
			</tr>
			 <%for(int i=0;i<list.size();i++){
				Promsg obj=(Promsg)list.get(i);%>


				
				<tr>
					
					<td><%=obj.getProdid()%></td>
					<td><%=obj.getPname()%></td>
					<td><%=obj.getPrice()%></td>
					<td><%=obj.getStock()%></td>
					<td><img src="<%=obj.getImage() %>" width="20" height="20"></td>
					<td><%=obj.getSort() %></td>
					<td><%=obj.getPnamezhu() %></td>
					<td>	<%-- <a href="doRemove.jsp?id=<%=obj.getId()%>">删除</a> --%>
						<a href="update.jsp?id=<%=obj.getId()%>">修改</a> 
						<input type="button" value="删除" onclick="myAction('<%=obj.getId()%>')"/>
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
