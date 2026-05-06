<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.campusSkill.model.Skills"%>
	
	<%
	  Skills sk = (Skills)request.getAttribute("skillObj");
	  if(sk==null){
		  response.sendRedirect("viewSkill");
		  return;
	  }
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Skill</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f4f7fc;
}

.card-custom {
	border: none;
	border-radius: 15px;
	box-shadow: 0 4px 12px rgba(0,0,0,0.08);
}

.header {
	background: linear-gradient(135deg,#0d6efd,#4dabf7);
	color: white;
	padding: 20px;
	border-radius: 15px 15px 0 0;
	text-align: center;
}

.btn-custom {
	border-radius: 25px;
	padding: 8px 20px;
	font-weight: 600;
}
</style>

</head>
<body>

<div class="container py-5">

	<div class="row justify-content-center">
		<div class="col-md-8">

			<div class="card card-custom">

				<div class="header">
					<h3>Edit Skill</h3>
					<p class="mb-0">Update your skill details</p>
				</div>

				<div class="card-body p-4">

					<form action="updateSkill" method="post">

						<!-- Hidden ID -->
						<input type="hidden" name="sid" value="<%=sk.getSkill_id() %>">

						<div class="mb-3">
							<label class="form-label">Skill Name</label>
							<input type="text" name="skillName" class="form-control"
								value="<%=sk.getSkillName() %>" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Description</label>
							<textarea name="description" class="form-control" rows="4"><%=sk.getDescription() %></textarea>
						</div>

						<div class="mb-3">
							<label class="form-label">Level</label>
							<select name="level" class="form-select">
								<option selected><%=sk.getLevel() %></option>
								<option>Beginner</option>
								<option>Intermediate</option>
								<option>Advanced</option>
							</select>
						</div>

						<div class="mb-3">
							<label class="form-label">Availability</label>
							<select name="availability" class="form-select">
								<option selected><%=sk.getAvailability() %></option>
								<option>Evening</option>
								<option>Weekends</option>
								<option>Anytime</option>
							</select>
						</div>

						<div class="mb-3">
							<label class="form-label">Status</label>
							<select name="status" class="form-select">
								<option selected><%=sk.getStatus() %></option>
								<option>Active</option>
								<option>Inactive</option>
							</select>
						</div>

						<div class="text-center mt-4">
							<a href="viewSkill" class="btn btn-outline-secondary btn-custom me-2">
								Cancel
							</a>

                          
							 <button type="submit" class="btn btn-primary btn-custom">
								Update Skill
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