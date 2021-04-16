package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserBean;

/**
 * Servlet implementation class LogoutHandler
 */
@WebServlet("/LogoutHandler")
public class LogoutHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getSession().getAttribute("user") != null) {

			// Get the session
			HttpSession session = request.getSession();

			// get the user data
			UserBean bean = (UserBean) session.getAttribute("user");
			// and clear it
			bean.resetUserBean();

			// remove the user
			session.removeAttribute("User");
			// turn off the session
			session.invalidate();
			// goto index
			response.sendRedirect("index.jsp");

		}else {
			// this should only happen if you try to goto "/Logout" manually 
			response.sendRedirect("index.jsp");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
