<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/header.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<style>
body {
	display: flex;
	justify-content: center;
	background-color: #DDD;
}

.header {
	width: 1000px; position : fixed;
	top: 0px;
	z-index: 999;
	position: fixed;
}

.banner {
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="header">
		<a href="${pageContext.request.contextPath}/home"> <span class="banner"> <img
				src="./resource/images/yensaologo.png"
				width="100%" height="200px" alt="banner">
		</span>
		</a>
		<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #44a3e8;">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav font-weight-bold">
					<li class="nav-item"><a class="nav-link text-light" href="${pageContext.request.contextPath}/home">TRANG CHỦ</a></li>
					<li class="nav-item"><a class="nav-link text-light" href="${pageContext.request.contextPath}/home">GIỚI THIỆU</a></li>
					<li class="nav-item"><a class="nav-link text-light" href="${pageContext.request.contextPath}/products">SẢN PHẨM</a></li>
					<li class="nav-item"><a class="nav-link text-light" href="#">LIÊN HỆ</a></li>
				</ul>
				<form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/searchProduct" method="get" >
					<input class="form-control mr-sm-2" type="search" name="textSearch" placeholder="Nhập tên sản phẩm" aria-label="Search">
					<button class="btn btn-success my-2 my-sm-0" type="submit">Tìm kiếm</button>
				</form>
				<ul class="navbar-nav ml-auto font-weight-bold">
					<div class="nav-item">
						<a class="nav-link text-light" href="#"> ${username} </a>
					</div>
					<div class="nav-item dropdown">
						<a class="nav-link dropdown-toggle text-light" href="#"
							id="navbarDropdown" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"></a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Quản lí tài khoản</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
						</div>
					</div>
				</ul>

			</div>
		</nav>
		<div style=" background-color: white;">
			<marquee onmouseover="this.stop();" onmouseout="this.start();"
				behavior="scroll" direction="left" scrollamount="3">
				<p style="color: red;">Chào mừng bạn
					đến với Website bán hàng của chúng tôi. </p>
			</marquee>
		</div>
	</div>
</body>
</html>