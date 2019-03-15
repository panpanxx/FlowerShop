<%@ page language="java" import="java.util.*,dao.*,domain.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	request.setCharacterEncoding("UTF-8");
	int id=Integer.parseInt(request.getParameter("id"));
	PromsgDao dao=new PromsgDao();
	Promsg obj=dao.findById(id);
 %>

<html>
  <head>
    
    <title>更新商品信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="./css/back.css" type="text/css">
<style type="text/css">
</style>
  </head>
 <script type="text/javascript">
  	function myBack(){
  		location.href="manage.jsp";
  	}
  
  	function mySubmit(){
  		var pd=document.forms[0].prodid;
  		var prodid_msg=document.getElementById("prodid_msg");
  		prodid_msg.innerHTML="";
  		if(pd.value.length==0){
  			prodid_msg.innerHTML="<font color='red'>*编号为必填项</font>";
  			pd.focus();
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
	<form action="updateservelet" method="post" >
		<input type="hidden" name="id" value="<%=obj.getId()%>">
		<table align="center" width="50%">
			<!-- 姓名 -->
			<tr>
				<td align="right" width="37%">Prodid:</td>
				<td align="left" width="25%"><input type="text" name="prodid" value="<%=obj.getProdid()%>" ></td> 
				<td>
					<div id="prodid_msg" align="left"></div>
				</td>
			</tr>

	<tr>
				<td align="right" width="37%">Pname:</td>
				<td align="left" width="25%"><input type="text" name="pname" value="<%=obj.getPname()%>" ></td> 
				<td>
					<div id="pname_msg" align="left"></div>
				</td>
			</tr>
	<tr>
				<td align="right" width="37%">Price:</td>
				<td align="left" width="25%"><input type="text" name="price" value="<%=obj.getPrice()%>" ></td> 
				<td>
					<div id="price_msg" align="left"></div>
				</td>
			</tr>
	<tr>
				<td align="right" width="37%">Stock:</td>
				<td align="left" width="25%"><input type="text" name="stock" value="<%=obj.getStock()%>" ></td> 
				<td>
					<div id="stock_msg" align="left"></div>
				</td>
			</tr>
			<tr>
				<td align="right" width="37%">Sort:</td>
				<td align="left" width="25%"><input type="text" name="sort" value="<%=obj.getSort()%>" ></td> 
				<td>
					<div id="sort_msg" align="left"></div>
				</td>
			</tr>
			<tr>
				<td align="right" width="37%">Pnamezhu:</td>
				<td align="left" width="25%"><input type="text" name="pnamezhu" value="<%=obj.getPnamezhu()%>" ></td> 
				<td>
					<div id="pnamezhu_msg" align="left"></div>
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
