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
	background-color: #FFF;
}
</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="headerAdmin.jsp"></jsp:include>
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item bg-light"><a href="${pageContext.request.contextPath}/home">TRANG CHỦ</a></li>
				<li class="breadcrumb-item bg-light"><a href="${pageContext.request.contextPath}/administration">QUẢN LÍ</a></li>
				<li class="breadcrumb-item active bg-light" aria-current="page">QUẢN LÍ ĐƠN HÀNG</li>
			</ol>
		</nav>
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Sản phẩm</th>
					<th scope="col">Người mua</th>
					<th scope="col">Email</th>
					<th scope="col">Phone</th>
					<th scope="col">Address</th>
					<th scope="col">Thời gian mua hàng</th>
					<th scope="col">Phương thức thanh toán</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderViewList}" var="orderView">
					<tr>
						<th scope="row">${orderView.id}</th>
						<td>${orderView.product}</td>
						<td>${orderView.user}</td>
						<td>${orderView.email}</td>
						<td>${orderView.phone}</td>
						<td>${orderView.address}</td>
						<td>${orderView.time}</td>
						<td>${orderView.payment}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>