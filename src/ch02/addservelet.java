package ch02;

import java.io.IOException;

import dao.PromsgDao;
import domain.Promsg;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;

import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.io.IOUtils;






public class addservelet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	


		Promsg obj=new Promsg();
		//判断请求是否为multipar请求
	if(!ServletFileUpload.isMultipartContent(request))
		{
			throw new RuntimeException("当前请求不支持文件上传");
		}
		//为基于磁盘的文件项创建一个FileItem工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//设置临时文件的边界值，大于该值时，上传文件会先保存在临时文件中，否则，上传文件将直接写入到内存
		//单位：字节，设置边界值1M，一字节=1024M;
		factory.setSizeThreshold(1024*1024*1);
		//设置文件临时储存
		String temppath=this.getServletContext().getRealPath("/temp");
		File temp=new File(temppath);
		factory.setRepository(temp);
		//创建一个新的文件上传处理程序
		ServletFileUpload upload = new ServletFileUpload(factory);
		//设置每一个item的头部字符编码，其可以解决文件名中文乱码问题；
		upload.setHeaderEncoding("UTF-8");
		//设置单个文件的最大边界值(这里是2M)
		upload.setFileSizeMax(1024*1024*2);
		//设置一次上传所有文件总和的最大值(对上传多个文件起作用,这里最大为5M)
		upload.setSizeMax(1024*1024*5);
		//解析请求,获取所有的item
		try {
		//
			//调用ServletFileUpload.parseRequest方法解析request对象，
			//得到一个保存了所有上传内容的List对象。
		List <FileItem> items = upload.parseRequest(request);
		//遍历
		for(FileItem item:items){
		//若item为普通表单项
			if(item.isFormField()){
			//获取表单中属性名称
			String fieldName = item.getFieldName();
			if(fieldName.equals("pname")){
			//获取表单属性的值
			 String pname=item.getString("UTF-8").trim();
			 obj.setPname(pname);
			 System.out.println(pname);
			}
			if(fieldName.equals("price")){
				//获取表单属性的值
				 String price=item.getString("UTF-8").trim();
				 obj.setPrice(Integer.parseInt(price));
				 System.out.println(price);
				}
			if(fieldName.equals("prodid")){
				//获取表单属性的值
				 String prodid=item.getString("UTF-8").trim();
				 obj.setProdid(prodid);
				 System.out.println(prodid);
				}
			if(fieldName.equals("stock")){
				//获取表单属性的值
				 String stock=item.getString("UTF-8").trim();
				 obj.setStock(Integer.parseInt(stock));
				 System.out.println(stock);
				}
			if(fieldName.equals("sort")){
				//获取表单属性的值
				 String sort=item.getString("UTF-8").trim();
				 obj.setSort(sort);
				 System.out.println(sort);
				}
			if(fieldName.equals("pnamezhu")){
				//获取表单属性的值
				 String pnamezhu=item.getString("UTF-8").trim();
				 obj.setPnamezhu(pnamezhu);
				 System.out.println(pnamezhu);
				}
		//若	item为文件表单项
			}else{
			//获取文件大小
			long size=item.getSize();
			//获取文件类型
			String contentType = item.getContentType();
			//获取上传文件原始名字
			String fileName = item.getName();
			System.out.println("文件大小："+size);
			System.out.println("文件的类型："+contentType);
			//System.out.println("文件的名称："+fileName);
		    //获取文件名,处理获取到的上传文件的文件名的路径部分，只保留文件名部分
			if(fileName.contains("\\"))
            {
                //如果包含则截取字符串
				fileName=fileName.substring(fileName.lastIndexOf("\\")+1);
            }
			//设置文件名，因为同名的文件会覆盖，所以要修饰文件名，设置毫秒+文件名
			fileName=System.currentTimeMillis()+fileName;
			System.out.println("文件的名称："+fileName);
			//获取输入流,其实有上传文件的内容
			InputStream inputStream = item.getInputStream();
			
			String path=this.getServletContext().getRealPath("/images");
			System.out.println("webroot的根路径："+path);
			//String path="E:\\picture-up";
			File dirFile=new File(path);
			if(!dirFile.exists()){
				//创建多级目录mkdirs()
				dirFile.mkdir();
			}
			//创建目录文件，将来用于保存上传文件
			File file = new File(path, fileName);
			//创建文件输出流
			OutputStream os=new FileOutputStream(file);	
			//把输入流中的数据写入到输出流
			int len=0;
			byte[] buf=new byte[1024];
			while((len=inputStream.read(buf))!=-1){
				os.write(buf, 0, len);
			}
           //图片上传到之后的路径
			path="images/"+fileName;
			//path="E:\\picture-up"+"\\"+fileName;
			obj.setImage(path);
			
			System.out.println(obj.getPname()+"----"+obj.getImage());
           //调用Dao中的save()方法
			PromsgDao dao=new PromsgDao();
			dao.save(obj);
			os.close();
			inputStream.close();
			//删除临时文件
			item.delete();
			}
		}	
			
		} catch (FileUploadException e) {
			
			e.printStackTrace();
		}
		response.sendRedirect("manage.jsp");
	}



		
	}

 
	

