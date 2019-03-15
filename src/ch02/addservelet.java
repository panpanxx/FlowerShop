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
		//�ж������Ƿ�Ϊmultipar����
	if(!ServletFileUpload.isMultipartContent(request))
		{
			throw new RuntimeException("��ǰ����֧���ļ��ϴ�");
		}
		//Ϊ���ڴ��̵��ļ����һ��FileItem����
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//������ʱ�ļ��ı߽�ֵ�����ڸ�ֵʱ���ϴ��ļ����ȱ�������ʱ�ļ��У������ϴ��ļ���ֱ��д�뵽�ڴ�
		//��λ���ֽڣ����ñ߽�ֵ1M��һ�ֽ�=1024M;
		factory.setSizeThreshold(1024*1024*1);
		//�����ļ���ʱ����
		String temppath=this.getServletContext().getRealPath("/temp");
		File temp=new File(temppath);
		factory.setRepository(temp);
		//����һ���µ��ļ��ϴ��������
		ServletFileUpload upload = new ServletFileUpload(factory);
		//����ÿһ��item��ͷ���ַ����룬����Խ���ļ��������������⣻
		upload.setHeaderEncoding("UTF-8");
		//���õ����ļ������߽�ֵ(������2M)
		upload.setFileSizeMax(1024*1024*2);
		//����һ���ϴ������ļ��ܺ͵����ֵ(���ϴ�����ļ�������,�������Ϊ5M)
		upload.setSizeMax(1024*1024*5);
		//��������,��ȡ���е�item
		try {
		//
			//����ServletFileUpload.parseRequest��������request����
			//�õ�һ�������������ϴ����ݵ�List����
		List <FileItem> items = upload.parseRequest(request);
		//����
		for(FileItem item:items){
		//��itemΪ��ͨ����
			if(item.isFormField()){
			//��ȡ������������
			String fieldName = item.getFieldName();
			if(fieldName.equals("pname")){
			//��ȡ�����Ե�ֵ
			 String pname=item.getString("UTF-8").trim();
			 obj.setPname(pname);
			 System.out.println(pname);
			}
			if(fieldName.equals("price")){
				//��ȡ�����Ե�ֵ
				 String price=item.getString("UTF-8").trim();
				 obj.setPrice(Integer.parseInt(price));
				 System.out.println(price);
				}
			if(fieldName.equals("prodid")){
				//��ȡ�����Ե�ֵ
				 String prodid=item.getString("UTF-8").trim();
				 obj.setProdid(prodid);
				 System.out.println(prodid);
				}
			if(fieldName.equals("stock")){
				//��ȡ�����Ե�ֵ
				 String stock=item.getString("UTF-8").trim();
				 obj.setStock(Integer.parseInt(stock));
				 System.out.println(stock);
				}
			if(fieldName.equals("sort")){
				//��ȡ�����Ե�ֵ
				 String sort=item.getString("UTF-8").trim();
				 obj.setSort(sort);
				 System.out.println(sort);
				}
			if(fieldName.equals("pnamezhu")){
				//��ȡ�����Ե�ֵ
				 String pnamezhu=item.getString("UTF-8").trim();
				 obj.setPnamezhu(pnamezhu);
				 System.out.println(pnamezhu);
				}
		//��	itemΪ�ļ�����
			}else{
			//��ȡ�ļ���С
			long size=item.getSize();
			//��ȡ�ļ�����
			String contentType = item.getContentType();
			//��ȡ�ϴ��ļ�ԭʼ����
			String fileName = item.getName();
			System.out.println("�ļ���С��"+size);
			System.out.println("�ļ������ͣ�"+contentType);
			//System.out.println("�ļ������ƣ�"+fileName);
		    //��ȡ�ļ���,�����ȡ�����ϴ��ļ����ļ�����·�����֣�ֻ�����ļ�������
			if(fileName.contains("\\"))
            {
                //����������ȡ�ַ���
				fileName=fileName.substring(fileName.lastIndexOf("\\")+1);
            }
			//�����ļ�������Ϊͬ�����ļ��Ḳ�ǣ�����Ҫ�����ļ��������ú���+�ļ���
			fileName=System.currentTimeMillis()+fileName;
			System.out.println("�ļ������ƣ�"+fileName);
			//��ȡ������,��ʵ���ϴ��ļ�������
			InputStream inputStream = item.getInputStream();
			
			String path=this.getServletContext().getRealPath("/images");
			System.out.println("webroot�ĸ�·����"+path);
			//String path="E:\\picture-up";
			File dirFile=new File(path);
			if(!dirFile.exists()){
				//�����༶Ŀ¼mkdirs()
				dirFile.mkdir();
			}
			//����Ŀ¼�ļ����������ڱ����ϴ��ļ�
			File file = new File(path, fileName);
			//�����ļ������
			OutputStream os=new FileOutputStream(file);	
			//���������е�����д�뵽�����
			int len=0;
			byte[] buf=new byte[1024];
			while((len=inputStream.read(buf))!=-1){
				os.write(buf, 0, len);
			}
           //ͼƬ�ϴ���֮���·��
			path="images/"+fileName;
			//path="E:\\picture-up"+"\\"+fileName;
			obj.setImage(path);
			
			System.out.println(obj.getPname()+"----"+obj.getImage());
           //����Dao�е�save()����
			PromsgDao dao=new PromsgDao();
			dao.save(obj);
			os.close();
			inputStream.close();
			//ɾ����ʱ�ļ�
			item.delete();
			}
		}	
			
		} catch (FileUploadException e) {
			
			e.printStackTrace();
		}
		response.sendRedirect("manage.jsp");
	}



		
	}

 
	

