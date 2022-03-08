<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>SideMenu</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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

.container {
	width: 1320px;
	margin: 0 auto;
}

.menu_wrap {
	width: 100%;
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
	<div class="container">
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
	</div>
</body>
</html>