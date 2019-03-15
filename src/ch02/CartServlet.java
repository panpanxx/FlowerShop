package ch02;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.PromsgDao;
import domain.Cart;
import domain.Promsg;
public class CartServlet extends HttpServlet {
    private String action ; //��ʾ���ﳵ�Ķ��� ,add,show,delete
    //��Ʒҵ���߼���Ķ���
    private PromsgDao idao = new PromsgDao();
    
  
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        if(request.getParameter("action")!=null)
        {
            this.action = request.getParameter("action");
            if(action.equals("add")) //����������Ʒ�����ﳵ
            {
                if(addToCart(request,response))
                {
                    request.getRequestDispatcher("/success.jsp").forward(request, response);
                }
                else
                {
                    request.getRequestDispatcher("/failure.jsp").forward(request, response);
                }
            }
            if(action.equals("show"))//�������ʾ���ﳵ
            {
                request.getRequestDispatcher("/cart.jsp").forward(request, response);
            }
            if(action.equals("delete")) //�����ִ��ɾ�����ﳵ�е���Ʒ
            {
                if(deleteFromCart(request,response))
                {
                    request.getRequestDispatcher("/cart.jsp").forward(request, response);
                }
                else
                {
                    request.getRequestDispatcher("/cart.jsp").forward(request, response);
                }
            }
        }
        
    }

//�����Ʒ�����ﳵ�ķ���
    private boolean addToCart(HttpServletRequest request, HttpServletResponse response)
    {
        String id = request.getParameter("id");
        String number = request.getParameter("num");
        Promsg item = idao.findById(Integer.parseInt(id));
        //�Ƿ��ǵ�һ�θ����ﳵ�����Ʒ,��Ҫ��session�д���һ���µĹ��ﳵ����
        if(request.getSession().getAttribute("cart")==null)
        {
            Cart cart = new Cart();
            request.getSession().setAttribute("cart",cart);
        }
        Cart cart = (Cart)request.getSession().getAttribute("cart");
        if(cart.addGoodsInCart(item, Integer.parseInt(number)))
        {
            return true;
        }
        else
        {
            return false;
        }
        
    }
    
    //�ӹ��ﳵ��ɾ����Ʒ
    private boolean deleteFromCart(HttpServletRequest request, HttpServletResponse response)
    {
        String id = request.getParameter("id");
        Cart cart = (Cart)request.getSession().getAttribute("cart");
        Promsg item = idao.findById(Integer.parseInt(id));
        if(cart.removeGoodsFromCart(item))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    

    public void init() throws ServletException {
        // Put your code here
    }
 

}
