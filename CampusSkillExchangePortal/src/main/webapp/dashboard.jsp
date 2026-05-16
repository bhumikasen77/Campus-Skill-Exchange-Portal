<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.campusSkill.model.User" %>

<%
User user = (User) session.getAttribute("user");

if(user == null){
	response.sendRedirect("login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body{
	background:#f8f9fa;
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

.sidebar{
	height:100vh;
	background:#0d6efd;
	color:white;
	padding-top:20px;
	position:fixed;
	width:240px;
}

.sidebar a{
	color:white;
	text-decoration:none;
	display:block;
	padding:14px 25px;
	font-weight:500;
	transition:0.3s;
}

.sidebar a:hover{
	background:white;
	color:#0d6efd;
}

.main-content{
	margin-left:240px;
	padding:25px;
}

.topbar{
	background:white;
	padding:15px 25px;
	border-radius:12px;
	box-shadow:0 2px 10px rgba(0,0,0,0.08);
}

.card-box{
	border:none;
	border-radius:15px;
	box-shadow:0 2px 10px rgba(0,0,0,0.08);
}
</style>

</head>

<body>

<!-- Sidebar -->
<div class="sidebar">

	<h4 class="text-center fw-bold mb-4">
		CampusSkill
	</h4>

	<a href="dashboard.jsp">🏠 Dashboard</a>
	<a href="addSkill.jsp">➕ Add Skill</a>
	<a href="viewSkill">📚 My Skills</a>
	<a href="myProfile">👤 Profile</a>
	<a href="editProfile.jsp">✏ Edit Profile</a>
	<a href="logout">🚪 Logout</a>

</div>

<!-- Main Content -->
<div class="main-content">

	<!-- Top Navbar -->
	<div class="topbar d-flex justify-content-between align-items-center mb-4">

		<div class="d-flex align-items-center gap-4">

			<h4 class="mb-0 text-primary fw-bold">
				Campus Skill Exchange Portal
			</h4>

			<a href="dashboard.jsp" class="text-decoration-none">Dashboard</a>
			<a href="viewSkill" class="text-decoration-none">My Skills</a>
			<a href="myProfile" class="text-decoration-none">Profile</a>
			<a href="request" class="text-decoration-none">View Requests</a>
			<a href="mysentrequest" class="text-decoration-none">My Sent Request</a>
			<a href="logout" class="text-decoration-none text-danger">Logout</a>

		</div>

		<div class="fw-bold">
			Welcome, <%= user.getName() %>
		</div>

	</div>

	<!-- Welcome Card -->
	<div class="card card-box p-4 mb-4">

		<h3 class="text-primary">
			Welcome, <%= user.getName() %> 👋
		</h3>

		<p class="text-muted mb-0">
			Manage your skills, profile and connect with students.
		</p>

	</div>

	<!-- Quick Cards -->
	<div class="row g-4">

		<div class="col-md-4">
			<div class="card card-box p-4 text-center">
				<h5 class="text-primary">My Skills</h5>
				<h2>3</h2>
			</div>
		</div>

		<div class="col-md-4">
			<div class="card card-box p-4 text-center">
				<h5 class="text-primary">Connections</h5>
				<h2>5</h2>
			</div>
		</div>

		<div class="col-md-4">
			<div class="card card-box p-4 text-center">
				<h5 class="text-primary">Messages</h5>
				<h2>2</h2>
			</div>
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