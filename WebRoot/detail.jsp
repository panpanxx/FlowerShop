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
   <title>鲜花玫瑰</title>
   <link rel="stylesheet" href="./css/headbo.css" type="text/css">
<link rel="stylesheet" href="./css/detail.css" type="text/css">
</head>
<script type="text/javascript">

function add1(){
var num=parseInt(document.getElementById("number").value);
if(num<100){
document.getElementById("number").value=++num;
}
}
function sub(){
var num=parseInt(document.getElementById("number").value);
if(num>1){
document.getElementById("number").value=--num;
}
}
</script>
<body>
<div class="header">
  <div class="head">
      <ul class="left">
      <li><a href="home.jsp">首页</a></li>
      <li>香烛</li>
      <li>见证</li>
      </ul>
        <%
    String username="";
    if(session.getAttribute("username")!=null)//防止出现用户名为空的情况
    {
        username=session.getAttribute("username").toString();
    }else{
    response.sendRedirect("login.jsp");
    
    }%>
      <ul class="right">
      <li><%=username%></li>
      <li><a href="login.jsp">登录</a><span class="h_line">|</span></li>
      <li><a href="register.jsp">注册</a><span class="h_line">|</span></li>
      <li><a href="cart.jsp">购物车</a></li>
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
 <li><a href="#">服务二服务二服务二</a></li>
 <li><a href="#">服务二</a></li>
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
 <li><a href="#">联系联系联系</a></li>
 </ul>
</li>
</ul>
</div>
<div style="width: 100%;height:1px;background: #484848;clear: both;"></div>
<div class="container">
<div class="contain_details">
<%
PromsgDao dao = new PromsgDao();
Promsg product = dao.findById(Integer.parseInt(request.getParameter("id")));
             if (product!=null){
%>

<div class="main_jewel">
<div class="jewel_window">
<div class="image_reel1">
<img id="detail_main_img" style="width: 350px;height: 350px;" src="<%=product.getImage()%>">																			
</div>
</div>
<div class="jewel_paging">
<div class="f1" style="float:left"></div>
<a href="javascript:;" rel="1" class=""><img class="detail_img" border="0" src="images/jewel1.jpg" ></a>
<a href="javascript:;" rel="1" class=""><img class="detail_img" border="0" src="images/jewel2.jpg" ></a>
<a href="javascript:;" rel="1" class=""><img class="detail_img" border="0" src="images/jewel3.jpg" ></a>
<a href="javascript:;" rel="1" class=""><img class="detail_img" border="0" src="images/jewel4.jpg" ></a>
<a href="javascript:;" rel="1" class=""><img class="detail_img" border="0" src="images/jewel5.jpg" ></a>
<div class="fr"></div>
</div>
</div>

<div class="details_num1_right">
<div class="right_tit"><%=product.getPname() %>&nbsp;<%=product.getPnamezhu() %></div>
<div class="right_xxc">1021240004</div>
<div class="right_pay"><span>价格 :</span>
								 ¥<%=product.getPrice()%>
							</div>
<div class="right_select">
				<span class="right_font_tit">颜色：</span>
				<div class="p-choose choose-color ">
				<img class="select_color selected " src="<%=product.getImage()%>" data-attrid="488" title="特别款">
				</div>
			</div>
<div class="right_selects" id="count">
				<span class="right_font_tit">数量：</span>
				<input type="text" value="1" class="right_number" id="number" name="number" maxlength="2">
				<div class="right_u_d">
				<span class="jia" id="add1" onclick="add1();">+</span>
				<span class="jian" id="sub" onclick="sub();">-</span>
				</div>
				<div class="clear"></div>
			</div>
		 <%String num=request.getParameter("number"); %>	
<a href="CartServlet?action=show" class="button_bar1 " name="for99clickToBuy">立即购买</a>
<a href="CartServlet?action=add&id=<%=product.getId() %>&num=1" class="button_bar2 " >加入购物车</a>
<div class="fwcn_txt">服务承诺：官方正品&nbsp;&nbsp;&nbsp;免邮配送&nbsp;&nbsp;&nbsp;同城速递</div>
</div>
<%
}
 %>

<div class="clear"></div>
<div><img src="images/line1.jpg"></div>
<div class="div_details1">
<div class="details_img"><img src="images/detail1.jpg"></div>
</div>
<div class="div_details1">
<div class="details_img"><img src="images/detail2.jpg"></div>
</div>
<div class="div_details1">
<div class="details_img"><img src="images/detail3.jpg"></div>
</div>
<div class="div_details1">
<div class="details_img"><img src="images/detail4.jpg"></div>
</div>
<div class="div_details1">
<div class="details_img"><img src="images/detail5.jpg"></div>
</div>
<div class="div_details1">
<div class="details_img"><img src="images/detail6.jpg"></div>
</div>
<div class="div_details1">
<div class="details_img"><img src="images/detail7.jpg"></div>
</div>
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
