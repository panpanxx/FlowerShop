<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="dao.PromsgDao" %>
<%@ page import="domain.Promsg" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="./css/headbo.css" type="text/css">
<link rel="stylesheet" href="./css/home.css" type="text/css">
    <%
  	PromsgDao daoi=new PromsgDao();
  	ArrayList list=daoi.findAll();
   %>
 <script type=text/javascript>
function menuFix() {
 var sfEls = document.getElementById("nav").getElementsByTagName("li");
 for (var i=0; i<sfEls.length; i++) {
  sfEls[i].onmouseover=function() {
  this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  sfEls[i].onMouseDown=function() {
  this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  sfEls[i].onMouseUp=function() {
  this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  sfEls[i].onmouseout=function() {
  this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), 
"");
  }
 }
}
window.onload=menuFix;
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
      <li><%
    String username="";
    if(session.getAttribute("username")!=null)//防止出现用户名为空的情况
    {
        username=session.getAttribute("username").toString();
    }%>
<%=username%></li>
      <li><a href="login.jsp">登录</a><span class="h_line">|</span></li>
      <li><a href="register.jsp">注册</a><span class="h_line">|</span></li>
      <li><a href="cart.jsp">购物车</a></li>
      <li><a href="loginout">退出</a></li>
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
 <li><a href="#">产品一</a></li>
 <li><a href="#">产品一</a></li>
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
 <div class="container">
    <div class="wrap" style="left: -1200px;">
      <img src="images/im5a.jpg" alt="">
      <img src="images/im1.jpg" alt="">
      <img src="images/im2.jpg" alt="">
      <img src="images/im3.jpg" alt="">
      <img src="images/im4a.jpg" alt="">
      <img src="images/im5a.jpg" alt="">
      <img src="images/im1.jpg" alt="">
    </div>
    <div class="buttons">
      <span class="on">1</span>
      <span>2</span>
      <span>3</span>
      <span>4</span>
      <span>5</span>
    </div>
    <a href="javascript:;" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" class="arrow arrow_left">&lt;</a>
    <a href="javascript:;" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" class="arrow arrow_right">&gt;</a>
  </div>
  <script>
    var wrap = document.querySelector(".wrap");
    var next = document.querySelector(".arrow_right");
    var prev = document.querySelector(".arrow_left");
    next.onclick = function () {
      next_pic();
    }
    prev.onclick = function () {
      prev_pic();
    }
    function next_pic () {
      index++;
      if(index > 4){
        index = 0;
      }
      showCurrentDot();
      var newLeft;
      if(wrap.style.left === "-7200px"){
        newLeft = -2400;
      }else{
        newLeft = parseInt(wrap.style.left)-1200;
      }
      wrap.style.left = newLeft + "px";
    }
    function prev_pic () {
      index--;
      if(index < 0){
        index = 4;
      }
      showCurrentDot();
      var newLeft;
      if(wrap.style.left === "0px"){
        newLeft = -4800;
      }else{
        newLeft = parseInt(wrap.style.left)+1200;
      }
      wrap.style.left = newLeft + "px";
    }
    var timer = null;
    function autoPlay () {
      timer = setInterval(function () {
        next_pic();
      },2400);
    }
    autoPlay();

    var container = document.querySelector(".container");
    container.onmouseenter = function () {
      clearInterval(timer);
    }
    container.onmouseleave = function () {
      autoPlay();  
    }

    var index = 0;
    var dots = document.getElementsByTagName("span");
    function showCurrentDot () {
      for(var i = 0, len = dots.length; i < len; i++){
        dots[i].className = "";
      }
      dots[index].className = "on";
    }

    for (var i = 0, len = dots.length; i < len; i++){
      (function(i){
        dots[i].onclick = function () {
          var dis = index - i;
          if(index == 4 && parseInt(wrap.style.left)!==-6000){
            dis = dis - 5;   
          }
          if(index == 0 && parseInt(wrap.style.left)!== -1200){
            dis = 5 + dis;
          }
          wrap.style.left = (parseInt(wrap.style.left) + dis * 1200)+"px";
          index = i;
          showCurrentDot();
        }
      })(i);      
    }
  </script>

<div class="contents">
<div class="showa">
    <ul>
      <li><a><img src="images/imc.jpg"></a></li>
      <li><a><img src="images/imb.jpg"></a></li>
      <li><a><img src="images/ima.jpg"></a></li>
    </ul>
    </div>
<div class="showb">
     <ul>
      <li><a><img src="images/ime.jpg"></a></li>
      <li><a><img src="images/imf.jpg"></a></li>
    </ul>
</div>
<div style="width: 100%;height:1px;background: #484848;clear: both; "></div>
<div class="showc">
<div class="rose"><p>精品推荐</p></div>
 
<ul class="ula">
<%for(int i=0;i<list.size();i++){
				Promsg obj=(Promsg)list.get(i);%>
<li>
<div class="li_img">
<a href="detail.jsp?id=<%=obj.getId() %>"><img class="lazy" src="<%=obj.getImage()%>"></a>
</div>
<b class="f14"><%=obj.getSort()%></b>
<p class="f12"><%=obj.getPname() %>&nbsp;&nbsp;<%=obj.getPnamezhu() %></p>
<b class="f14">￥<%=obj.getPrice()%></b>
</li>
<%
} 
%>
</ul>

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
