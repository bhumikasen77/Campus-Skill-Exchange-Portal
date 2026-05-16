<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.campusSkill.model.User"%>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
	response.sendRedirect("login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Skill</title>

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

.skill-card {
	max-width: 700px;
	margin: auto;
	border-radius: 18px;
}

.form-control, .form-select {
	border-radius: 10px;
	padding: 10px;
}

.btn-submit {
	border-radius: 25px;
	font-weight: 600;
	padding: 10px;
}
</style>

</head>

<body>

	<%
	String msg = (String) session.getAttribute("failedMsg");
	if (msg != null) {
	%>
	<div class="alert alert-danger text-center">
		<%=msg%>
	</div>
	<%
	session.removeAttribute("failedMsg");
	}
	%>
	
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
	<section class="py-5">

		<div class="container">

			<div class="card shadow border-0 skill-card p-4">

				<div class="text-center mb-4">

					<h2 class="text-primary fw-bold">Add New Skill</h2>

					<p class="text-muted">Share your knowledge with other students
					</p>

				</div>

				<form action="addSkill" method="post">

					<div class="mb-3">
						<label class="form-label">Skill Name</label> <input type="text"
							name="skillName" class="form-control"
							placeholder="Enter skill name" required>
					</div>

					<!-- <div class="mb-3">
					<label class="form-label">Category</label>
					<select name="category" class="form-select" required>
						<option value="">Select Category</option>
						<option>Programming</option>
						<option>Web Development</option>
						<option>Design</option>
						<option>Communication</option>
						<option>Marketing</option>
						<option>Other</option>
					</select>
				</div> -->

					<div class="mb-3">
						<label class="form-label">Skill Level</label> <select name="level"
							class="form-select" required>
							<option value="">Select Level</option>
							<option>Beginner</option>
							<option>Intermediate</option>
							<option>Advanced</option>
						</select>
					</div>

					<div class="mb-3">
						<label class="form-label">Description</label>
						<textarea name="description" rows="4" class="form-control"
							placeholder="Write details about your skill" required></textarea>
					</div>

					<div class="mb-3">
						<label class="form-label">Availability</label> <select
							name="availability" class="form-select">
							<option>Weekdays</option>
							<option>Weekends</option>
							<option>Evening</option>
							<option>Anytime</option>
						</select>
					</div>

					<div class="mb-3">
						<label class="form-label">Status</label> <select name="status"
							class="form-select">
							<option>Active</option>
							<option>Inactive</option>
							<option>Busy</option>
						</select>
					</div>

					<div class="d-grid mt-4">

						<input type="submit" value="Add Skill"
							class="btn btn-primary btn-submit">

					</div>

					<div class="text-center mt-3">

						<a href="dashboard.jsp" class="text-decoration-none"> ← Back
							to Dashboard </a>

					</div>

				</form>

			</div>

		</div>

	</section>

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