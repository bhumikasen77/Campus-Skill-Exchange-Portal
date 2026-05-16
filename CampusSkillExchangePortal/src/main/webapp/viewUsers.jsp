<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.campusSkill.model.User"%>
<%@ page import="com.campusSkill.model.Admin"%>

<%
Admin ad = (Admin) session.getAttribute("admin");

if (ad == null) {
	response.sendRedirect(request.getContextPath() + "adminLogin.jsp");
	return;
}

List<User> list = (List<User>) request.getAttribute("userList");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Users</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
margin:0;
	background: #f4f7fc;
}

.search-box{
	display:flex;
	justify-content:center;
	align-items:center;
	gap:10px;
	margin-top:20px;
	margin-bottom:25px;
}
.search-input {
	width: 350px;
	border-radius: 10px;
	padding: 10px 15px;
	border: 1px solid #ccc;
}

.search-btn {
	border-radius: 10px;
	padding: 10px 20px;
	font-weight: 600;
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

.sidebar h3 {
	color: white;
	text-align: center;
	margin-bottom: 30px;
	font-weight: 700;
}

.sidebar a {
	display: block;
	color: white;
	text-decoration: none;
	padding: 14px 25px;
	font-size: 16px;
	transition: 0.3s;
}

.sidebar a:hover {
	background: rgba(255, 255, 255, 0.2);
}

.main-content {
	margin-left: 240px;
	padding: 30px;
}

.table-container {
	background: white;
	padding: 25px;
	border-radius: 15px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
}

.page-title {
	font-weight: 700;
	color: #0d6efd;
	margin-bottom: 25px;
}

.table th {
	background: #0d6efd;
	color: white;
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
	<div class="alert alert-success text-center">
		<%=fail%>
	</div>

	<%
	session.removeAttribute("failedMsg");
	}
	%>

	<form action="searchUser" method="get" class="search-box">

		<input type="text" name="keyword" class="form-control search-input"
			placeholder="Search user by name">

		<button type="submit" class="btn btn-primary search-btn">

			Search</button>

	</form>

	<!-- Sidebar -->
	<div class="sidebar">

		<h3>Admin Panel</h3>

		<a href="adminDashboard"> Dashboard </a> <a href="adminUsers">
			View Users </a> <a href="adminSkills"> View Skills </a> <a
			href="adminRequests"> View Requests </a> <a href="adminLogout">
			Logout </a>

	</div>

	<!-- Main Content -->
	<div class="main-content">

		<div class="table-container">

			<h2 class="page-title">All Registered Users</h2>

			<table class="table table-bordered table-hover">

				<thead>

					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Department</th>
						<th>Bio</th>
						<th>Status</th>
						<th>Action</th>
					</tr>

				</thead>

				<tbody>

					<%
					if (list != null) {

						for (User u : list) {
					%>

					<tr>

						<td><%=u.getId()%></td>

						<td><%=u.getName()%></td>

						<td><%=u.getEmail()%></td>

						<td><%=u.getDepartment()%></td>

						<td><%=u.getBio()%></td>

						<td><%=u.getStatus()%></td>

						<td><a href="deleteUser?id=<%=u.getId()%>"
							class="btn btn-danger btn-sm"> Delete </a></td>

					</tr>

					<%
					}
					}
					%>

				</tbody>

			</table>

		</div>

	</div>

</body>
</html>