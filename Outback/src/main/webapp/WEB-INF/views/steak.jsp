<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${menuname}</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<style>

* {
	margin: 0;
	padding: 0;
}

ul, li {
	list-style: none;
}

li {
	display: inline-block;
}

.fixed::after {
	content: '';
	clear: both;
	display: block;
}



.menu_wrap {
	width: 100%;
	overflow: hidden;
}

.menu_box {
	float: left;
	width: 33%;
	height : 480px;
	box-sizing: border-box;
}

.menu_box img{
	width:100%;
}

.menu_box:nth-child(2) {
	margin: 0 0.33%;
}

.menu_box:nth-child(3n+2) {
	margin: 0 0.33%;
}
.menu-notice{
	padding : 40px;
	border : 1px solid #ccc;
}

</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="container O_container">
		<div
			style="text-align: left; width: 1200px; position: relative; margin-top: 40px; margin-left: 100px;">
			<h1 style="font-weight: bold; font-size: 40px; letter-spacing: 6px;">
				<c:out value="${menuname}" />
			</h1>
			<h2
				style="font-weight: bold; color: #ccc; margin-bottom: 30px; font-size: 22px; letter-spacing: 4px;">
				<c:out value="${menuname}" />
			</h2>
			<hr>
		</div>
		<ul class="menu_wrap">
			<c:forEach items="${menu}" var="menu">
				<li class="menu_box" data-value="${menu.menu_code}">
					<div>
						<img src="${menu.img}" alt="${menu.img}">
					</div>
					<h3>${menu.menu_name}</h3>
					<h4>${menu.menu_price}</h4>
					<p>${menu.comment}</p>
				</li>
			</c:forEach>
		</ul>
		<div class="menu-notice">
			<h4>NOTICE</h4>
			<p class="txt">
				- 모든 메뉴 가격은 부가세가 포함된 금액입니다. 
				<br>- 매장 사정에 따라 일부 매장의 메뉴는 홈페이지 메뉴와
				상이할 수 있습니다.
				<br>- 최상의 품질로 스테이크를 제공하기 위해 한정수량으로 판매하며, 포장 불가합니다.
				<br>- 시즌에 따라 블랙라벨 스테이크의 가니시는 변경될 수 있습니다.
			</p>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>