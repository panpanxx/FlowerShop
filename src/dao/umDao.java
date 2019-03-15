package dao;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.userdbutil;
import domain.User;

public class umDao extends HttpServlet {

	//查询所有（查）
			public ArrayList findAll(){
				Connection con=null;
				PreparedStatement psta=null;
				ResultSet rs=null;
				ArrayList list=new ArrayList();
				String sql="select * from usermsg";
				try{
					con=userdbutil.getConnection();
					psta=con.prepareStatement(sql);
					rs=psta.executeQuery();
					while(rs.next()){
						User obj=new User();
						obj.setId(rs.getInt(3));
						obj.setUsername(rs.getString(1));
						obj.setPassword(rs.getString(2));
						list.add(obj);
					}
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					try{
						userdbutil.close(rs, psta, con);
					}catch(Exception e){
						e.printStackTrace();
					}
					return list;
				}
			}
		

			//插入方法（增）
			public boolean save(User obj){
				Connection con=null;
				PreparedStatement psta=null;
				String sql="insert into usermsg(username,password) values(?,?)";
				boolean flag=false;
				try{
					con=userdbutil.getConnection();
					psta=con.prepareStatement(sql);
					psta.setString(1, obj.getUsername());
					psta.setString(2, obj.getPassword());
					flag=psta.executeUpdate()>0;
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					try{
						userdbutil.close(null, psta, con);
					}catch(Exception e){
						e.printStackTrace();
					}
					return flag;
				}
			}
			
			//删除方法（删）
			public boolean remove(int id){
				Connection con=null;
				PreparedStatement psta=null;
				boolean flag=false;
				String sql="delete from usermsg where id=?";
				try{
					con=userdbutil.getConnection();
					psta=con.prepareStatement(sql);
					psta.setInt(1, id);
					flag=psta.executeUpdate()>0;
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					try{
						userdbutil.close(null, psta, con);
					}catch(Exception e){
						e.printStackTrace();
					}
					return flag;
				}
			}

			//通过id修改，为更新做准备的（改）
			public User findById(int id){
				Connection con=null;
				PreparedStatement psta=null;
				ResultSet rs=null;
				User obj=null;
				String sql="select * from usermsg where id=?";
				try{
					con=userdbutil.getConnection();
					psta=con.prepareStatement(sql);
					psta.setInt(1, id);
					rs=psta.executeQuery();
					if(rs.next()){
						obj=new User();					
						obj.setUsername(rs.getString(1));
						obj.setPassword(rs.getString(2));
						obj.setId(rs.getInt(3));
					}
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					try{
						userdbutil.close(rs, psta, con);
					}catch(Exception e){
						e.printStackTrace();
					}
					return obj;
				}
			}

	//更新方法（修改数据）（改）
	public boolean update(User obj){
		Connection con=null;
		PreparedStatement psta=null;
		String sql="update usermsg set username=?,password=? where id=?";
		boolean flag=false;
		try{
			con=userdbutil.getConnection();
			psta=con.prepareStatement(sql);
			psta.setString(1, obj.getUsername());
			psta.setString(2, obj.getPassword());
			psta.setInt(3,obj.getId());
			flag=psta.executeUpdate()>0;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				userdbutil.close(null, psta, con);
			}catch(Exception e){
				e.printStackTrace();
			}
			return flag;
		}
	}




		
		}

		 

		

		


		


