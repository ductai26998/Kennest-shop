<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Yến sào Kennest</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resource/css/users.css'/>">
<style>

</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="headerAdmin.jsp"></jsp:include>
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item bg-light"><a href="${pageContext.request.contextPath}/home">TRANG CHỦ</a></li>
				<li class="breadcrumb-item bg-light"><a href="${pageContext.request.contextPath}/administration">QUẢN LÍ</a></li>
				<li class="breadcrumb-item active bg-light" aria-current="page">QUẢN LÍ KHÁCH HÀNG</li>
			</ol>
		</nav>
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Tên</th>
					<th scope="col">Email</th>
					<th scope="col">Số điện thoại</th>
					<th scope="col">Địa chỉ</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${users}" var="user">
					<tr>
						<th scope="row">${user.id}</th>
						<td>${user.name}</td>
						<td>${user.email}</td>
						<td>${user.phone}</td>
						<td>${user.address}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>