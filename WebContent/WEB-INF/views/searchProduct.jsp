<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Yến sào Kennest</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resource/css/searchProduct.css'/>">
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
				<li class="breadcrumb-item active bg-light" aria-current="page">TÌM KIẾM</li>
			</ol>
		</nav>
		<div class="list-product">
			<c:forEach items="${products}" var="product">
				<div class="product">
					<a href="#"><img src="${product.image}"></a>
					<div class="product-infor">
						<span class="product-name">${product.productName}</span><br> 
						<span class="weight">Khối lượng: ${product.weight}g</span><br> 
						<span class="price">Giá bán: ${product.price}</span><br>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>