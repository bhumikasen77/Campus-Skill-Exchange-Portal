<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.campusSkill.model.Message" %>
	<%@page import="com.campusSkill.model.User" %>
	<%@ page import="java.util.*" %>
	<%
	List<Message> list = (List<Message>)request.getAttribute("messageList");
	User us = (User) session.getAttribute("user");
	int currentUserId = us.getId();
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Skill Chat</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f4f7fc;
}
.dark-mode .bg-white {
	background-color: #1e1e1e !important;
}

body.dark-mode {
	background: black !important;
	color: white !important;
}
/*
.dark-mode {
	background-color: #121212 !important;
	color: white !important;
	min-height: 100vh;
}*/
.dark-mode .container, .dark-mode .card, .dark-mode .chat-container {
	background-color: #1e1e1e !important;
	color: white !important;
}

.dark-mode input, .dark-mode textarea {
	background-color: #2b2b2b !important;
	color: white !important;
	border: 1px solid #555 !important;
}

.chat-container {
	max-width: 850px;
	margin: 40px auto;
	background: white;
	border-radius: 15px;
	box-shadow: 0 4px 15px rgba(0,0,0,0.08);
	overflow: hidden;
}

.chat-header {
	background: #0d6efd;
	color: white;
	padding: 18px 25px;
	font-size: 22px;
	font-weight: 600;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.chat-body {
	height: 500px;
	overflow-y: auto;
	padding: 25px;
	background: #f8f9fc;
}

.message {
	max-width: 70%;
	padding: 12px 16px;
	border-radius: 15px;
	margin-bottom: 15px;
	font-size: 15px;
	word-wrap: break-word;
}

.sender {
	background: #0d6efd;
	color: white;
	margin-left: auto;
	border-bottom-right-radius: 5px;
}

.receiver {
	background: #e9ecef;
	color: #333;
	margin-right: auto;
	border-bottom-left-radius: 5px;
}

.message-time {
	font-size: 12px;
	margin-top: 5px;
	opacity: 0.8;
}

.chat-footer {
	padding: 18px;
	background: white;
	border-top: 1px solid #ddd;
}

.message-input {
	border-radius: 25px;
	padding: 12px 18px;
}

.send-btn {
	border-radius: 25px;
	padding: 10px 22px;
	font-weight: 600;
}
</style>

</head>
<body>

  <%
	String succ = (String) session.getAttribute("succMsg");
	if (succ != null) {
	%>
	<div class="alert alert-success text-center">
		<%=succ%>
	</div>
	<%
	session.removeAttribute("succMsg");
	}
	%>

	<%
	String fail = (String) session.getAttribute("failedMsg");
	if (fail != null) {
	%>
	<div class="alert alert-danger text-center">
		<%=fail%>
	</div>
	<%
	session.removeAttribute("failedMsg");
	}
	%> 


<div class="container">

	<div class="chat-container">

		<!-- Header -->
		<div class="chat-header">

			<span>Let's Chat</span>

			<a href="dashboard.jsp"
				class="btn btn-light btn-sm">
				Back
			</a>

		</div>

		<!-- Chat Messages -->
		<div class="chat-body">

			<!-- Sender Message -->
			<%
			for(Message msg : list){
				if(msg.getSenderId()==currentUserId){
				%>
				<div class="message sender">

				<%=msg.getMessages() %>

				<div class="message-time">
					<%=msg.getSent_at() %>
				</div>

			</div>	
			<%
				}else{
				%>
					<div class="message receiver">

						<%=msg.getMessages() %>

						<div class="message-time">
							<%=msg.getSent_at() %>
						</div>

					</div>
					<% 
				}
			}
			%>
			
		

			

		</div>

		<!-- Message Form -->
		<div class="chat-footer">

			<form action="sendMessage" method="post">
                <input type="hidden" name="req_id" value="<%=request.getAttribute("rid")%>">
				<div class="input-group">

					<input type="text"
						name="message"
						class="form-control message-input"
						placeholder="Type your message..."
						required>

					<button type="submit"
						class="btn btn-primary send-btn">
						Send
					</button>

				</div>

			</form>

		</div>

	</div>

</div>
<script>
		function toggleDarkMode() {

			document.body.classList.toggle("dark-mode");

			if (document.body.classList.contains("dark-mode")) {
				localStorage.setItem("theme", "dark");
			} else {
				localStorage.setItem("theme", "light");
			}
		}

		if (localStorage.getItem("theme") === "dark") {
			document.body.classList.add("dark-mode");
		}
	</script>
</body>
</html>