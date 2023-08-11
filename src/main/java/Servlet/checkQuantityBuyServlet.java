package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.orderDao;
import Dao.productDao;
import Model.Order;
import Model.Orderdetail;
import Model.Product;
import Model.User;

/**
 * Servlet implementation class checkQuantityBuyServlet
 */
@WebServlet("/checkQuantityBuy")
public class checkQuantityBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkQuantityBuyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		productDao productDao = new productDao();
		orderDao orderDao = new orderDao();
		
		
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Order order = null;
		   if(user != null){
		        order = orderDao.getOrderByUserId(user.getId()); 
		    }
		List<Orderdetail> orderdetails = null;
        if(order != null){
      	  orderdetails = orderDao.getListOrderdetailOrderBy(order.getId());
        }
        
      StringBuilder builder = new StringBuilder();
      int count = 0;
      if(orderdetails != null){
       for(Orderdetail orderdetail : orderdetails){
      	  Product product = productDao.getProductById(orderdetail.getProduct_id());
      	  if(orderdetail.getQuantity() > product.getQuantity()) {
      		  count++;
      		  builder.append( "Bạn đã đặt hàng vượt quá số lượng sản phẩm " + product.getName() + " hiện có là " + product.getQuantity() + ". Vui lòng điều chỉnh lại số lượng. <br><br>");
      	  }
	}
      }
      
      if (count == 0) {
		response.sendRedirect("checkout.jsp");
	}else {
		request.setAttribute("failBuy", builder);
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}
      
	}
}
