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
	margin-top: 305px;
	flex-direction: column;
	width: 1000px;
	background-color: #FFF;
}

.product-detail {
	display: grid;
	grid-template-columns: 1fr 1fr;
}

.product-detail .photo {
	height: 500px;
	margin: 20px;
	background-size: 100% 100%;
}

.product-detail .photo img {
	width: 100%;
	height: 100%;
}

.product-detail .infor {
	margin: 20px;
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
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item bg-light"><a href="${pageContext.request.contextPath}/home">TRANG CHỦ</a></li>
				<li class="breadcrumb-item bg-light"><a href="${pageContext.request.contextPath}/products">SẢN PHẨM</a></li>
				<li class="breadcrumb-item active bg-light" aria-current="page">${product.productName}</li>
			</ol>
		</nav>
		<div class="product-detail">
			<input type="number" value="${book.id}" name="id" hidden="true">
			<div class="photo"><img src="${product.image}"></div>
			<div class="infor">
				<h3 style="color: red">${product.productName}</h3>
				<p><span style="font-weight: bold;">Giá bán: </span><span style="color: #ff5200;">${product.price}</span></p>
				<p><span style="font-weight: bold;">Trọng lượng: </span><span style="color: #ff5200;">${product.weight}</span></p>
				<p>${product.description}</p>
				<a class="btn btn-success mx-auto" href="payment?id=${product.id}" role="button">
					<span>MUA NGAY</span><br>
					<small>Gọi điện xác nhận và giao hàng tận nơi</small>
				</a>
			</div>
		</div>
	</div>
</body>
</html>