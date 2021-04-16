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

/**
 * Servlet implementation class MessageHandler
 */
@WebServlet("/MessageHandler")
public class MessageHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MessageHandler() {
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
		
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null) {
			response.sendRedirect("LogoutHandler");
		} else {
			
			// not so proud of this one
			@SuppressWarnings("unchecked")
			ArrayList<MessageBean> messages = (ArrayList<MessageBean>) session.getAttribute("messages");
			
			//removes whitespace
			String tag = request.getParameter("tag").strip();
			
			
			if(!tag.startsWith("#")) {
				tag = "#" + tag;
			}

			if (SQLMessageCon.connectSQL()) {
				// get messages by tag
				ArrayList<MessageBean> filtered = SQLMessageCon.getMessagesByTag(tag);
				
				// if match set "messsages" to filtered
				if (filtered.size() > 0) {
					System.out.println("got filtered");
					request.setAttribute("messages", filtered);
					
				// else sets "messages" to all messages stored in session	
				} else {
					request.setAttribute("messages", messages);
					
				}
				
				
				RequestDispatcher rd = request.getRequestDispatcher("main.jsp");

				rd.forward(request, response);
			}
			
		}
		
		
		
		
		

	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		MessageBean bean = new MessageBean();
		HttpSession session = request.getSession();

		String message = request.getParameter("message");
		String userName = (String) session.getAttribute("userName");
		String tag = request.getParameter("tag").strip();
		
		if(tag != "" && !tag.startsWith("#")) {
			tag = "#" + tag;
		}
		
		bean.setMessage(message);
		bean.setUserName(userName);
		bean.setTag(tag);
		
		//adds new message to database and then gets all messages from the database on the same connection
		if (SQLMessageCon.connectSQL() && !message.isBlank()) {
			SQLMessageCon.addMsg(bean);
			ArrayList<MessageBean> messages = SQLMessageCon.getMessages();
			session.setAttribute("messages", messages);
			request.setAttribute("messages", messages);

		}
		RequestDispatcher rd = request.getRequestDispatcher("main.jsp");

		rd.forward(request, response);

	}

}
