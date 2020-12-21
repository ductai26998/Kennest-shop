<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Yến sào Kennest</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resource/css/productDetail.css'/>">
<style>

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
				<p><span style="font-weight: bold;">Giá bán: </span><span style="color: #ff5200;">${product.price}</span> VND</p>
				<p><span style="font-weight: bold;">Trọng lượng: </span><span style="color: #ff5200;">${product.weight}</span>g</p>
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