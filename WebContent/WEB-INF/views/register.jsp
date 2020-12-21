<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Yến sào Kennest</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resource/css/register.css'/>">
<style>

</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item bg-light"><a href="${pageContext.request.contextPath}/home">TRANG CHỦ</a></li>
				<li class="breadcrumb-item active bg-light" aria-current="page">ĐĂNG KÍ</li>
			</ol>
		</nav>
		<form action="${pageContext.request.contextPath}/register" method="post">
			<c:if test="${errorsLength > 0}">
				<c:forEach items="${errors}" var="error">
					<div class="alert alert-danger" role="alert">${error}</div>
				</c:forEach>
			</c:if>
			<small class="form-text">Bạn đã có tài khoản. Đăng nhập ngay <a href="${pageContext.request.contextPath}/login">tại đây</a></small>
			<p style="color: red;">(*) Bắt buộc</p>
			<div class="form-group">
				<label for="inputName">Họ tên (*)</label> <input type="text" name="name"
					class="form-control" id="inputName" placeholder="Ví dụ: Nguyễn Đức Tài">
			</div>
			<div class="form-group">
				<label for="inputEmail">Email (*)</label> <input type="email" name="email"
					class="form-control" id="inputEmail" placeholder="Ví dụ: xyz@gmail.com">
			</div>
			<div class="form-group">
				<label for="inputPhone">Số điện thoại (*)</label> <input type="text" name="phone"
					class="form-control" id="inputPhone" placeholder="Ví dụ: 0987654321">
			</div>
			<div class="form-group">
				<label for="inputAddress">Địa chỉ (*)</label> <input type="text" name="address"
					class="form-control" id="inputAddress" placeholder="Ví dụ: Số 112, Đường Lê Duẩn, TP Đà Nẵng">
			</div>
			<div class="form-group">
				<label for="inputUsername">Tên đăng nhập (*)</label> <input type="text" name="username"
					class="form-control" id="inputUsername" placeholder="Ví dụ: Ductai2207">
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputPassword1">Mật khẩu mới (*)</label> <input type="password" name="password"
						class="form-control" id="inputPassword1" placeholder="Nhập mật khẩu">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword2">Nhập lại mật khẩu (*)</label> <input type="password" name="rePassword"
						class="form-control" id="inputPassword2" placeholder="Nhập lại mật khẩu">
				</div>
			</div>
			<button type="submit" class="btn btn-primary mb-5">Đăng kí</button>
			
		</form>

	</div>
</body>
</html>