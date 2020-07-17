<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>KennestShop</title>
<style>
.wrapper {
	display: flex;
	margin-top: 305px;
	flex-direction: column;
	width: 1000px;
}
</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="headerAdmin.jsp"></jsp:include>
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item bg-light"><a href="${pageContext.request.contextPath}/home">TRANG CHỦ</a></li>
				<li class="breadcrumb-item bg-light"><a href="${pageContext.request.contextPath}/products">SẢN PHẨM</a></li>
				<li class="breadcrumb-item active bg-light" aria-current="page">THÊM SẢN PHẨM</li>
			</ol>
		</nav>
		<form action="${pageContext.request.contextPath}/insertProduct"	method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label>Tên sản phẩm</label> 
				<input type="text" class="form-control" name="productName" placeholder="Tên sản phẩm">
			</div>
			<div class="form-group">
				<label>Khối lượng</label> 
				<input type="text" class="form-control" name="weight" placeholder="Khối lượng (gam)">
			</div>
			<div class="form-group">
				<label>Giá bán</label>
				<input type="text" class="form-control" name="price" placeholder="Giá bán">
			</div>
			<div class="form-group">
				<label>Tải ảnh lên</label> 
				<input type="file" class="form-control" name="image">
			</div>
			<div class="form-group">
				<label>Mô tả sản phẩm</label>
				<textarea class="form-control" name="description" placeholder="Mô tả sản phẩm"></textarea>
			</div>
			<div class="form-group">
				<input type="submit" value="Thêm">
			</div>
		</form>
	</div>
</body>
</html>