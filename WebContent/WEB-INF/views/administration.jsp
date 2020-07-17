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
}

.list-product {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr;
}

.list-product .product {
	padding: 10px 20px;
	background-color: #fff;
}

.list-product .product img {
	width: 100%;	
	height: 200px;
}

.product:hover {
	box-shadow: 0px 0px 4px 2px rgba(0, 0, 0, 0.1);
}

.product-name {
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="headerAdmin.jsp"></jsp:include>
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item bg-light"><a href="${pageContext.request.contextPath}/home">TRANG CHỦ</a></li>
				<li class="breadcrumb-item active bg-light" aria-current="page">QUẢN LÍ</li>
			</ol>
		</nav>

		<a class="btn btn-outline-info btn-lg w-50 mx-auto mt-3" href="${pageContext.request.contextPath}/products" role="button">QUẢN LÍ SẢN PHẨM</a>
		<a class="btn btn-outline-info btn-lg w-50 mx-auto mt-3" href="${pageContext.request.contextPath}/users" role="button">QUẢN LÍ KHÁCH HÀNG</a>
		<a class="btn btn-outline-info btn-lg w-50 mx-auto mt-3" href="${pageContext.request.contextPath}/orderList" role="button">QUẢN LÍ ĐƠN HÀNG</a>
	</div>
</body>
</html>