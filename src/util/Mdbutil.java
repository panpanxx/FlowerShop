package util;



import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;




public class Mdbutil  {	
		
	
	
	public static Connection getConnection()throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		String dbUrl="jdbc:mysql://localhost:3306/promsg?useUnicode=true&characterEncoding=utf8";
		String dbUser="root";
		String dbPassword="root";
		return DriverManager.getConnection(dbUrl,dbUser,dbPassword);
	}
	
	public static void close(ResultSet rs,Statement sta,Connection con)throws Exception{
		if(rs!=null){
                 //�رս����
                rs.close();
		}
		if(sta!=null){
                 //�رղ������
                 sta.close();
		}
		if(con!=null){
                //�ر�����
                con.close();
		}
	}


	

	}
	


