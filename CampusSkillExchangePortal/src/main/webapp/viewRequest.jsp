<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.campusSkill.model.Request"%>
<%@page import="java.util.*"%>
<%
List<Request> list = (List<Request>) session.getAttribute("requestList");
if (list == null) {
	response.sendRedirect("dashboard.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Requests</title>

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

.badge-status {
	font-size: 14px;
	padding: 4px 10px;
	border-radius: 20px;
	display: inline-block;
	width: 120px;
}

.info-label {
	font-weight: 600;
	color: #555;
}

.top-btn {
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

			<h2 class="page-title">Received Requests</h2>

			<div>
				<a href="dashboard.jsp" class="btn btn-outline-primary top-btn">
					← Dashboard </a>
			</div>

		</div>

		<!-- Success Message -->
		<%
		String succ = (String) session.getAttribute("succMsg");
		if (succ != null) {
		%>
		<div class="alert alert-success text-center">Request accepted
			successfully</div>
		<%
		session.removeAttribute("succMsg");
		}
		%>

		<!-- Failure Message -->

		<%
		String fail = (String) session.getAttribute("failedMsg");
		if (fail != null) {
		%>
		<div class="alert alert-danger text-center">Request rejected</div>
		<%
		session.removeAttribute("failedMsg");
		}
		%>
		<!-- Empty Request Message-->

		<%
		if (list.isEmpty()) {
		%>
		<div class="alert alert-warning text-center">No requests found</div>
		<%
		}
		%>
		<!-- Request Card -->

		<%
		for (Request requ : list) {
		%>
		<div class="card request-card mb-4 p-4">

			<div class="d-flex justify-content-between align-items-center mb-3">

				<h4 class="text-primary mb-0">Skill Request</h4>



			</div>



			<div class="row mb-3">

				<div class="col-md-6">
					<span class="info-label">Sender:</span>
					<%=requ.getSenderName()%>
				</div>

				<div class="col-md-6">
					<span class="info-label">Skill:</span>
					<%=requ.getSkillName()%>
				</div>

			</div>

			<%
			if (requ.getStatus().equals("pending")) {
			%>
			<div class="text-end">

				<a href="accept?rid=<%=requ.getReq_id()%>&status=accepted"
					class="btn btn-success btn-sm"> Accept </a> <a
					href="reject?rid=<%=requ.getReq_id()%>&status=rejected"
					class="btn btn-danger btn-sm"> Reject </a>
			</div>

			<%
			} else if (requ.getStatus().equals("accepted")) {
			%>
			<div class="text-end mt-2">
				<span class="badge bg-success badge-status"> Accepted </span>
			</div>
			<div style="display: inline-block; margin-top:-30px;">

				<a href="openChat?rid=<%=requ.getReq_id()%>"
					class="btn btn-primary btn-sm"> Open Chat </a>

			</div>
			<%
			} else {
			%>
			<div class="text-end mt-2">
				<span class="badge bg-danger badge-status"> Rejected </span>
			</div>
			<%
			}
			%>


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