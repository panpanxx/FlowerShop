package ch02;

import java.io.IOException;

import dao.UserDAO;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




public class reg extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	this.doPost(request, response);				
			}
	private Connection conn;  
		      
	        // ��ʼ������  
	        public void init() throws ServletException {  
	            super.init();  
	            try {  
	                // ��������  
	                Class.forName("com.mysql.jdbc.Driver");  
	                // ���ݿ�����url  
	                String url = "jdbc:mysql://localhost:3306/user";  
	                // ��ȡ���ݿ�����  
	                conn = DriverManager.getConnection(url, "root", "root");  
	                System.out.println("���ݿ����ӳɹ�!");  
	            } catch (Exception e) {  
	                e.printStackTrace();  
	            }  
	        }  


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		UserDAO.registe(username, password);
		request.getRequestDispatcher("/login.jsp").forward(request,response);
		
	}
	}
		
		
	

