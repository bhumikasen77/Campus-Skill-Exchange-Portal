<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.campusSkill.model.Admin"%>

<%
Admin ad = (Admin) session.getAttribute("admin");

if (ad == null) {
	response.sendRedirect(request.getContextPath() + "/adminPages/adminLogin.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body{
	margin:0;
	background:#f4f7fc;
}

.sidebar{
	position:fixed;
	top:0;
	left:0;
	width:230px;
	height:100vh;
	background:#0d6efd;
	padding-top:20px;
	overflow-y:auto;
}

.sidebar h3{
	color:white;
	text-align:center;
	margin-bottom:30px;
	font-weight:700;
}

.sidebar a{
	display:block;
	color:white;
	text-decoration:none;
	padding:14px 25px;
	font-size:16px;
	transition:0.3s;
}

.sidebar a:hover{
	background:rgba(255,255,255,0.2);
}
.dashboard-title {
	font-weight: 700;
	color: #0d6efd;
}

.dashboard-card {
	border: none;
	border-radius: 15px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
	transition: 0.3s;
}

.dashboard-card:hover {
	transform: translateY(-5px);
}

.card-number {
	font-size: 35px;
	font-weight: 700;
	color: #0d6efd;
}

.card-title {
	font-size: 18px;
	font-weight: 600;
	color: #555;
}
</style>

</head>
<body>
    <!-- Sidebar -->
	<div class="sidebar">

		<h3>Admin Panel</h3>

		<a href="adminDashboard">
			Dashboard
		</a>

		<a href="adminUsers">
			View Users
		</a>

		<a href="adminSkills">
			View Skills
		</a>

		<a href="adminRequests">
			View Requests
		</a>


		<a href="adminLogout">
			Logout
		</a>

	</div>
    
	<div style="margin-left:250px; padding:30px;">

	<div class="container-fluid">

		<div class="d-flex justify-content-between align-items-center mb-5">

			<h2 class="dashboard-title">Admin Dashboard</h2>

			<h6 class="text-primary">
				Welcome Admin, <%=ad.getEmail()%>
			</h6>

			<a href="adminLogout" class="btn btn-danger">
				Logout
			</a>

		</div>

		<div class="row g-4">


	
<% int totalUsers = (Integer)request.getAttribute("totalUsers");
   int totalSkills = (Integer) request.getAttribute("totalSkills");
   int totalRequests = (Integer) request.getAttribute("totalRequests");
   int totalMessage =  (Integer) request.getAttribute("totalmessages");
%>
			<!-- Total Users -->
			<div class="col-md-3">

				<div class="card dashboard-card text-center p-4">

					<div class="card-number">
					<%=totalUsers %>
					</div>

					<div class="card-title">Total Users</div>

				</div>

			</div>

			<!-- Total Skills -->
			<div class="col-md-3">

				<div class="card dashboard-card text-center p-4">

					<div class="card-number"><%=totalSkills %></div>

					<div class="card-title">Total Skills</div>

				</div>

			</div>

			<!-- Total Requests -->
			<div class="col-md-3">

				<div class="card dashboard-card text-center p-4">

					<div class="card-number"><%=totalRequests %></div>

					<div class="card-title">Total Requests</div>

				</div>

			</div>

			<!-- Total Messages -->
			<div class="col-md-3">

				<div class="card dashboard-card text-center p-4">

					<div class="card-number"><%=totalMessage %></div>

					<div class="card-title">Total Messages</div>

				</div>

			</div>

		</div>

	</div>
</div>
</body>
</html>