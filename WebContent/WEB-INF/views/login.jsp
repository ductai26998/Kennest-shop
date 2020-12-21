<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Yến sào Kennest</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resource/css/login.css'/>">
<style>
</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item bg-light"><a href="${pageContext.request.contextPath}/home">TRANG CHỦ</a></li>
				<li class="breadcrumb-item active bg-light" aria-current="page">ĐĂNG NHẬP</li>
			</ol>
		</nav>
		<form class="w-50 mx-auto" action="${pageContext.request.contextPath}/login" method="post">
			<c:if test="${error != null}">
					<div class="alert alert-danger" role="alert">${error}</div>
			</c:if>
			<div class="form-group">
				<label for="username">Tên đăng nhập</label>
				<input
					type="text" name="username" class="form-control" id="username" placeholder="Nhập tên đăng nhập">
			</div>
			<div class="form-group">
				<label for="password">Mật khẩu</label> 
				<input
					type="password" name="password" class="form-control" id="password" placeholder="Nhập mật khẩu">
			</div>
			<button type="submit" class="btn btn-primary">Đăng nhập</button>
			<small class="form-text">Nếu bạn chưa có tài khoản. Đăng kí ngay <a href="${pageContext.request.contextPath}/register">tại đây</a></small>
		</form>
		
	</div>
</body>
</html>