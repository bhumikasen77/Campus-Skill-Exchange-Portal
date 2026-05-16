<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.campusSkill.model.Request"%>
<%@ page import="com.campusSkill.model.Admin"%>

<%
Admin ad = (Admin) session.getAttribute("admin");

if(ad == null){
	response.sendRedirect(request.getContextPath()+"adminLogin.jsp");
	return;
}

List<Request> list = (List<Request>)request.getAttribute("requestList");
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

.main-content{
	margin-left:250px;
	padding:30px;
}

.table-container{
	background:white;
	padding:25px;
	border-radius:15px;
	box-shadow:0 4px 12px rgba(0,0,0,0.08);
}

.page-title{
	font-weight:700;
	color:#0d6efd;
	margin-bottom:25px;
}

.table th{
	background:#0d6efd;
	color:white;
}

</style>

</head>
<body>

	<!-- Sidebar -->
	<div class="sidebar">

		<h3>Admin Panel</h3>

		<a href="<%=request.getContextPath()%>/adminDashboard">
			Dashboard
		</a>

		<a href="<%=request.getContextPath()%>/adminUsers">
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

	<!-- Main Content -->
	<div class="main-content">

		<div class="table-container">

			<h2 class="page-title">All Skill Requests</h2>

			<table class="table table-bordered table-hover">

				<thead>

					<tr>

						<th>Request ID</th>

						<th>Sender</th>

						<th>Receiver</th>

						<th>Skill Name</th>

						<th>Status</th>

					</tr>

				</thead>

				<tbody>

				<%
				if(list != null){

					for(Request r : list){
				%>

					<tr>

						<td><%=r.getReq_id()%></td>

						<td><%=r.getSenderName()%></td>

						<td><%=r.getRecieverName()%></td>

						<td><%=r.getSkillName()%></td>

						<td><%=r.getStatus()%></td>

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