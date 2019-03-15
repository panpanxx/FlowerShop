package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.Mdbutil;




import domain.Promsg;

public class PromsgDao  {
/*	//增加
	public void add(Promsg product){
	try {
	   Connection conn = Mdbutil.getConnection();
	   PreparedStatement pstmt = conn.prepareStatement("insert into product(prodid,pname,price,stock) values(?,?,?,?)");
	   pstmt.setString(1,product.getProdid());
	   pstmt.setString(2,product.getPname());
	   pstmt.setInt(3,product.getPrice());
	   pstmt.setInt(4,product.getStock() );
	   
	   pstmt.executeUpdate();
	  Mdbutil.close(pstmt, conn);

	   } catch (SQLException e) {
	  e.printStackTrace();
	  }
	}
//删除
	public void delete(int id){
		try{
		    Connection conn = Mdbutil.getConnection();
		    PreparedStatement pstmt = conn.prepareStatement("delete from product where id = ?");
		    pstmt.setInt(1, id);
		    pstmt.executeUpdate();
		   Mdbutil.close(pstmt, conn);
		   }catch(SQLException e){
		   e.printStackTrace();
		   throw new RuntimeException();
		  }
		}
	//修改
	public void update(Promsg product){
		try {
		   Connection conn = Mdbutil.getConnection();
		   PreparedStatement pstmt = conn.prepareStatement("update product set prodid = ?,pname = ?,price =? ,stock =? where id = ?");
		   pstmt.setInt(5, product.getId());
		   pstmt.setString(1,product.getProdid());
		   pstmt.setString(2,product.getPname());
		   pstmt.setInt(3,product.getPrice());
		   pstmt.setInt(4,product.getStock() );

		   pstmt.executeUpdate();
		  Mdbutil.close(pstmt, conn);

		  } catch (SQLException e) {
		 e.printStackTrace();
		 throw new RuntimeException();
		 }
		}

	//查询
	public List<Promsg> findAll(){
	List<Promsg> list = new ArrayList<Promsg>();
	try{
	  Connection conn = Mdbutil.getConnection();
	   PreparedStatement pstmt = conn.prepareStatement("select * from product");
	   ResultSet rs = pstmt.executeQuery();
	   while(rs.next()){
	   Promsg product = new Promsg();
	   product.setId(rs.getInt(1));
	   product.setStock(rs.getInt(4));
	   product.setPrice(rs.getInt(3));
	   product.setPname(rs.getString(2));
	   product.setProdid(rs.getString(5));
	   list.add(product);
	  }
	   Mdbutil.close(pstmt, conn);
	  }catch(SQLException e){
	  e.printStackTrace();
	   throw new RuntimeException();
	  }
	 return list;
	}

	//根据id查询
	public Promsg findById(int id){
		Promsg product = new Promsg();
	try{
	   Connection conn = Mdbutil.getConnection();
	   PreparedStatement pstmt = conn.prepareStatement("select * from product where id="+id);
	   ResultSet rs = pstmt.executeQuery();
	  if(rs.next()){
	   product.setId(rs.getInt(1));
	   product.setStock(rs.getInt(4));
	   product.setPrice(rs.getInt(3));
	   product.setPname(rs.getString(2));
	   product.setProdid(rs.getString(5));
	  }
	  Mdbutil.close(pstmt, conn);
	  }catch(SQLException e){
	  e.printStackTrace();
	  throw new RuntimeException();
	   }
	   return product;
	 }*/
	
	
	
	
	//查询所有（查）
		public ArrayList findAll(){
			Connection con=null;
			PreparedStatement psta=null;
			ResultSet rs=null;
			ArrayList list=new ArrayList();
			String sql="select * from product";
			try{
				con=Mdbutil.getConnection();
				psta=con.prepareStatement(sql);
				rs=psta.executeQuery();
				while(rs.next()){
					Promsg obj=new Promsg();
					obj.setId(rs.getInt(5));
					obj.setProdid(rs.getString(1));
					obj.setPname(rs.getString(2));
					obj.setPrice(rs.getInt(3));
					obj.setStock(rs.getInt(4));
					obj.setImage(rs.getString(6));
					obj.setSort(rs.getString(7));
					obj.setPnamezhu(rs.getString(8));
					list.add(obj);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					Mdbutil.close(rs, psta, con);
				}catch(Exception e){
					e.printStackTrace();
				}
				return list;
			}
		}
	/*
		public List<Promsg> findAll() throws Exception{
		List<Promsg> list = new ArrayList<Promsg>();
		try{
		   Connection conn = Mdbutil.getConnection();
		   PreparedStatement pstmt = conn.prepareStatement("select * from product");
		   ResultSet rs = pstmt.executeQuery();
		   while(rs!=null&&rs.next()){
			   System.out.println("rs.getString(1)"+rs.getString(1));
		   Promsg product = new Promsg();
		   product.setId(rs.getInt(1));
		   product.setStock(rs.getInt(4));
		   product.setPrice(rs.getInt(3));
		   product.setPname(rs.getString(2));
		   product.setProdid(rs.getString(5));
		   list.add(product);
		   System.out.println("size:"+list.size());
		   for(int i=0;i<list.size();i++){
			   System.out.println(list.get(i));
		   }
		   }
		   Mdbutil.close(rs,pstmt, conn);
		}catch(SQLException e){
			  e.printStackTrace();
			   throw new RuntimeException();
			  }
			 return list;
		  }
		  */

		//插入方法（增）
		public boolean save(Promsg obj){
			Connection con=null;
			PreparedStatement psta=null;
			String sql="insert into product(prodid,pname,price,stock,image,sort,pnamezhu) values(?,?,?,?,?,?,?)";
			boolean flag=false;
			try{
				con=Mdbutil.getConnection();
				psta=con.prepareStatement(sql);
				psta.setString(1, obj.getProdid());
				psta.setString(2, obj.getPname());
				psta.setString(3, obj.getPrice()+"");
				psta.setString(4, obj.getStock()+"");
				psta.setString(5, obj.getImage());
				psta.setString(6, obj.getSort());
				psta.setString(7, obj.getPnamezhu());
				flag=psta.executeUpdate()>0;
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					Mdbutil.close(null, psta, con);
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
			String sql="delete from product where id=?";
			try{
				con=Mdbutil.getConnection();
				psta=con.prepareStatement(sql);
				psta.setInt(1, id);
				flag=psta.executeUpdate()>0;
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					Mdbutil.close(null, psta, con);
				}catch(Exception e){
					e.printStackTrace();
				}
				return flag;
			}
		}

		//通过id修改，为更新做准备的（改）
		public Promsg findById(int id){
			Connection con=null;
			PreparedStatement psta=null;
			ResultSet rs=null;
			Promsg obj=null;
			String sql="select * from product where id=?";
			try{
				con=Mdbutil.getConnection();
				psta=con.prepareStatement(sql);
				psta.setInt(1, id);
				rs=psta.executeQuery();
				if(rs.next()){
					obj=new Promsg();					
					obj.setProdid(rs.getString(1));
					obj.setPname(rs.getString(2));
					obj.setPrice(rs.getInt(3));
					obj.setStock(rs.getInt(4));
					obj.setImage(rs.getString(6));
					obj.setSort(rs.getString(7));
					obj.setPnamezhu(rs.getString(8));
					obj.setId(rs.getInt(5));
				
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					Mdbutil.close(rs, psta, con);
				}catch(Exception e){
					e.printStackTrace();
				}
				return obj;
			}
		}

//更新方法（修改数据）（改）
public boolean update(Promsg obj){
	Connection con=null;
	PreparedStatement psta=null;
	String sql="update product set prodid=?,pname=?,price=?,stock=?,sort=?,pnamezhu=? where id=?";
	boolean flag=false;
	try{
		con=Mdbutil.getConnection();
		psta=con.prepareStatement(sql);
		psta.setString(1, obj.getProdid());
		psta.setString(2, obj.getPname());
		psta.setString(3, obj.getPrice()+"");
		psta.setString(4, obj.getStock()+"");
		psta.setString(5, obj.getSort());
		psta.setString(6, obj.getPnamezhu());
		psta.setInt(7,obj.getId());
		flag=psta.executeUpdate()>0;
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			Mdbutil.close(null, psta, con);
		}catch(Exception e){
			e.printStackTrace();
		}
		return flag;
	}
}




	
	}

	 

	

	


	


