<%@page import="domain.Promsg"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   

  </head>
  
  <body>
    <br>
    <table border="1">
<tr>
<td>Name</td>
<td>Street</td>
<td>City</td>
<td>State</td>
<td>Zip</td>
<td><center>Options</center></td>
<tr>
<%
List<Promsg> list = (List<Promsg>)request.getAttribute("list");
for(Promsg a :list){
%>
<tr>
<td><%=a.getProdid()%></td>
<td><%=a.getPname() %></td>
<td> <%=a.getPrice()%></td>
<td><%=a.getStock()%></td>
<td>
<a href="AddressServlet?method=delete&id=<%=a.getId() %>">Delete</a>&nbsp;
<a href="AddressServlet?method=toedit&id=<%=a.getId() %>">Edit</a>
</td>

</tr>
<%}%>
</table>
<a href="">Add</a>
    
  </body>
</html>
