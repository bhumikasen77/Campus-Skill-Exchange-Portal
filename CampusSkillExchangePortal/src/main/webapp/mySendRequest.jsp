<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.campusSkill.model.Request"%>
<%@page import="java.util.*"%>
<%
List<Request> list = (List<Request>) session.getAttribute("MySendRequestlist");
if (list == null) {
	response.sendRedirect("dashboard.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Sent Requests</title>

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

.page-title {
	font-weight: 700;
	color: #0d6efd;
}

.request-card {
	border: none;
	border-radius: 15px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
	transition: 0.3s;
}

.request-card:hover {
	transform: translateY(-4px);
}

.info-label {
	font-weight: 600;
	color: #555;
}

.badge-status {
	font-size: 13px;
	padding: 5px 10px;
	border-radius: 20px;
	display: inline-block;
	width: auto;
}

.top-btn {
	border-radius: 25px;
	padding: 8px 18px;
	font-weight: 600;
}

.search-btn {
	border-radius: 25px;
	padding: 8px 18px;
	font-weight: 600;
}
</style>

</head>
<body>

	<div class="container py-5">

		<!-- Top Section -->
		<div class="d-flex justify-content-between align-items-center mb-4">

			<h2 class="page-title">My Sent Requests</h2>

			<div>
				<a href="dashboard.jsp" class="btn btn-outline-primary top-btn">
					← Dashboard </a>
			</div>

		</div>

		<!-- Empty Request Message -->
		<%
		if (list.isEmpty()) {
		%>
		<div class="alert alert-warning text-center">No sent requests
			found</div>
		<%
		}
		%>

		<%
		for (Request reqList : list) {
		%>

		<div class="card request-card mb-4 p-4">

			<div class="d-flex justify-content-between align-items-center mb-3">

				<h4 class="text-primary mb-0">Skill Learning Request</h4>

			</div>

			<div class="row mb-3">

				<div class="col-md-6">
					<span class="info-label">Receiver:</span>
					<%=reqList.getRecieverName()%>
				</div>

				<div class="col-md-6">
					<span class="info-label">Skill:</span>
					<%=reqList.getSkillName()%>
				</div>

			</div>

			<!-- Pending Badge -->
			<div class="d-flex justify-content-between align-items-center mt-2">
				<span class="badge bg-warning text-dark badge-status"> <%=reqList.getStatus()%>
				</span>

				<%
				if (reqList.getStatus().equals("accepted")) {
				%>

				<a href="openChat?rid=<%=reqList.getReq_id()%>"
					class="btn btn-primary btn-sm ms-2 search-btn"> Let's Chat </a>

				<%
				}
				%>
			</div>


		</div>
		<%
		}
		%>
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