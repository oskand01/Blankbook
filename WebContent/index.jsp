<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
// check if there is a session with an user
if (session.getAttribute("user") != null) {
	// there is one goto the login servlet
	RequestDispatcher rd = request.getRequestDispatcher("../LoginHandler");
	rd.forward(request, response);// this lands on the GET in the servlet

	
// checks if the user has a style-cookie, meaning the user previously accepted cookies
} else if(request.getCookies() != null) {
	Cookie[] cookies = request.getCookies();
	
	for(Cookie c : cookies) {
		if(c.getName().equals("STYLE")) {
			session.setAttribute("cookies", "yes");
		}
	}
}

%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	rel="stylesheet" />
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
	<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@300&display=swap"
	rel="stylesheet">
<!-- MDB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.css"
	rel="stylesheet" />
<link id="style" rel="stylesheet" href="css/style.css">

<title>Enter the Blankbook</title>
</head>
<body class="bg-light">
<jsp:include page="userCookies.jsp"></jsp:include>
	<nav class="navbar navbar-light bg-light">
		<div class="container-fluid">
			<h1 class="logo"
				style="color: #FB9DE7; text-align: center; width: 100%; position: static; margin-top: 3vh; font-weight: 200;">Blankbook</h1>

		</div>
	</nav>

	<div class="container d-flex align-items-center justify-content-center">

		<div class="login-form bg-light">
			<form action="<%=request.getContextPath()%>/LoginHandler"
				method="post">
				<!-- Email input -->
				<div class="form-outline mb-4">
					<input type="email" id="form1Example1"
						class="form-control bg-white" name="email" required /> <label
						class="form-label" for="form1Example1">Email address</label>
				</div>

				<!-- Password input -->
				<div class="form-outline mb-4">
					<input type="password" id="form1Example2"
						class="form-control bg-white" name="pass" required /> <label
						class="form-label" for="form1Example2">Password</label>
				</div>

				<!-- Submit button -->
				<button type="submit" class="btn btn-primary btn-pink btn-block">Sign
					in</button>

			</form>
		</div>

	</div>

	<!-- MDB -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.js"></script>

</body>
</html>