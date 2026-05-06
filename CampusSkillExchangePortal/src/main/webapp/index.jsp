<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Home Page</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
.navbar-brand img{
	border-radius:50%;
	object-fit:cover;
}

.nav-link{
	margin:0 8px;
	transition:0.3s;
}

.nav-link:hover{
	color:#0d6efd !important;
}

.btn-custom{
	border-radius:25px;
	padding:8px 22px;
	font-weight:600;
}
</style>

</head>

<body>

<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm py-3">

	<div class="container-fluid px-4">

		<!-- Logo + Title -->
		<a class="navbar-brand d-flex align-items-center" href="#">
			<img src="Untitled design.png" width="48" height="48" class="me-2">

			<span class="fw-bold text-primary fs-4">
				Campus Skill Exchange Portal
			</span>
		</a>

		<!-- Mobile Button -->
		<button class="navbar-toggler" type="button"
			data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent">

			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- Navbar Content -->
		<div class="collapse navbar-collapse" id="navbarSupportedContent">

			<!-- Center Menu -->
			<ul class="navbar-nav mx-auto mb-2 mb-lg-0">

				<li class="nav-item">
					<a class="nav-link active fw-semibold" href="#">
						Home
					</a>
				</li>

				<li class="nav-item">
					<a class="nav-link fw-semibold" href="#about">
						About
					</a>
				</li>

				<li class="nav-item">
					<a class="nav-link fw-semibold" href="#features">
						Features
					</a>
				</li>

				<li class="nav-item">
					<a class="nav-link fw-semibold" href="#contact">
						Contact
					</a>
				</li>

			</ul>

			<!-- Right Buttons -->
			<div class="d-flex gap-2">

				<a href="login.jsp"
					class="btn btn-outline-primary btn-custom">
					Login
				</a>

				<a href="register.jsp"
					class="btn btn-primary btn-custom">
					Register
				</a>

			</div>

		</div>

	</div>

</nav>
<!-- Navbar End -->
<!-- About Section Start -->
<section id="about" class="py-5 bg-light">

	<div class="container">

		<div class="row align-items-center">

			<!-- Left Side Image -->
			<div class="col-md-6 mb-4 mb-md-0">

				<img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f"
					class="img-fluid rounded shadow"
					alt="Students">

			</div>

			<!-- Right Side Content -->
			<div class="col-md-6">

				<h2 class="fw-bold text-primary mb-4">
					About Campus Skill Exchange Portal
				</h2>

				<p class="text-muted fs-5">
					Campus Skill Exchange Portal is a student platform where learners can
					connect with each other, share skills, learn new technologies,
					and grow together.
				</p>

				<p class="text-muted">
					Students can teach coding, communication, design, speaking,
					and gain practical knowledge through collaboration.
				</p>

				<a href="register.jsp" class="btn btn-primary px-4 py-2 mt-2">
					Join Now
				</a>

			</div>

		</div>

	</div>

</section>
<!-- About Section End -->
<!-- Features Section Start -->
<section id="features" class="py-5 bg-white">

	<div class="container">

		<!-- Heading -->
		<div class="text-center mb-5">

			<h2 class="fw-bold text-primary">
				Our Features
			</h2>

			<p class="text-muted">
				Everything students need to learn, connect and grow together.
			</p>

		</div>

		<!-- Feature Cards -->
		<div class="row g-4">

			<!-- Card 1 -->
			<div class="col-md-4">

				<div class="card border-0 shadow h-100 text-center p-4">

					<h4 class="fw-bold mb-3 text-primary">
						Skill Sharing
					</h4>

					<p class="text-muted">
						Students can teach their skills like coding,
						design, speaking and more.
					</p>

				</div>

			</div>

			<!-- Card 2 -->
			<div class="col-md-4">

				<div class="card border-0 shadow h-100 text-center p-4">

					<h4 class="fw-bold mb-3 text-primary">
						Learn New Skills
					</h4>

					<p class="text-muted">
						Explore new technologies and learn directly
						from talented students.
					</p>

				</div>

			</div>

			<!-- Card 3 -->
			<div class="col-md-4">

				<div class="card border-0 shadow h-100 text-center p-4">

					<h4 class="fw-bold mb-3 text-primary">
						Student Networking
					</h4>

					<p class="text-muted">
						Connect with students from different departments
						and build strong networks.
					</p>

				</div>

			</div>

			<!-- Card 4 -->
			<div class="col-md-4">

				<div class="card border-0 shadow h-100 text-center p-4">

					<h4 class="fw-bold mb-3 text-primary">
						Create Profile
					</h4>

					<p class="text-muted">
						Build your profile and showcase your
						skills to other learners.
					</p>

				</div>

			</div>

			<!-- Card 5 -->
			<div class="col-md-4">

				<div class="card border-0 shadow h-100 text-center p-4">

					<h4 class="fw-bold mb-3 text-primary">
						Collaboration
					</h4>

					<p class="text-muted">
						Work on projects, hackathons and
						team activities together.
					</p>

				</div>

			</div>

			<!-- Card 6 -->
			<div class="col-md-4">

				<div class="card border-0 shadow h-100 text-center p-4">

					<h4 class="fw-bold mb-3 text-primary">
						Growth Opportunities
					</h4>

					<p class="text-muted">
						Improve confidence, communication and
						career skills for the future.
					</p>

				</div>

			</div>

		</div>

	</div>

</section>
<!-- Features Section End -->
<!-- Contact Section Start -->
<section id="contact" class="py-5 bg-light">

	<div class="container">

		<!-- Heading -->
		<div class="text-center mb-5">

			<h2 class="fw-bold text-primary">
				Contact Us
			</h2>

			<p class="text-muted">
				Have questions or suggestions? We'd love to hear from you.
			</p>

		</div>

		<div class="row align-items-center">

			<!-- Left Side Info -->
			<div class="col-md-6 mb-4 mb-md-0">

				<div class="bg-white shadow rounded p-4">

					<h4 class="fw-bold mb-4 text-primary">
						Get In Touch
					</h4>

					<p class="mb-3">
						<strong>Email:</strong> yourmail@gmail.com
					</p>

					<p class="mb-3">
						<strong>Phone:</strong> +91 XXXXX XXXXX
					</p>

					<p class="mb-3">
						<strong>Location:</strong> Indore, Madhya Pradesh
					</p>

					<p class="text-muted">
						Feel free to contact us for any help,
						feedback or collaboration.
					</p>

				</div>

			</div>

			<!-- Right Side Form -->
			<div class="col-md-6">

				<div class="bg-white shadow rounded p-4">

					<form>

						<div class="mb-3">
							<input type="text"
								class="form-control"
								placeholder="Enter Your Name">
						</div>

						<div class="mb-3">
							<input type="email"
								class="form-control"
								placeholder="Enter Your Email">
						</div>

						<div class="mb-3">
							<textarea rows="4"
								class="form-control"
								placeholder="Enter Message"></textarea>
						</div>

						<button class="btn btn-primary px-4">
							Send Message
						</button>

					</form>

				</div>

			</div>

		</div>

	</div>

</section>
<!-- Contact Section End -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js">
</script>

</body>
</html>