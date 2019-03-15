package util;

import java.sql.Connection;


import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class DButil  {
	
	public static final String driver="com.mysql.jdbc.Driver";
	public static final String url="jdbc:mysql://localhost:3306/user?useUnicode=true&characterEncoding=utf8";
	public static final String username="root";
	public static final String password="root";
	public static Connection con=null;
	static{
		try{
			Class.forName(driver);
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
	}
	public static Connection getCon(){
		if(con==null){
		try {
		con=DriverManager.getConnection(url,username,password);
		} catch (SQLException e) {
		e.printStackTrace();
		}
	}
		return con;
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


	/**
	 * �õ����ݿ�����
	 */
	/*public static  Connection getCon() throws SQLException{
		 Connection conn = null;
		 
		 conn = (Connection) DriverManager.getConnection(url, username, password);
		 
		 return  conn;
	}*/
	
	//�رյķ���
	/*public static void close(Statement statement,Connection conn){
		   if(statement !=null){
			   try {
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   }
		   
		   if(conn !=null){
			   try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   }
	}
		
	//�رյķ���
		public static void close(PreparedStatement preparedStatement,Connection conn,ResultSet resultSet){
			   if(preparedStatement !=null){
				   try {
					preparedStatement.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			   }
			   
			   if(conn !=null){
				   try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			   }
			   
			   if(resultSet!=null){
				   try {
					resultSet.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			  }
	}*/


