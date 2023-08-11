package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.userDao;
import Model.User;

/**
 * Servlet implementation class registerServlet
 */
@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		userDao userDao = new userDao();
		String username = request.getParameter("username").trim();
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();
		
		User userEmail = userDao.getUserByEmail(email);
		if(userEmail != null ) {
		  // khác null ,có nghĩa được đăng ký rồi, nên hủy ko cho đăng ký nữa
			request.setAttribute("user",userEmail);
		}
		else {
			User user = new User(username, email, password);
			userDao.addUser(user);
			request.setAttribute("susscess", "Chúc mừng bạn đăng ký tài khoản thành công");
		}
		
		
		request.getRequestDispatcher("register.jsp").forward(request, response);
		
		
	}

}
