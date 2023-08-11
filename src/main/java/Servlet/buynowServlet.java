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

/**
 * Servlet implementation class buynowServlet
 */
@WebServlet("/buynowServlet")
public class buynowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public buynowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idproduct = request.getParameter("idproductcheckout");
		
		int id = -1;
		if(idproduct != null) {
			id = Integer.parseInt(idproduct);
		}
		
		productDao productDao = new productDao();
		
		Product product = productDao.getProductById(id);
		
		request.setAttribute("buyproduct", product);
		request.getRequestDispatcher("buynow.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		orderDao orderDao = new orderDao();
		productDao productDao = new productDao();

		String useridString = request.getParameter("user_id");
		String product_idString = request.getParameter("product_id");
		
		
		
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phone = request.getParameter("tel");
		String note = request.getParameter("note");
		
		
		
		Product product = productDao.getProductById(Integer.parseInt(product_idString));
		
		// ko đăng nhập
		if(!useridString.isEmpty() || useridString != null) {
		
			
			Order order1 = new Order(fullname, email, phone, address, note,product.getDiscount(),Integer.parseInt(useridString));
			orderDao.addOrderBuyNow(order1);	
			int order_id = orderDao.getIdOrderByUserLatest(Integer.parseInt(useridString));
			
			Orderdetail orderdetail = new Orderdetail(product.getDiscount(), 1,product.getDiscount(), product.getId(), order_id,1);
			
			orderDao.addOrderdetailStatus(orderdetail);
			productDao.updateQuantity(product.getId(), 1);
		}
      	
		HttpSession session = request.getSession();
		
		session.setAttribute("seccess", "Đặt hàng thành công");
		response.sendRedirect("blank.jsp");
		
		
		
	}

}
