<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="dao.PromsgDao" %>
<%@ page import="domain.Promsg" %>
<%@ page import="domain.Cart" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的购物车</title>
	<link rel="stylesheet" href="./css/headbo.css" type="text/css">
<style>

table.altrowstable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #a9c6c9;
	border-collapse: collapse;
}
table.altrowstable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
table.altrowstable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
</style>
   <%
  	PromsgDao daoi=new PromsgDao();
  	ArrayList list=daoi.findAll();
   %>
  <script language="javascript">
            function delcfm() {
                if (!confirm("确认要删除？")) {
                    window.event.returnValue = false;
                }
            }
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
      <li> <%
    String username="";
    if(session.getAttribute("username")!=null)//防止出现用户名为空的情况
    {
        username=session.getAttribute("username").toString();
    }else{
    response.sendRedirect("login.jsp");    
    }%>
<%=username%></li>
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
  <div class="carcontent">
   <h1>我的购物车</h1>
   <a href="home.jsp">首页</a> >> <a href="home.jsp">商品列表</a>
   <hr>
   <div id="shopping">
   <form action="" method="">                
                        <table align="center" border="" width="60%" class="altrowstable" id="alternatecolor">
                                <tr>
                                        <th>商品名称</th>
                                        <th>商品单价</th>
                                        <th>商品价格</th>
                                        <th>购买数量</th>
                                        <th>操作</th>
                                </tr>
                                <%
                                   //首先判断session中是否有购物车对象
                                   if(request.getSession().getAttribute("cart")!=null)
                                   {
                                %>
                                <!-- 循环的开始 -->
                                     <%
                                         Cart cart = (Cart)request.getSession().getAttribute("cart");
                                         HashMap<Promsg,Integer> goods = cart.getGoods();
                                         Set<Promsg> items = goods.keySet();
                                         Iterator<Promsg> it = items.iterator();
                                        
                                         while(it.hasNext())
                                         {
                                            Promsg i = it.next();
                                     %>
                                <tr name="products" id="product_id_1">
                                        <td class="thumb"><img src="<%=i.getImage()%>" width="30" height="30" /><a href=""><%=i.getSort()%><%=i.getPname() %><%=i.getPnamezhu() %></a></td>
                                        <td class="number"><%=i.getPrice() %></td>
                                        <td class="price" id="price_id_1">
                                                <span><%=i.getPrice()*goods.get(i) %></span>
                                                <input type="hidden" value="" />
                                        </td>
                                        <td class="number">
                        <%=goods.get(i)%>                                 
                                        </td>                       
                    <td class="delete">
                                          <a href="CartServlet?action=delete&id=<%=i.getId()%>" onclick="delcfm();">删除</a>                                                    
                                        </td>
                                </tr>
                                     <%
                                         }
                                     %>
                                <!--循环的结束-->
                                
                        </table>
                         <div class="total" align="center"><span id="total">总计：<%=cart.getTotalPrice() %>￥</span></div>
                          <%
                            }
                         %>
                        <div class="button"><input type="submit" value="" /></div>
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
