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
 * Servlet implementation class addOrderServlet
 */
@WebServlet("/addOrderServlet")
public class addOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addOrderServlet() {
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
		   String referer = request.getHeader("Referer"); // Lấy URL trang trước đó
		   
		   
		    HttpSession session = request.getSession();
		    User user = (User) session.getAttribute("user");
		    
		    
		    productDao productDao = new productDao();
			String idProduct = request.getParameter("idproductcart");
			int id =-1;
			if(idProduct != null) {
				id = Integer.parseInt(idProduct);
			}
			Product product = productDao.getProductById(id);
			
			// kiểm tra xem trong cart có user_id chưa, chưa thì tạo , có thì tìm id của cart có user_id đó
			
			orderDao orderDao = new orderDao();
			Order order = orderDao.getOrderByUserId(user.getId());
			
			if(order == null) {
				Order newOrder = new Order(0, user.getId());
				orderDao.addOrder(newOrder);
				 order = newOrder; // Gán cart mới tạo cho biến cart
			}
			// cập nhập lại cart
			order = orderDao.getOrderByUserId(user.getId());
			
			 // Thêm sản phẩm vào chi tiết giỏ hàng (cartDetail)
		    Orderdetail orderdetail = new Orderdetail(product.getDiscount(),1,product.getDiscount(), product.getId(),order.getId());
		    
		    Orderdetail checkOrderDetail = orderDao.getOrderDetail(orderdetail);
		    if(checkOrderDetail == null ) {
		    	orderDao.addOrderdetail(orderdetail);
		    }else {
		    	
		    	Orderdetail updateorderDetail = new Orderdetail(product.getDiscount(),checkOrderDetail.getQuantity(),product.getId(),order.getId() );
				orderDao.updateQuantityOrderDetail(updateorderDetail);
				
				checkOrderDetail = orderDao.getOrderDetail(orderdetail);
			   Orderdetail updateTotalorderDetail = new Orderdetail(product.getDiscount(),checkOrderDetail.getQuantity(),product.getDiscount()*(checkOrderDetail.getQuantity()),product.getId(),order.getId() );
			   orderDao.updateTotalOrderDetail(updateTotalorderDetail);
				
			}
		    
			
		  // Cập nhật tổng giá trị giỏ hàng cart (nếu cần thiết)
		  
		 
		   double total = orderDao.calculateOrderTotal(order.getId());
		
		  
		   Order order2 = new Order(order.getId(),total,order.getUser_id());
		   orderDao.updateOrder(order2);
			
		   
		   session.setAttribute("cartMessage", "Thêm vào giỏ hàng thành công");
			response.sendRedirect(referer);
	}

}
