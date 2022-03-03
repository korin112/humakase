<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>- cart -</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<style>
	.cart{width:100%;}
	.cart thead tr{border-top:2px solid #ccc; border-bottom: 2px solid #ccc;}
	.cart thead tr th{padding:1.25rem 0; text-align:center;}
</style>
</head>
<body>
	<%@include file = "header.jsp" %>
	<div class="container O_container">
		<table class="cart">
			<thead><tr><th><input type="checkbox"></th><th>상품명</th><th>수량</th><th>판매가</th><th>합계</th></tr></thead>
			<tbody>
				
			</tbody>
		</table>
	</div>
	<%@include file ="footer.jsp" %>
</body>
</html>