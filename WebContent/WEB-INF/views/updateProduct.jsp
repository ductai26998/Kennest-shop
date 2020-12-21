<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Yến sào Kennest</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resource/css/updateProduct.css'/>">
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
			<form action="${pageContext.request.contextPath}/updateProduct" method="post" enctype="multipart/form-data">
				<c:if test="${errorsLength > 0}">
					<c:forEach items="${errors}" var="error">
						<div class="alert alert-danger" role="alert">${error}</div>
					</c:forEach>
				</c:if>
				<input type="number" value="${product.id}" name="id" hidden="true">
				<div class="form-group">
					<label>Tên sản phẩm</label> <input type="text" class="form-control"
						name="productName" value="${product.productName }">
				</div>
				<div class="form-group">
					<label>Khối lượng</label> <input type="text" class="form-control"
						name="weight" value="${product.weight }">
				</div>
				<div class="form-group">
					<label>Giá bán</label> <input type="text" class="form-control"
						name="price" value="${product.price }">
				</div>
				<div class="form-group">
					<label>Tải ảnh lên</label> <input type="file" class="form-control"
						name="image">
				</div>
				<div class="form-group">
					<label>Mô tả sản phẩm</label>
					<textarea class="form-control" name="description">${product.description }</textarea>
				</div>
				<div class="form-group">
					<input type="submit" value="LƯU LẠI">
				</div>
			</form>
		</div>
	</div>
</body>
</html>