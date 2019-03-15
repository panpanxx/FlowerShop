package dao;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.List;
import domain.User;


import util.DButil;


public class UserDAO  {
	public static Connection con = null;
	public static PreparedStatement ps = null;
	public static ResultSet rs = null;

	public static boolean checkLogin(String username, String password) {
	con = DButil.getCon();//ͨ��DButil�õ�Connection
	String sql = "select * from usermsg where username = ?";
	try{
		ps = con.prepareStatement(sql);
		ps.setString(1, username);//��ֵ
		rs = ps.executeQuery();//ִ�в�ѯ��䣬����һ��ResultSet,��������������ݿ������user
		if (rs.next()){
			String pwd = rs.getString("password");//�ҵ�����������user����Ӧ��passwrod
			if (pwd.equals(password)) {//�����Ǵ����ݿ����ҳ�����password�ʹ�jsp�д�������passwrod�Ƚ�
			    return true; //ture������֤�ɹ�
			}else{
			    return false;//false������֤ʧ��
			}
			}else{
			    return false;
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}finally{
				if(rs!=null){
					try{
						rs.close();
					}catch(SQLException e){
						e.printStackTrace();
					}
					rs=null;
				}
				if (ps != null) {
					try {
					    ps.close();
					} catch (SQLException e) {
					// TODO Auto-generated catch block
					    e.printStackTrace();
					}
					ps = null;
					}
					}
					return false;
					}
	public static void registe(String username,String password){//�����ݿ�ע��һ���µ���
		con=DButil.getCon();//ͨ��DBHelper�õ�Connection
		String sql="insert into usermsg(username,password) values (?,?)";//���������������һ��user,username��password������Ϊ��,���渳ֵ
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, username);//��username��ֵ
			ps.setString(2, password);//��password��ֵ
			int b=ps.executeUpdate();//ִ�в�����䣬������һ��intֵ������0��ʾ��ӳɹ���С��0��ʾ���ʧ��.
			if(b>0){
				System.out.println("������ӳɹ�");
				}else{
					System.out.println("�������ʧ��");
					}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}finally {   //������һЩ�������ݿ�֮���һЩ�رղ���
					if (rs != null) {
						try {
							rs.close();
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
								}
						rs = null;
						}
					if (ps != null) {
						try {
							ps.close();
							} catch (SQLException e) {
					// TODO Auto-generated catch block
								e.printStackTrace();
								}
						ps = null;

			}
			
		}

	}
	
	
}



	





	


