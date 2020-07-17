<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
.wrapper {
	display: flex;
	margin-top: 200px;
	flex-direction: column;
	width: 1000px;
}
</style>
</head>
<body>
	<div class="wrapper">
		<c:if test="${role == null}">
			<jsp:include page="header.jsp"></jsp:include>
		</c:if>
		<c:if test="${role == \'admin\'}">
			<jsp:include page="headerAdmin.jsp"></jsp:include>
		</c:if>
		<c:if test="${role == \'user\'}">
			<jsp:include page="headerUser.jsp"></jsp:include>
		</c:if>
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="height: 400px;">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" style="height: 400px;"
						src="https://s.meta.com.vn/img/thumb.ashx/Data/image/2020/04/14/cach-chung-yen-duong-phen-3.jpg"
						alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" style="height: 400px;"
						src="https://vinmec-prod.s3.amazonaws.com/images/20200421_141741_359346_to-yen.max-800x800.jpg"
						alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" style="height: 400px;"
						src="https://s.meta.com.vn/img/thumb.ashx/Data/image/2020/04/14/cach-chung-yen-duong-phen-3.jpg"
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
</body>
</html>