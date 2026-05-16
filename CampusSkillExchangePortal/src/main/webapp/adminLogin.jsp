<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.campusSkill.model.Admin" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>

body{
	background:#f4f7fc;
}

.login-card{
	max-width:450px;
	margin:80px auto;
	border:none;
	border-radius:15px;
	box-shadow:0 4px 15px rgba(0,0,0,0.1);
}

.card-header{
	background:#0d6efd;
	color:white;
	text-align:center;
	font-size:24px;
	font-weight:600;
	padding:20px;
	border-radius:15px 15px 0 0;
}

.form-control{
	border-radius:10px;
	padding:12px;
}

.btn-login{
	border-radius:25px;
	padding:10px;
	font-weight:600;
}

</style>

</head>
<body>
<%
	Admin adm = (Admin) session.getAttribute("admin");
	if (adm != null) {
	%>
	<div class="alert alert-success text-center">
    Welcome <%=adm.getEmail()%>
</div>
	<%
	session.removeAttribute("admin");
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
<div class="container">

	<div class="card login-card">

		<div class="card-header">
			Admin Login
		</div>

		<div class="card-body p-4">

			<form action="adminLogin" method="post">

				<div class="mb-3">

					<label class="form-label">Email</label>

					<input type="email"
					       name="email"
					       class="form-control"
					       placeholder="Enter admin email"
					       required>

				</div>

				<div class="mb-4">

					<label class="form-label">Password</label>

					<input type="password"
					       name="password"
					       class="form-control"
					       placeholder="Enter password"
					       required>

				</div>

				<button type="submit"
				        class="btn btn-primary w-100 btn-login">
					Login
				</button>

			</form>

		</div>

	</div>

</div>

</body>
</html>