<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Page Loader -->
<nav class="navbar navbar-expand-lg" style="background-color: black;">
	<div class="container-fluid">
		<a class="navbar-brand " style="color: red;"
			href="<c:url value='/index' />"> <i class="fa-solid fa-a"></i>
			anime
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fas fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">

			<ul class="navbar-nav ml-auto mb-2 mb-lg-0">
				<c:choose>
					<c:when test="${not empty sessionScope.currentUser}">
						<li class="nav-item mx-5"><a
							class="nav-link nav-link-1 text-center" data-toggle="modal"
							data-target="#changePassModal" aria-current="page" href="">Welcome,${sessionScope.currentUser.username}</a>
						</li>

						<div class="btn-group dropleft px-5">
							<button type="button"
								class="btn btn-secondary dropdown-toggle rounded btn-lg"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">Select</button>
							<div class="dropdown-menu bg-secondary">
								<li><a class="nav-link nav-link-1" href="favorites">My
										Favourites</a></li>
								<li><a class="nav-link nav-link-1" href="history">History</a></li>
								<c:if test="${sessionScope.currentUser.getIsAdmin() == true}">
									<li><a class="nav-link nav-link-1"
										href="http://localhost:8080/Asm-Java4/admin">ADMIN</a></li>
								</c:if>
								<li><a class="nav-link nav-link-1" href="editprofile">Edit
										Profile</a></li>
								<li><a class="nav-link nav-link-1" href="logout">Log
										out</a></li>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link nav-link-1"
							href="forgotPass">Forgot Password</a></li>
						<li class="nav-item"><a class="nav-link nav-link-1"
							href="login">Login</a></li>
						<li class="nav-item"><a class="nav-link nav-link-1"
							href="register">Register</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>

<div class="tm-hero d-flex justify-content-center align-items-center"
	data-parallax="scroll"
	data-image-src="<c:url value='/Template/User/img/normal-breadcrumb.jpg'/>">
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">

				<img class="d-block "
					src="<c:url value='/Template/User/img/bd-item-2.jpg'/>"
					alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="dblock "
					src="<c:url value='/Template/User/img/bd-item-1.jpg'/>"
					alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block "
					src="<c:url value='/Template/User/img/bd-item-3.jpg'/>"
					alt="Third slide">
			</div>

		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="changePassModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-center" id="exampleModalLabel">Change
					Password</h5>
				<button type="button" class="close btn btn-danger rounded-pill"
					data-dismiss="modal" aria-label="Close">X</button>
			</div>
			<div class="modal-body">
				<div class="form-control ">
					<input type="password" name="currentPass" id="currentPass"
						class="form-control rounded-pill" placeholder="Current Password?"
						required>
				</div>
				<br>
				<div class="form-control">
					<input type="password" name="newPass" id="newPass"
						class="form-control rounded-pill" placeholder="New Password?"
						required>
				</div>
				<h5 style="color: red" class="text-center" id="messageChangePass"></h5>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary rounded-pill"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary rounded-pill"
						id="changePassBtn">Save changes</button>
				</div>
			</div>
		</div>
	</div>
</div>