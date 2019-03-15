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
                 //关闭结果集
                rs.close();
		}
		if(sta!=null){
                 //关闭操作句柄
                 sta.close();
		}
		if(con!=null){
                //关闭链接
                con.close();
		}
	}


	

	}
	


