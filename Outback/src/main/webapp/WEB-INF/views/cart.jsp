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
	.cart thead tr, .cart tfoot tr{border-top:2px solid #ccc; border-bottom: 2px solid #ccc;}
	.cart thead tr th, .cart tbody tr td, .cart tfoot tr td{padding:1.25rem 0; text-align:center;}
</style>
</head>
<body>
	<%@include file = "header.jsp" %>
	<div class="container O_container">
		<table class="cart">
			<thead><tr><th><input type="checkbox" value="All"></th><th>상품명</th><th>수량</th><th>판매가</th><th>합계</th></tr></thead>
			<tbody>
				<c:forEach items="${getCart}" var="getCart">
					<tr><td><input type="checkbox" value="${getCart.cart_code}"></td><td>${getCart.menu_name}</td><td>${getCart.menu_cnt}</td><td>${getCart.menu_price}</td><td>${getCart.menu_total}</td></tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr><td><button>선택삭제</button></td><td colspan="2" algin="right">총 결재금액</td><td>금액이 출력되는 부분</td></tr>
			</tfoot>
		</table>
	</div>
	<%@include file ="footer.jsp" %>
	<script>
		$(function(){
			console.log($('.cart > tbody > tr > td:last-child').text());
		});
	</script>
</body>
</html>