<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Yến sào Kennest</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resource/css/administration.css'/>">
<style>
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