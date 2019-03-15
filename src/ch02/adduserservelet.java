package ch02;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.umDao;
import domain.User;

public class adduserservelet extends HttpServlet {

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		User obj=new User();
		obj.setUsername(username);
		obj.setPassword(password);
		
		umDao dao=new umDao();
		dao.save(obj);
		response.sendRedirect("um.jsp");

	}

	
}
