<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>用户注册</title>
	<link rel="stylesheet" href="./css/headbo.css" type="text/css">
<link rel="stylesheet" href="./css/reg.css" type="text/css">
		<script type="text/javascript">
window.onload=function(){
  //验证用户名
   var username1=document.getElementById("username");
  username1.onchange=function(){
     var check; 
     var username = document.getElementById("username").value;
     if (username.length > 18 || username.length < 2) { 
       alert("用户名输入不合法，请重新输入！");
	  document.getElementById("checkt1").innerHTML="错误，请重新输入！";
    document.getElementById("checkt1").style.color="red";
       document.getElementById("username").focus();
       check = false; 
      }
	  else { 
       document.getElementById("checkt1").innerHTML = "* 用户名由2-18位字符组成 √"; 
       document.getElementById("checkt1").style.color="green";
       check = true; 
      } 
      return check; 
    } 
  //判断密码符合否
  var password1  =document.getElementById("password")
    password1.onchange=function(){ 
    var check; 
    var password = document.getElementById("password").value; 
    if (password.length < 6 || password.length > 18 ) { 
      alert("密码输入不合法，请重新输入！");
       document.getElementById("checkt2").innerHTML="错误，请重新输入！";
    document.getElementById("checkt2").style.color="red";
      document.getElementById("password").focus();
      check = false; 
    } else { 
      document.getElementById("checkt2").innerHTML = "* 密码由6-18位字符组成 √";
      document.getElementById("checkt2").style.color="green"; 
      check = true; 
    } 
    return check; 
  } 
   
//验证密码
  var cpsw1  =document.getElementById("cpsw")
    cpsw1.onchange=function() { 
    var check; 
    var password = document.getElementById("password").value; 
    var cpsw = document.getElementById("cpsw").value; 
    if (password != cpsw) { 
      alert("两次输入密码不一致，请重新输入！");
       document.getElementById("checkt3").innerHTML="错误，请重新输入！";
    document.getElementById("checkt3").style.color="red";
      document.getElementById("cpsw").focus();
      check = false; 
    } else { 
      document.getElementById("checkt3").innerHTML = "* 请再次输入你的密码 √";
      document.getElementById("checkt3").style.color="green"; 
      check = true; 
    } 
    return check; 
  }
  //提交时验证用户类别
  var seluser1  =document.getElementById("seluser")
    seluser1.onblur=function(){
    var check; 
    if(document.getElementById("seluser").selectedIndex == 0)
      {
        alert("请选择用户类型！");
         document.getElementById("checkt4").innerHTML="错误，请重新输入！";
    document.getElementById("checkt4").style.color="red";
        document.getElementById("seluser").focus();
        check = false; 
      }else{
        document.getElementById("checkt4").innerHTML = "* 请选择用户类型 √";
        document.getElementById("checkt4").style.color="green"; 
        check = true; 
      }
    return check;  
  }
 //验证电子邮件（及时）
  var email1  =document.getElementById("email")
    email1.onchange=function(){
    var check; 
    var e1 = document.getElementById("email").value.indexOf("@",0);
    var e2 = document.getElementById("email").value.indexOf(".",0);
    if(email == "" || (e1==-1 || e2==-1) || e2<e1 )
    {
      alert("E_mail输入错误!");
       document.getElementById("checkt8").innerHTML="错误，请重新输入！";
    document.getElementById("checkt8").style.color="red";
      document.getElementById("email").focus();
      check = false;
    } else { 
      document.getElementById("checkt8").innerHTML = "* 请填写常用的EMAIL，将用于密码找回 √";
      document.getElementById("checkt8").style.color="green"; 
      check = true; 
    } 
    return check; 
  } 
};
  

	    </script>
	</head>
<body>
<div class="header">
  <div class="head">
      <ul class="left">
      <li><a href="home.jsp">首页</a></li>
      <li>香烛</li>
      <li>见证</li>
      </ul>
      <ul class="right">
      <li><a href="login.jsp">登录</a><span class="h_line">|</span></li>
      <li><a href="register.jsp">注册</a><span class="h_line">|</span></li>
      <li>购物车</li>
      </ul>
  </div>
  </div>
  <div class="biaoti">
  <p>
  The Gardon Of King
  </p>
  </div>
  <div class="daohang">
  <ul id="nav">
<li><a href="#" class="menu1">爱礼推荐</a>
 <ul>
 <li><a href="#">生日</a></li>
 <li><a href="#">纪念日</a></li>
 <li><a href="#">表白</a></li>
 <li><a href="#">求婚</a></li>
 </ul>
</li>
<li><a href="#" class="menu1">鲜花玫瑰</a>
 <ul>
 <li><a href="#">玫瑰长盒</a></li>
 <li><a href="#">玫瑰手捧</a></li>
 <li><a href="#">玫瑰花桶</a></li>
 <li><a href="#">玫瑰水晶花盒</a></li>
 </ul>
</li>
<li><a href="#" class="menu1">永生玫瑰</a>
 <ul>
 <li><a href="#">音乐玫瑰</a></li>
 <li><a href="#">玫瑰球形</a></li>
 <li><a href="#">玫瑰圆盒</a></li>
 <li><a href="#">玫瑰方盒</a></li>
 <li><a href="#">玫瑰心形盒</a></li>
 <li><a href="#">公仔</a></li>
 </ul>
</li>
<li><a href="#" class="menu1">玫瑰香氛</a>
 <ul>
 <li><a href="#">散香</a></li>
 <li><a href="#">蜡烛</a></li>
 <li><a href="#">陶瓷香氛</a></li>
 <li><a href="#"></a></li>
 </ul>
</li>
<li><a href="#" class="menu1">高端定制</a>
</li>
<li><a href="#" class="menu1">诺誓世界</a>
 <ul>
 <li><a href="#">品牌故事</a></li>
 <li><a href="#">产品故事</a></li>
 <li><a href="#">明星时刻</a></li>
 <li><a href="#">真爱见证</a></li>
 <li><a href="#">活动资讯</a></li>
 <li><a href="#">诺誓百科</a></li>
 </ul>
</li>
</ul>
</div>
<div style="width: 100%;height:1px;background: #484848;clear: both;"></div>
<div class="content">
<div class="bgim"><img style="width:100%;height:800px;background:no-repeat 5px 5px;" src="images/reg1.jpg"></div>
<div class="reg_content">
<div id="biaoti">
  <h3 align="center">用户注册</h3>
  <hr width="100%" color="#484848">
  </div>

<form action="reg" method="post">
<div id="biaod">
<label for="username">用户名：</label>
<input type="text" id="username" class="box" name="username" onchange="checkuse()">
<span class="default" id="checkt1">*用户名由2~18位字符组成</span>
</div>

<div id="biaod">
<label for="username">密码：</label>
<input type="password" id="password" class="box" name="password" onchange="checkpsw()">
<span class="default" id="checkt2">*密码由6~18位字符组成</span>
</div>

<div id="biaod">
<label for="username">确认密码：</label>
<input type="password" id="cpsw" name="cpsw" >
<span class="default" id="checkt3">*请再次输入你的密码</span>
</div>


<div id="biaod">
<label for="username">电子邮件：</label>
<input type="text" name="email" id="email" >
<span  class="default" id="checkt8">*请填写常用的email,将用于密码找回</span>
</div>


<div id="biaod">
<label for="username">用户类型：</label>
<select id="seluser" >
<option name="seluser" value="0">请选择</option>
<option name="seluser" value="1">管理员</option>
<option name="seluser" value="2">普通用户</option>
</select>
<span class="default"id="checkt4">*请选择用户类型</span>
</div>



<div id="biaod">
<input id="anniu" type="submit" name="submit" value="提交" >
</div>						
</form>

</div>
</div>
<div style="width: 100%;height:1px;background: #484848;clear: both; "></div>      
<div class="footer">
    <div class="footer_box">
        <ul>
            <p>新手指南</p>
            <li><a href="https://www.roseonly.com.cn/about/gouwuliucheng.html" target="_blank">购物流程</a></li>
            <li><a href="https://www.roseonly.com.cn/about/zhifufangshi.html" target="_blank">会员尊享</a></li>
            <li><a href="https://www.roseonly.com.cn/about/changjianwenti.html" target="_blank">常见问题</a></li>
            <li><a href="https://www.roseonly.com.cn/about/zhiquanceliang.html" target="_blank">指圈测量</a></li>
        </ul>
		  <ul>
            <p>物流配送</p>
            <li><a href="https://www.roseonly.com.cn/about/peisongfangshi.html" target="_blank">配送方式</a></li>
            <li><a href="https://www.roseonly.com.cn/about/peisongfuwu.html" target="_blank">配送服务</a></li>
        </ul>
		  <ul>
            <p>售后服务</p>
            <li><a href="https://www.roseonly.com.cn/about/tuihuantiaoli.html" target="_blank">退款说明</a></li>
            <li><a href="https://www.roseonly.com.cn/about/huhuatiaoli.html" target="_blank">保养物语</a></li>
        </ul>
        <ul>
            <p>关于我们</p>
            <li><a href="https://www.roseonly.com.cn/about/pinpaijieshao.html" target="_blank">品牌介绍</a></li>
            <li><a href="https://www.roseonly.com.cn/about/xiaoshouqudao.html" target="_blank">销售渠道</a></li>
            <li><a href="https://www.roseonly.com.cn/about/guanyuwomen.html" target="_blank">联系我们</a></li>
            <li><a href="https://www.roseonly.com.cn/about/jiaruwomen.html" target="_blank">加入我们</a></li>
        </ul>
		 <ul>
            <p>关注我们</p>
            <li class="f_weixin"><a href="https://www.roseonly.com.cn/about/pinpaijieshao.html" target="_blank">微信</a></li>
            <li class="f_weibo"><a href="https://www.roseonly.com.cn/about/xiaoshouqudao.html" target="_blank">微博</a></li>
        </ul>
        <dl class="new_r">
           <dt ><img src="https://www.roseonly.com.cn/upload/syspic_new/15320950093746580.jpg"  alt=""></dt>
			<dd>
				<p >微信关注roseonly  <br/>激活会员，立即领取</p>
                <h2>50元优惠券</h2>
				<div><img src="https://www.roseonly.com.cn/upload/syspic_new/15324047615849608.png"  alt=""></div>
			</dd>		
        </dl>              
    </div>
    <div class="foot-nav">
        京ICP备13007738号 京公网安备11010502023922<br/> www.roseonly.com.cn；诺誓（北京）商业股份有限公司
    </div>
</div>
</body>
</html>
