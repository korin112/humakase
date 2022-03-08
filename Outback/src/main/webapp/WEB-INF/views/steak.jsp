<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Steak</title>
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
	border: 1px solid #ccc;
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
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<div style="width:470px; position:relative; margin:auto; margin-top:40px;">
		<h1 style="text-align:center; font-weight:bold; font-size:40px; letter-spacing:6px;">스테이크</h1>
      	<h2 style="text-align:center; font-weight:bold; color:#ccc; margin-bottom:30px; font-size:22px; letter-spacing:4px;">Steak</h2>
      </div> 
	<div class="container O_container">
		<ul class="menu_wrap">
			<li class="menu_box">
				<div>
					<img style="width: 355px; height: 250px;"
						src="https://food.fnr.sndimg.com/content/dam/images/food/fullset/2007/1/2/0/valentines_steak.jpg.rend.hgtvcom.826.620.suffix/1557859049553.jpg"
						alt="My Image">
				</div>
				<h3>T-bone</h3>
				<h4>25,000 Won</h4>
				<p>소의 안심과 등심사이, T자형 뼈 가운데 T자형 뼈의 좌우로 안심 / 등심이 나뉘어지며 스테이크 부위로는
					고급에 속하는 부위이고, 최고의 육질과 육즙을 선사하는 스테이크 입니다.</p>
			</li>
			<li class="menu_box">
				<div>
					<img style="width: 355px; height: 250px;"
						src="https://img.insight.co.kr/static/2019/12/09/700/e842mx2j26ba019u846t.jpg"
						alt="My Image">
				</div>
				<h3>Tomahawk</h3>
				<h4>31,000 Won</h4>
				<p>Tomahawk는 육류 중에서 손잡이처럼 길다란 갈비뼈를 감싸는 갈비살이 등심에 붙어있는 형태로 정형된 고기를
					구운 스테이크 입니다.</p>
			</li>
			<li class="menu_box">
				<div>
					<img style="width: 355px; height: 250px;"
						src="https://i.pinimg.com/736x/c6/be/c2/c6bec2c1209f96a678fe17b7cdc88d3b.jpg"
						alt="My Image">
				</div>
				<h3>Black-Label</h3>
				<h4>35,000 Won</h4>
				<p>두툼하고 육즙이 가득한 채끝 등심을 이용 블랙라벨 스테이크 입니다.</p>
			</li>
		</ul>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>