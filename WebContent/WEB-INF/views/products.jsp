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
	background-color: #FFF;
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
				<li class="breadcrumb-item active bg-light" aria-current="page">SẢN
					PHẨM</li>
			</ol>
		</nav>
		<c:if test="${role == \'admin\'}">
			<a href="${pageContext.request.contextPath}/insertProduct">THÊM SẢN PHẨM</a>
		</c:if>
		<div class="list-product">
			<c:forEach items="${products}" var="product">
				<div class="product">
					<input type="number" value="${product.id}" name="id" hidden="true">
					<a href="productDetail?id=${product.id}"><img src="${product.image}"></a>
					<div class="product-infor">
						<span class="product-name">${product.productName}</span><br> 
						<span class="weight">Khối lượng: ${product.weight}g</span><br> 
						<span class="price">Giá bán: ${product.price}</span><br>
						<span> Trạng thái: </span> 
						<span> 
									Còn hàng
								<c:if test="${product.status == false} ">
									Hết hàng
								</c:if>
						</span>
					</div>
					<c:if test="${role == \'admin\'}">
						<div class="active">
							<a class="btn btn-danger" href="${pageContext.request.contextPath}/deleteProduct?id=${product.id}" role="button">XOÁ</a>
							<a class="btn btn-info" href="${pageContext.request.contextPath}/updateProduct?id=${product.id}" role="button">CHỈNH SỬA</a>
						</div>
					</c:if>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>