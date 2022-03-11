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
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="submenu_title_wrap">
		<div class="container submenu_title">
			<h1><c:out value="${menuname}" /></h1>
			<p>La campanella - <c:out value="${menuname}" /></p>
		</div>
	</div>
	<div class="container O_container">
		<ul class="menu_wrap fixed">
			<c:forEach items="${menu}" var="menu">
				<li class="menu_box" data-value="${menu.menu_code}">
					<div class="menu_imgbox">
						<img src="${menu.img}" alt="${menu.menu_name}-image">
						<div class="menu_info">
							<p>${menu.comment}</p>
							<div>
								<a href="#" class="text-white">메뉴담기</a>
								<a href="#" class="text-white">예약하기</a>
							</div>
						</div>
					</div>
					<h4 class="menu_name">${menu.menu_name}</h4>
					<p class="menu_price">
						<span class="fs-3"><fmt:formatNumber value="${menu.menu_price}" type="number"/></span>원
					</p>
				</li>
			</c:forEach>
		</ul>
		<div class="menu-notice">
			<h4>NOTICE</h4>
			<ul class="txt">
				<li>모든 메뉴 가격은 부가세가 포함된 금액입니다.</li> 
				<li>매장 사정에 따라 일부 매장의 메뉴는 홈페이지 메뉴와 상이할 수 있습니다.</li>
				<li>최상의 품질로 스테이크를 제공하기 위해 한정수량으로 판매하며, 포장 불가합니다.</li>
				<li>시즌에 따라 블랙라벨 스테이크의 가니시는 변경될 수 있습니다.</li>
			</ul>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	<script>
		$(document)
		.ready(function(){
			$('.menu_box').mouseover(function(){
				$('.menu_info',this).css('top','0');
			});
			$('.menu_box').mouseout(function(){
				$('.menu_info',this).css('top','100%');
			});
		})
		;
	</script>
</body>
</html>