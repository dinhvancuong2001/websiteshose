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
import Model.User;

/**
 * Servlet implementation class checkoutServlet
 */
@WebServlet("/checkoutServlet")
public class checkoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkoutServlet() {
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
		productDao productDao = new productDao();

		String useridString = request.getParameter("user_id");
		String orderString = request.getParameter("order_id");
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phone = request.getParameter("tel");
		String note = request.getParameter("note");
		
		int order_id = -1;
		if(orderString != null) {
			order_id = Integer.parseInt(orderString);
		}
		Order order1 = new Order(order_id, fullname, email, phone, address, note,1);
		
       
	    List<Orderdetail> orderdetails = null;
      	orderdetails = orderDao.getListOrderdetailOrderBy(order_id);
      
      	
      	orderDao.updateOrderCheckout(order1);
      	
      		
        for (Orderdetail orderdetail : orderdetails) {
			orderDao.updateStatusOrderdetail(orderdetail.getId(), 1);
			productDao.updateQuantity(orderdetail.getProduct_id(),orderdetail.getQuantity());
		}
      	
		HttpSession session = request.getSession();
		
		session.setAttribute("seccess", "Đặt hàng thành công");
		response.sendRedirect("blank.jsp");
		
	}

}
