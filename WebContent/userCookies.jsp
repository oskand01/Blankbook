<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.UserBean"%>

<%

if (session.getAttribute("cookies") == null) {

	out.print("<div class=\"cookie-selector d-flex align-items-center justify-content-center\">");
	out.print("<div class=\"cookie-body shadow-2 bg-white border border-warning\"><h2>This website uses cookies</h2>");
	out.print("<h4 class=\"cookie-sub\">to enhance user experience</h4>");
	out.print("<form action=\"CookieHandler\" method=\"get\"><div class=\"btn-group shadow-2\">");
	out.print(
	"<input type=\"radio\" class=\"btn-check\" name=\"cookies\" id=\"option1\" value=\"yes\" autocomplete=\"off\" />");
	out.print("<label class=\"btn btn-success\" for=\"option1\">Accept</label>");
	out.print(
	"<input type=\"radio\" class=\"btn-check\" name=\"cookies\" id=\"option2\" autocomplete=\"off\" value=\"no\" />");
	out.print("<label class=\"btn btn-danger\" for=\"option2\">Decline</label></div>");
	out.print("<input class=\"btn btn-dark\" type=\"submit\" value=\"Confirm\"></form></div></div>");
}
%>
















