<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Login Page</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(to right, #dbeafe, #ffffff);
}

.login-card {
	max-width: 450px;
	margin: auto;
	border-radius: 20px;
}

.form-control {
	border-radius: 10px;
	padding: 10px;
}

.btn-login {
	border-radius: 25px;
	padding: 10px;
	font-weight: 600;
}

.title-text {
	color: #0d6efd;
	font-weight: 700;
}
</style>

</head>

<body>
	<%
	String logoutMsg = (String) session.getAttribute("LogoutMsg");
	if (logoutMsg != null) {
	%>
	<div class="alert alert-success text-center">
		<%=logoutMsg%>
	</div>
	<%
	session.removeAttribute("logoutMsg");
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

	<%
	String msg = (String) session.getAttribute("user");
	if (msg != null) {
	%>
	<div class="alert alert-success text-center">
		<%=msg%>
	</div>
	<%
	session.removeAttribute("user");
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
	<section class="py-5">

		<div class="container">

			<div class="card shadow border-0 login-card p-4 mt-5">

				<div class="text-center mb-4">

					<h2 class="title-text">Welcome Back</h2>

					<p class="text-muted">Login to Campus Skill Exchange Portal</p>

				</div>

				<form action="login" method="post">

					<div class="mb-3">

						<label class="form-label">Email</label> <input type="email"
							name="email" class="form-control" placeholder="Enter your email"
							required>

					</div>

					<div class="mb-3">

						<label class="form-label">Password</label> <input type="password"
							name="password" class="form-control"
							placeholder="Enter your password" required>

					</div>

					<div class="d-grid mt-4">

						<input type="submit" value="Login"
							class="btn btn-primary btn-login">

					</div>

					<div class="text-center mt-3">

						<p class="mb-0">
							Don't have an account? <a href="register.jsp"
								class="text-decoration-none"> Register </a>
						</p>

					</div>

				</form>

			</div>

		</div>

	</section>

</body>
</html>