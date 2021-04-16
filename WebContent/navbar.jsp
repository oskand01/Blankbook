<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		
		<a class="navbar-brand" href="main.jsp"><%=session.getAttribute("userName")%></a>
			
		 <span class="logo-container"><a class="logo" href="main.jsp">Blankbook</a></span>

		<form class="d-flex input-group w-auto tag-search" action="<%=request.getContextPath() %>/MessageHandler" method="get">
			<div class="input-group rounded">
				<input type="search" class="form-control rounded search"
					placeholder="Search by #tag" aria-label="Search"
					aria-describedby="search-addon" name="tag" pattern="(?![0-9_]+\b)([#a-zA-Z0-9_-]{1})([a-zA-Z0-9_-]{1,30})(\b|\r)"/> <span
					class="input-group-text border-0" id="search-addon"> <i
					class="fas fa-search" ></i>
				</span>
			</div>
		</form>
	</div>
</nav>

