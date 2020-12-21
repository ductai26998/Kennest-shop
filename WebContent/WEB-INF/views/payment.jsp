<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Yến sào Kennest</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resource/css/payment.css'/>">
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
				<li class="breadcrumb-item active bg-light" aria-current="page">THÔNG TIN GIAO HÀNG</li>
			</ol>
		</nav>

		<div class="container">
			<form action="${pageContext.request.contextPath}/payment"
				method="post">
				<c:if test="${errorsLength > 0}">
					<c:forEach items="${errors}" var="error">
						<div class="alert alert-danger" role="alert">${error}</div>
					</c:forEach>
				</c:if>
				<div class="container-payment">
					<div class="user-infor">
						<h3>THÔNG TIN KHÁCH HÀNG</h3>
						<div class="form-group">
							<label for="inputName">Họ tên</label> <input type="text"
								name="name" class="form-control" id="inputName"
								value="${user.name }">
						</div>
						<div class="form-group">
							<label for="inputEmail">Email</label> <input type="email"
								name="email" class="form-control" id="inputEmail"
								value="${user.email }">
						</div>
						<div class="form-group">
							<label for="inputPhone">Số điện thoại</label> <input type="text"
								name="phone" class="form-control" id="inputPhone"
								value="${user.phone }">
						</div>
						<div class="form-group">
							<label for="inputAddress">Địa chỉ</label> <input type="text"
								name="address" class="form-control" id="inputAddress"
								value="${user.address }">
						</div>
					</div>

					<div class="order-infor">
						<h3>THÔNG TIN ĐƠN HÀNG</h3>
						<input type="number" value="${product.id }" name="productId" hidden="true">
						<div class="product-infor">
							<img src="${product.image}"
								style="width: 80px; height: 80px; border-radius: 4px;"> <span
								style="margin: 0px 40px 0px 10px">${product.productName}(${product.weight}g)</span>
							<span>Giá: ${product.price} VND</span>
						</div>
						<div style="padding: 20px 0px;">Tổng cộng: ${product.price}
							VND</div>
						<div class="form-group"
							style="padding: 10px 0px; border-top: solid 1px #AAA;">
							<span>Chọn hình thức thanh toán:</span><br> <input
								type="radio" id="Thanh toán khi nhận hàng" name="payment"
								value="Thanh toán khi nhận hàng"> <label
								for="Thanh toán khi nhận hàng">Thanh toán khi nhận hàng</label><br>
							<input type="radio" id="Chuyển khoản" name="payment"
								value="Chuyển khoản"> <label for="Chuyển khoản">Chuyển
								khoản</label><br>
						</div>
					</div>
				</div>
				<button type="submit" class="btn btn-primary" style="margin: 0px 0px 30px 400px;">HOÀN
					THÀNH</button>
			</form>
		</div>
	</div>
</body>
</html>