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
			 out.println("���ӳɹ�");
		    System.out.println(rs.getString(1)+","+rs.getString(2));
		    System.out.println("���ӳɹ�");		   
		   }
		 rs.close();
		 st.close();
		
		  } catch (SQLException e){
				try {   
	                // �������쳣�������ݿ�����������ɵĲ���ȫ����������ع�������ʼ״̬   
	                if(!conn.isClosed()){   
	                    conn.rollback();//���쳣����ִ��catch��SQLExceptionʱ���ǵ�Ҫrollback(�ع�)��   
	                    System.out.println("����ʧ�ܣ��ع���");   
	                     
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
