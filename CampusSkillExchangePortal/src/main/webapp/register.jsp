<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Register Page</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body{
	background:linear-gradient(to right,#e3f2fd,#ffffff);
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

.register-card{
	max-width:550px;
	margin:auto;
	border-radius:20px;
}

.form-control{
	border-radius:10px;
	padding:10px;
}

.btn-register{
	border-radius:25px;
	font-weight:600;
	padding:10px;
}

.title-text{
	font-weight:700;
	color:#0d6efd;
}
</style>

</head>

<body>
<%
  String msg = (String) session.getAttribute("failedMsg");
  if(msg!=null){
  %>
  <div class="alert alert-danger text-center">
  <%= msg%>
  </div>
  <%
  session.removeAttribute("failedMsg");
  }
%>


<section class="py-5">

	<div class="container">

		<div class="card shadow border-0 register-card p-4">

			<div class="text-center mb-4">

				<h2 class="title-text">
					Create Account
				</h2>

				<p class="text-muted">
					Join Campus Skill Exchange Portal
				</p>

			</div>

			<form action="register" method="post">

				<div class="mb-3">
					<label class="form-label">Full Name</label>
					<input type="text" name="name"
						class="form-control"
						placeholder="Enter full name" required>
				</div>

				<div class="mb-3">
					<label class="form-label">Email</label>
					<input type="email" name="email"
						class="form-control"
						placeholder="Enter email" required>
				</div>

				<div class="mb-3">
					<label class="form-label">Password</label>
					<input type="password" name="password"
						class="form-control"
						placeholder="Enter password" required>
				</div>

				<div class="mb-3">
					<label class="form-label">Confirm Password</label>
					<input type="password" name="confirmPassword"
						class="form-control"
						placeholder="Confirm password" required>
				</div>

				<div class="mb-3">
					<label class="form-label">Department</label>
					<input type="text" name="department"
						class="form-control"
						placeholder="Enter department" required>
				</div>

				<div class="mb-3">
					<label class="form-label">Year</label>
					<input type="text" name="year"
						class="form-control"
						placeholder="Enter year" required>
				</div>

				<div class="mb-3">
					<label class="form-label">Bio</label>
					<textarea name="bio"
						class="form-control"
						rows="3"
						placeholder="Write something about yourself"></textarea>
				</div>
				
				<div class="mb-3">
					<label class="form-label">Status</label>
						<select name="status" class="form-select">
							    
								<option selected>Active</option>
								<option >Inactive</option>
								<option>Busy</option>
								
							</select>
				</div>

				<div class="d-grid">
					<input type="submit"
						value="Register"
						class="btn btn-primary btn-register">
				</div>

				<div class="text-center mt-3">

					<p class="mb-0">
						Already have an account?
						<a href="login.jsp" class="text-decoration-none">
							Login
						</a>
					</p>

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