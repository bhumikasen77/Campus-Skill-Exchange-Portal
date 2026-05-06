<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.campusSkill.model.User" %>
<%
User user = (User)session.getAttribute("user");
if(user==null){
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body{
	background:#f4f7fc;
	font-family:Arial, sans-serif;
}

.edit-card{
	border:none;
	border-radius:18px;
	box-shadow:0 6px 18px rgba(0,0,0,0.08);
}

.edit-header{
	background:linear-gradient(135deg,#0d6efd,#4dabf7);
	color:white;
	padding:25px;
	text-align:center;
	border-radius:18px 18px 0 0;
}

.form-label{
	font-weight:600;
	color:#444;
}

.form-control,
.form-select{
	border-radius:12px;
	padding:10px;
}

textarea{
	resize:none;
}

.btn-custom{
	border-radius:25px;
	padding:10px 22px;
	font-weight:600;
}
</style>

</head>
<body>
<%String msg = (String)session.getAttribute("failedMsg");
  if(msg!=null){
  %>
  <div class="alert alert-danger text-center">
  <%=msg %>
  </div>
  <%
  session.removeAttribute("failedMsg");
  }
%>
<div class="container py-5">

	<div class="row justify-content-center">

		<div class="col-md-8 col-lg-7">

			<div class="card edit-card">

				<!-- Header -->
				<div class="edit-header">
					<h3 class="mb-1">Edit Profile</h3>
					<p class="mb-0">Update your personal details</p>
				</div>

				<!-- Form -->
				<div class="card-body p-4">

					<form action="editProfile" method="post">

						<div class="mb-3">
							<label class="form-label">Full Name</label>
							<input type="text" name="name"
								class="form-control"
								value="<%=user.getName() %>" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Email</label>
							<input type="email" name="email"
								class="form-control"
								value="<%=user.getEmail()%>" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Department</label>
							<input type="text" name="department"
								class="form-control"
								value="<%=user.getDepartment() %>" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Year</label>
							<select name="year" class="form-select">
							    <option><%=user.getYear() %></option>
								<option>1st Year</option>
								<option >2nd Year</option>
								<option>3rd Year</option>
								<option>4th Year</option>
							</select>
						</div>

						<div class="mb-3">
							<label class="form-label">Bio</label>
							<textarea name="bio"
								class="form-control"
								rows="4"><%=user.getBio() %></textarea>
						</div>
						
						<div class="mb-3">
							<label class="form-label">Status</label>
							<select name="status" class="form-select">
							    <option><%=user.getStatus() %></option>
								<option>Active</option>
								<option>Inactive</option>
								<option>Busy</option>
								
							</select>
						</div>

						<!-- Buttons -->
						<div class="text-center mt-4">

							<a href="myProfile"
								class="btn btn-outline-secondary btn-custom me-2">
								Cancel
							</a>

							<button type="submit"
								class="btn btn-primary btn-custom">
								Update Profile
							</button>

						</div>

					</form>

				</div>

			</div>

		</div>

	</div>

</div>

</body>
</html>