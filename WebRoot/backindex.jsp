<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 <style type="text/css">
.header{
width: 100%;
background: #414141;
line-height:50px;
height:50px;
}
#title{
color:#666;
}
#title p{
text-align:center;
font-weight:bolder;
font-size:30px;

}
.content{
height:600px;
width:100%
}
.menuy{
float:left;
width:15%;
height:600px;
background-color:#414141;
}
.menuy ul{
list-style:none;
}
.menuy ul li{
height:30px;
line-height:30px;
background-color:#414141;
}
.menuy ul a{
text-decoration:none;
display:block;
text-align:center;
color:white;
}
.menuy ul a:hover{
color:#F3F3F3;
background-color:gray;
}
.show{
width:85%;
height:600px;
margin-left:25%;
}
.footer p{
text-align:center;
}

</style>

  </head>
  
  <body>
     <div class="header">
  <div id="title"><p>roseonly管理系统<p></div>
  </div>
  <div class="content">
  <div class="menuy">
  <ul>
  <li><a href="backindex.jsp">首页</a></li>
  <li><a href="um.jsp">用户管理</a></li>
  <li><a href="manage.jsp">商品管理</a></li>
  <li><a href="">订单管理</a></li>
  <li><a href="">系统设置</a></li>
  </ul>  
  </div>
  <div class="show">欢迎进入后台管理系统 ！</div>
  </div>
  <div style="width: 100%;height:1px;background: #484848;clear: both; "></div>
  <div class="footer">
  <p>京ICP备13007738号 京公网安备11010502023922
www.roseonly.com.cn；诺誓（北京）商业股份有限公司</p>
  </div>
  </body>
</html>
