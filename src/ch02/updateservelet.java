package ch02;

import java.io.IOException;
import dao.PromsgDao;
import domain.Promsg;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class updateservelet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String prodid=request.getParameter("prodid");
		String pname=request.getParameter("pname");
		String price=request.getParameter("price");
	    String stock=request.getParameter("stock");
		int id=Integer.parseInt(request.getParameter("id"));
		String sort=request.getParameter("sort");
		String pnamezhu=request.getParameter("pnamezhu");
		
		
		Promsg obj=new Promsg();
		obj.setProdid(prodid);
		obj.setPname(pname);
		obj.setPrice(Integer.parseInt(price));
		obj.setStock(Integer.parseInt(stock));
		obj.setId(id);
		obj.setSort(sort);
		obj.setPnamezhu(pnamezhu);
		PromsgDao dao=new PromsgDao();
		dao.update(obj);
		response.sendRedirect("manage.jsp");

	}
}
