package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.userDao;
import Model.User;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		userDao userDao = new userDao();
		
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();
		String remember = request.getParameter("remember");
		
		
		Cookie cookieEmail = new Cookie("cookieEmail", email);
		Cookie cookiePass = new Cookie("cookiePass", password);
		Cookie cookieRemember = new Cookie("cookieRemember", remember);
		
		if(remember != null) {
			
			cookieEmail.setMaxAge(60*60*24); // 1 ngay
			cookiePass.setMaxAge(60*60*24); // 1 ngay
			cookieRemember.setMaxAge(60*60*24);
		}
		else {
			cookieEmail.setMaxAge(0);
			cookiePass.setMaxAge(0); 
			cookieRemember.setMaxAge(0);
		}
		
		response.addCookie(cookieEmail);
		response.addCookie(cookiePass);
		response.addCookie(cookieRemember);
		
		User user = userDao.getUserByEmailAndPassword(email, password);
		HttpSession session = request.getSession();
		
		
		User userAdmin = userDao.getUserByEmailAndPasswordAdmin(email, password);
		
		
		if(user != null) {
			session.setAttribute("user", user);
			session.setMaxInactiveInterval(60*60*24); // hạn 1 ngày
			response.sendRedirect("index.jsp");
		} else if (userAdmin != null) {
			session.setAttribute("userAdmin", userAdmin);
			session.setMaxInactiveInterval(60*60*24); // hạn 1 ngày
			response.sendRedirect("/shopshoe/admin/trang-chu.jsp");
		}
		else {
			request.setAttribute("email", email);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		
		
		
	}

}
