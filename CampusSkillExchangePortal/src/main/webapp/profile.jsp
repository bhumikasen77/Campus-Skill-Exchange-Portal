<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.campusSkill.model.User" %>

<%
User us = (User) session.getAttribute("user");
if(us==null){
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body{
	background:#f4f7fc;
	font-family:Arial, sans-serif;
}

.profile-card{
	border:none;
	border-radius:18px;
	box-shadow:0 6px 18px rgba(0,0,0,0.08);
}

.profile-header{
	background:linear-gradient(135deg,#0d6efd,#4dabf7);
	color:white;
	border-radius:18px 18px 0 0;
	padding:30px;
	text-align:center;
}

.avatar{
	width:90px;
	height:90px;
	border-radius:50%;
	background:white;
	color:#0d6efd;
	font-size:36px;
	font-weight:bold;
	display:flex;
	align-items:center;
	justify-content:center;
	margin:auto;
	margin-bottom:12px;
}

.label{
	font-weight:600;
	color:#555;
}

.value{
	font-weight:500;
	color:#222;
}

.info-box{
	padding:14px 0;
	border-bottom:1px solid #eee;
}

.info-box:last-child{
	border-bottom:none;
}

.btn-custom{
	border-radius:25px;
	padding:10px 20px;
	font-weight:600;
}
</style>

</head>
<body>
<%
String msg = (String)session.getAttribute("succMsg");
if(msg!=null){
	%>
	<div class="alert alert-success text-center">
	<%=msg %>
	</div>
	<% 
	session.removeAttribute("succMsg");
}
%>

<%
String dlt = (String)session.getAttribute("failedMsg");
if(dlt!=null){
	%>
	<div class="alert alert-danger text-center">
	<%=dlt %>
	</div>
	<% 
	session.removeAttribute("failedMsg");
}
%>
<div class="container py-5">

	<div class="row justify-content-center">

		<div class="col-md-8 col-lg-7">

			<div class="card profile-card">

				<!-- Header -->
				<div class="profile-header">

					<div class="avatar">
					 	<%=us.getName().substring(0, 1).toUpperCase() %>
					</div>

					<h3 class="mb-1">
						User Name
					</h3>

					<p class="mb-0">
						Welcome to your profile
					</p>

				</div>

				<!-- Body -->
				<div class="card-body p-4">

					<div class="info-box">
						<span class="label">Full Name:</span><br>
						<span class="value"><%=us.getName() %></span>
					</div>

					<div class="info-box">
						<span class="label">Email:</span><br>
						<span class="value"><%=us.getEmail() %></span>
					</div>

					<div class="info-box">
						<span class="label">Department:</span><br>
						<span class="value"><%=us.getDepartment() %></span>
					</div>

					<div class="info-box">
						<span class="label">Year:</span><br>
						<span class="value"><%=us.getYear() %></span>
					</div>

					<div class="info-box">
						<span class="label">Bio:</span><br>
						<span class="value">
							<%=us.getBio() %>
						</span>
					</div>
					
					<div class="info-box">
						<span class="label">Status:</span><br>
						<span class="value">
							<%=us.getStatus() %>
						</span>
					</div>

					<!-- Buttons -->
					<div class="text-center mt-4">

						<a href="dashboard.jsp"
							class="btn btn-outline-primary btn-custom me-2">
							← Dashboard
						</a>

						<a href="editProfile.jsp"
							class="btn btn-primary btn-custom">
							Edit Profile
						</a>

					</div>

				</div>

			</div>

		</div>

	</div>

</div>

</body>
</html>