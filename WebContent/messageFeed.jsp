<%@ page import="model.MessageBean"%>
<%@ page import="java.util.ArrayList"%>

<div class="card-container">

	<%
	
	if(request.getAttribute("messages") != null) {
		ArrayList<MessageBean> messages = (ArrayList<MessageBean>) request.getAttribute("messages");
		
		for(MessageBean m: messages) {
			out.print("<div class=\"card bg-light\">");
			out.print("<div class=\"card-body\">");
			out.print("<div class=\"card-top card-header\">");
			out.print("<div class=\"rounded-circle bg-white\"><i class=\"fas fa-user-alt fa-sm\"></i></div>");
			out.print("<div class=\"subtitle\"><h6 class=\"card-subtitle mb-2 text-muted\">" + m.getUserName() + "</h6></div>");
			out.print("<div class =\"date-time\">");
			out.print("<p class=\"time\">" + m.getTime() + "</p></div>");
			out.print("</div>");
			out.print("<p class=\"card-text\">" + m.getMessage());
			
			if(m.getTag() != null) {
				out.print("<a href=\"http://localhost:8080/Blankbook/MessageHandler?tag="+ m.getTag().replace("#", "%23")     + "\" class=\"tag\">" + m.getTag().toUpperCase() + "</a>");
				
			}
			
			out.print("</p>");		
			out.print("</div></div>");
		}
		
		request.setAttribute("messages", session.getAttribute("messages"));
	} 
	

	%>

</div>