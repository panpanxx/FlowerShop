package ch02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class loginout extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession(false);//∑¿÷π¥¥Ω®session
		if(session==null){
			response.sendRedirect("home.jsp");
			return;
		}
		session.removeAttribute("username");
		response.sendRedirect("home.jsp");
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	

	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
