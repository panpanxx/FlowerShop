package ch02;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class testdb extends HttpServlet  {
    private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String driverName="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/user";
		Connection conn=null;
		PrintWriter out=response.getWriter();
		try {
		Class.forName(driverName);
		conn= DriverManager.getConnection(url,"root","root");
		String sql="select * from usermsg";
		Statement st=conn.createStatement();
		ResultSet rs=st.executeQuery(sql);
		 while(rs.next())
		   {
			 out.println(rs.getString(1)+","+rs.getString(2));
			 out.println("连接成功");
		    System.out.println(rs.getString(1)+","+rs.getString(2));
		    System.out.println("连接成功");		   
		   }
		 rs.close();
		 st.close();
		
		  } catch (SQLException e){
				try {   
	                // 若出现异常，对数据库中所有已完成的操作全部撤销，则回滚到事务开始状态   
	                if(!conn.isClosed()){   
	                    conn.rollback();//当异常发生执行catch中SQLException时，记得要rollback(回滚)；   
	                    System.out.println("插入失败，回滚！");   
	                     
	                }   
	           } catch (SQLException e1) {   
	               e1.printStackTrace();   
	           }   
	       } catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		   }


	}

	
}
