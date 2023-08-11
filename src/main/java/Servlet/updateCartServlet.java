package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.orderDao;
import Model.Order;
import Model.Orderdetail;

/**
 * Servlet implementation class updateCartServlet
 */
@WebServlet("/updateCartServlet")
public class updateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateCartServlet() {
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
		request.setCharacterEncoding("UTF-8");
		orderDao orderDao = new orderDao();
		
		
		String orderid = request.getParameter("orderdetailId");
	
		String minus = request.getParameter("minus");
		String plus = request.getParameter("plus");
		String remove = request.getParameter("remove");
		
		int order_id = -1;
		Orderdetail orderdetail = null;
		if(orderid != null) {
			order_id = Integer.parseInt(orderid);
			orderdetail = orderDao.getOrderdetail(order_id);
		}
		
		
		if(minus != null) {
			
		
				 orderDao.updateQuantityByMinus(orderdetail);
				 orderdetail = orderDao.getOrderdetail(order_id);
				 if(orderdetail.getQuantity() ==0) {
						orderDao.removeOrderdetail(orderdetail.getId());
					}
				  
				    Orderdetail updateTotalorderDetail = new Orderdetail(orderdetail.getPrice(),orderdetail.getQuantity(),orderdetail.getPrice()*(orderdetail.getQuantity()),orderdetail.getProduct_id(),orderdetail.getOrder_id() );
					orderDao.updateTotalOrderDetail(updateTotalorderDetail);
					
					  double total = orderDao.calculateOrderTotal(updateTotalorderDetail.getOrder_id());
					   Order order2 = new Order(updateTotalorderDetail.getOrder_id(),total,1);// lấy tạm là 1 vì user_id trong trường hợp này cũng không cần
					   orderDao.updateOrder(order2);

		    plus = null;
		    remove = null;
		}
		if(plus != null) {
			orderDao.updateQuantityByPlus(orderdetail);
			orderdetail = orderDao.getOrderdetail(order_id);
			Orderdetail updateTotalorderDetail = new Orderdetail(orderdetail.getPrice(),orderdetail.getQuantity(),orderdetail.getPrice()*(orderdetail.getQuantity()),orderdetail.getProduct_id(),orderdetail.getOrder_id() );
			orderDao.updateTotalOrderDetail(updateTotalorderDetail);
			
			double total = orderDao.calculateOrderTotal(updateTotalorderDetail.getOrder_id());
			   Order order2 = new Order(updateTotalorderDetail.getOrder_id(),total,1);// lấy tạm là 1 vì user_id trong trường hợp này cũng không cần
			   orderDao.updateOrder(order2);
			   
			minus =null;
			remove = null;
		}
		if(remove != null) {
			orderdetail = orderDao.getOrderdetail(order_id);
			orderDao.removeOrderdetail(orderdetail.getId());
			
			 Orderdetail updateTotalorderDetail = new Orderdetail(orderdetail.getPrice(),orderdetail.getQuantity(),orderdetail.getPrice()*(orderdetail.getQuantity()),orderdetail.getProduct_id(),orderdetail.getOrder_id() );
				orderDao.updateTotalOrderDetail(updateTotalorderDetail);
				
				  double total = orderDao.calculateOrderTotal(updateTotalorderDetail.getOrder_id());
				   Order order2 = new Order(updateTotalorderDetail.getOrder_id(),total,1);// lấy tạm là 1 vì user_id trong trường hợp này cũng không cần
				   orderDao.updateOrder(order2);
			
			
			
			minus = null;
			plus = null;
		}
		
		response.sendRedirect("cart.jsp");
	}

}
