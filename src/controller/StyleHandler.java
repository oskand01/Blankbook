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
 * Servlet implementation class StyleHandler
 */
@WebServlet("/StyleHandler")
public class StyleHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StyleHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("user") == null) {
			response.sendRedirect("LogoutHandler");
			
		} else { 
			String style = request.getParameter("style");
			
			if(style != null && style.equals("style")) {
				UserBean bean = (UserBean) session.getAttribute("user");
				
				// checks what sylesheet is in use and switches to the other one
				if(bean.getStyleSheet().equals("style.css")) {
						bean.setStyleSheet("dark-style.css");
					
					// creates cookie with style-choice
					if(session.getAttribute("cookies").equals("yes")) {
						CookieHandler.createCookie(request, response, "dark");
						
					}
				} else if(bean.getStyleSheet().equals("dark-style.css")) {
						bean.setStyleSheet("style.css");
					
					if(session.getAttribute("cookies").equals("yes")) {
						CookieHandler.createCookie(request, response, "light");
						
					}
					
				}
				
				request.setAttribute("user", bean);
				session.setAttribute("user", bean);
				
				
				
				
				response.sendRedirect("main.jsp");

				 
			}
			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
