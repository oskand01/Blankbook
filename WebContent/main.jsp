<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.UserBean"%>
<%@ page import="model.MessageBean"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="database.SQLMessageCon"%>
<%@ page import="controller.CookieHandler"%>

<%
// Check to see if the session has a user bean.
if (session.getAttribute("user") == null) {

	// if there is not one, goto the logout servlet
	RequestDispatcher rd = request.getRequestDispatcher("LogoutHandler");
	rd.forward(request, response);

} else {

	// if there is a session , then all is well  

	// get the bean to unpack the user data

	UserBean bean = (UserBean) session.getAttribute("user");

	//store username in session
	session.setAttribute("userName", bean.getName());

	//store users style in session
	session.setAttribute("style", bean.getStyleSheet());

	//check if user has cookies and if so if the user has search cookie == got messages from database within last minute
	Boolean match = false;

	if (request.getCookies() != null) {

		Cookie[] cookies = request.getCookies();
		for (Cookie c : cookies) {
			if (c.getName().equals("SEARCH")) {
			match = true;
			}
		}
	}

	// if not get messages from database, stores in session and creates search cookie
	if (match == false && SQLMessageCon.connectSQL()) {
		session.setAttribute("messages", SQLMessageCon.getMessages());
		CookieHandler.createSearchCookie(response);

	}

	//if the list of messages to be displayed not set, gets stored messages in sessopn
	if (request.getAttribute("messages") == null) {
		request.setAttribute("messages", session.getAttribute("messages"));
	}

	StringBuffer sb = request.getRequestURL();
	session.setAttribute("url", sb);

}
%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <script defer src="style.js"></script> -->
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	rel="stylesheet" />
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@300&display=swap"
	rel="stylesheet">
<!-- MDB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.css"
	rel="stylesheet" />

<link id="style" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/<%=session.getAttribute("style")%>">

<title>Blankbook/<%=session.getAttribute("userName")%></title>
</head>

<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="bonus bg-light">
		<ul>
			<li>
				<form action="<%=request.getContextPath()%>/StyleHandler"
					method="get">
					<input type="hidden" name="style" value="style"><input
						type="submit" id="theme" value="THEME">
				</form>
			</li>
			<li><a href="<%=request.getContextPath()%>/LogoutHandler">LOGOUT</a>
			</li>
		</ul>
	</div>

	<div class="container">
		<jsp:include page="newMsgForm.jsp"></jsp:include>

		<main>
			<jsp:include page="messageFeed.jsp"></jsp:include>
		</main>

		<jsp:include page="newMsgBtn.jsp"></jsp:include>

	</div>

	<script src="<%=request.getContextPath()%>/js/index.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>
	<!-- MDB -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.js"></script>
</body>
</html>