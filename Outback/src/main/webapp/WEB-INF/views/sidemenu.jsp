<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>SideMenu</title>
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
	<div style="text-align:left; width:1200px; position:relative;  margin-top:40px; margin-left:100px;">
		<h1 style="font-weight:bold; font-size:40px; letter-spacing:6px;">사이드 메뉴</h1>
      	<h2 style="font-weight:bold; color:#ccc; margin-bottom:30px; font-size:22px; letter-spacing:4px;">Side-Menu</h2>
      	<hr>
      </div> 
	<div class="container O_container">
		<ul class="menu_wrap">
			<li class="menu_box">
				<div>
					<img style="width: 350px; height: 250px;"
						src="https://littlespicejar.com/wp-content/uploads/2018/07/Crispy-Chicken-Salad-with-BBQ-Honey-Mustard-Dressing-13-720x540.jpg"
						alt="My Image">
				</div>
				<h3>Chicken tender salad</h3>
				<h4>12,000 Won</h4>
				<p>바삭바삭한 치킨텐더와 신선한 야채가 만나 손이 갈 수 밖에 없는 치킨텐더 샐러드입니다. 
				먹기 좋은 크기로 잘라진 두툼한 치킨텐더와 야채를 상큼한 머스타드 드레싱과 함께 즐겨보세요. 
				어른, 아이 할 것 없이 함께 둘러앉아 즐길 수 있는 메뉴랍니다.</p>
			</li>
			<li class="menu_box">
				<div>
					<img style="width: 350px; height: 250px;"
						src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA5MDhfMjA5%2FMDAxNjMxMDg4ODAxNjI4.jGgIg_SKPAwMuFo4LaXEEh9mhG9gSq220MpGlmOOvysg.FVrD5lnCq1Zd7GAgdEiN-GUnGcK1Nzhv-Ic8OWYy8owg.JPEG.berryhill626%2F20210828%25A3%25DF181353%25A3%25DF06.jpg&type=sc960_832"
						alt="My Image">
				</div>
				<h3>Shrimp gambas salad</h3>
				<h4>15,000 Won</h4>
				<p>스파이시한 감바스와 다양한 야채를 함께 즐길수 있는 웜 샐러드 입니다.</p>
			</li>
			<li class="menu_box">
				<div>
					<img style="width: 350px; height: 250px;"
						src="http://embed.widencdn.net/img/beef/aqba2gbf7l/exact/beef-steak-salad-with-dried-cherries-horizontal-aerial.tif?keep=c&u=7fueml"
						alt="My Image">
				</div>
				<h3>Beef tender salad</h3>
				<h4>17,000 Won</h4>
				<p>두툼하고 육즙이 가득한 채끝 등심과 신선한 야채가 만나 육즙의 풍미와
				야채의 신선함을 동시에 느낄수 있는 비프텐더 샐러드 입니다.</p>
			</li>
		</ul>
		<div class="menu-notice">
					<h4>NOTICE</h4>
					<p class="txt">- 식자재 수급이 원활하지 않아, 감자튀김이 제공되는 일부 메뉴에 한하여 다른 메뉴로 대체 제공되고 있습니다. 양해부탁드립니다.
<br>- 모든 메뉴 가격은 부가세가 포함된 금액입니다. 
<br>- 매장 사정에 따라 일부 매장의 메뉴는 홈페이지 메뉴와 상이할 수 있습니다.
</p>
				</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>