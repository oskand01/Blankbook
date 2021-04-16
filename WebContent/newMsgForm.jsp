<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- Name input -->

<div id="msg-form" class="msg-form bg-light">
	<div class="btn-div">
		<button type="button" id="btn-close" class="btn-close"
			aria-label="Close"></button>

	</div>

	<form action="<%=request.getContextPath() %>/MessageHandler"
		method="post">

		<!-- Message input -->
		<div class="">
			<textarea class="bg-white msg-input" id="message" rows="4"
				name="message" maxlength="500" placeholder="What's on your mind?" required></textarea>
			
		</div>
		<div class="tag-input">
			<input type="text" id="form1" class="bg-white msg-input" name="tag" placeholder="#Tag (optional)" pattern="(?![0-9_]+\b)([#a-zA-Z0-9_-]{1})([a-zA-Z0-9_-]{1,30})(\b|\r)"/> 
		</div>

		<!-- Submit button -->
		<button type="submit" id="submit-msg"
			class="btn btn-primary btn-pink btn-block mb-4">Send</button>
	</form>
</div>