package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.SQLMessageCon;
import model.MessageBean;
import model.UserBean;

/**
 * Servlet implementation class LoginHandler
 */
@WebServlet("/LoginHandler")
public class LoginHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginHandler() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");

		System.out.println("email: " + email + "\npassword: " + pass);

		// Set values of the user bean
		UserBean bean = new UserBean();
		bean.setEmail(email);
		bean.setPassword(pass);

		// Check if the email and pass is correct.
		if (bean.validate(bean)) {

			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(1200);

			
			// the user is logged in or not
			session.setAttribute("user", bean);

			request.setAttribute("user", bean);
			
			
			//does the user have dark mode
			if (CookieHandler.isDarkMode(request, response)) {
				bean.setStyleSheet("dark-style.css");
			}
			// RequestDispatcher for when we want to send the request to the new page

			ArrayList<MessageBean> messages = null;
			
			//get all messages
			if (SQLMessageCon.connectSQL()) {
				messages = SQLMessageCon.getMessages();
				CookieHandler.createSearchCookie(response);
				session.setAttribute("messages", messages);
				request.setAttribute("messages", messages);

			}

			RequestDispatcher rd = request.getRequestDispatcher("main.jsp");

			rd.forward(request, response);

			// response.sendRedirect only goes to the new page, and nothing else

		} else {
			// go to an error page that includes the index page to have the user try again
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}

	}

}
