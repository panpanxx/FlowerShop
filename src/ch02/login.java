package ch02;

import java.io.IOException;

import dao.UserDAO;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	this.doPost(request, response);
				
			}
			
	   protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String username = request.getParameter("username");
		String password = request.getParameter("password");
		//管理员账号密码，进入后台
		if(username.equals("apanpan")&&password.equals("123456789")){
			request.getRequestDispatcher("/manage.jsp").forward(request, response);
			return;			
		}
		//dao层中判断，如果为true，跳转到首页
		if (UserDAO.checkLogin(username, password)) {
			 HttpSession session=request.getSession();
			 session.setAttribute("username", username);
			 request.getRequestDispatcher("/home.jsp").forward(request, response);
			 return;
			}else{  //如果为false，跳转到登录界面，并返回错误信息.                                      
			request.setAttribute("err", "你的账号或密码错误，请重新登录");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
			}



	}

	

}
