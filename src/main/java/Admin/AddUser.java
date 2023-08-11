package Admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.userDao;
import Model.User;

/**
 * Servlet implementation class AddUser
 */
@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUser() {
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
		
		
		String username = request.getParameter("username");
		
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		int role = Integer.parseInt(request.getParameter("role"));
		
		userDao userDao = new userDao();
		User user = new User(username,email,password,role);
		User emailUser = userDao.getUserByEmail(user.getEmail());
		
		
		if(emailUser != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("failEmail", "Email đã tồn tại. Vui lòng nhập email khác");
			
		}else {
			userDao.addUserByAdmin(user);
			
		}
		response.sendRedirect("/shopshoe/admin/manageuser.jsp");
		
	}

}
