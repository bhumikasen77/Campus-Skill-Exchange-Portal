<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.campusSkill.model.Skills"%>
<%@page import="com.campusSkill.model.User"%>
<%@page import="java.util.*"%>
<%
List<Skills> list = (List<Skills>) request.getAttribute("skillList");

if (list == null) {
	list = (List<Skills>) session.getAttribute("skillList");
}

if (list == null) {
	response.sendRedirect("dashboard.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Skills</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f4f7fc;
}

.page-title {
	font-weight: 700;
	color: #0d6efd;
}

.skill-card {
	border: none;
	border-radius: 15px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
	transition: 0.3s;
}

.skill-card:hover {
	transform: translateY(-4px);
}

.badge-status {
	font-size: 14px;
	padding: 8px 12px;
	border-radius: 20px;
}

.skill-label {
	font-weight: 600;
	color: #555;
}

.top-btn {
	border-radius: 25px;
	padding: 8px 18px;
	font-weight: 600;
}

.search-box {
	max-width: 400px;
}

.search-box input {
	border-radius: 25px;
	padding: 10px 15px;
	border: 1px solid #ddd;
	transition: 0.3s;
}

.search-box input:focus {
	border-color: #0d6efd;
	box-shadow: 0 0 5px rgba(13, 110, 253, 0.3);
}

.search-btn {
	border-radius: 25px;
	padding: 8px 18px;
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
	<%
	User us = (User) session.getAttribute("user");
	%>
	<div class="container py-5">

		<!-- Top Section -->
		<div class="d-flex justify-content-between align-items-center mb-4">

			<h2 class="page-title">My Skills</h2>

			<form action="searchSkill" method="get" class="search-box d-flex">

				<input type="text" name="key" class="form-control me-2"
					placeholder="Search skills (e.g. Java, Python)" required>

				<button type="submit" class="btn btn-primary search-btn">
					Search</button>

			</form>

			<div>
				<a href="dashboard.jsp" class="btn btn-outline-primary top-btn">
					← Dashboard </a> <a href="addSkill.jsp" class="btn btn-primary top-btn">
					+ Add Skill </a>
			</div>

		</div>
		<% 
		if(list==null|| list.isEmpty()){
		%>
			<div class="alert alert-warning text-center">
		    No skills found for "<%=request.getParameter("key") %>"
		</div>
		 <% 
		}
		%>

		<!-- Skill Card 1 -->
		<%
		for (Skills skill : list) {
		%>
		<div class="card skill-card mb-4 p-4">

			<div class="d-flex justify-content-between align-items-center mb-3">

				<h4 class="text-primary mb-0"><%=skill.getSkillName()%></h4>

				<span class="badge bg-success badge-status"> <%=skill.getStatus()%>
				</span>

			</div>

			<p>
				<%=skill.getDescription()%>
			</p>

			<div class="row mb-3">

				<div class="col-md-6">
					<span class="skill-label">Level:</span>
					<%=skill.getLevel()%>
				</div>

				<div class="col-md-6">
					<span class="skill-label">Availability:</span>
					<%=skill.getAvailability()%>
				</div>

			</div>


			<div class="text-end">

				<%
				if (skill.getOwner_user() == us.getId()) {
				%>

				<div class="text-end">
					<a href="editSkill?sid=<%=skill.getSkill_id()%>"
						class="btn btn-warning btn-sm">Edit</a> <a
						href="delete?sid=<%=skill.getSkill_id()%>"
						class="btn btn-danger btn-sm">Delete</a>
				</div>

				<%
				} else {
				%>


				<a href="requestSkill?sid=<%=skill.getSkill_id() %>&rid=<%=skill.getOwner_user()  %>" class="btn btn-primary btn-sm ms-2 search-btn"> Request Skill </a>
				<%
				}
				%>
			</div>

		</div>
		<%
		}
		%>

	</div>

</body>
</html>