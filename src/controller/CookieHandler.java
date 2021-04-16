package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CookieHandler
 */
@WebServlet("/CookieHandler")
public class CookieHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CookieHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String userCookies = request.getParameter("cookies");
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		
		if(userCookies != null) {
			
			if(userCookies.equals("yes")) {
				Cookie cookie = new Cookie("STYLE", "light");
				response.addCookie(cookie);
				session.setAttribute("cookies","yes");
			
			} else {
				session.setAttribute("cookies","no");
			}
		} 
		
		
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public static void createCookie(HttpServletRequest request, HttpServletResponse response, String theme) throws ServletException, IOException {
		
		Cookie cookie = new Cookie("STYLE", theme);
		cookie.setMaxAge(60 * 24 * 3600);
		
		response.addCookie(cookie);
	}

	public static boolean isDarkMode(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("user") != null && request.getCookies() != null) {
			Cookie[] cookies = request.getCookies();
			for(Cookie c : cookies) {
				if(c.getName().equals("STYLE") && c.getValue().equals("dark")) {
					return true;
				}
			}
		} else {
			return false;
		}
		
		// TODO Auto-generated method stub
		return false;
	}

	public static void createSearchCookie(HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		Cookie cookie = new Cookie("SEARCH", "timer");
		cookie.setMaxAge(60);
		
		response.addCookie(cookie);
	}
	
	

}
