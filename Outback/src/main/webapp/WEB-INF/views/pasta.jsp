<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Pasta</title>
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
	<%@include file ="header.jsp" %>
	<div style="text-align:left; width:1200px; position:relative;  margin-top:40px; margin-left:100px;">
	
		<h1 style=" font-weight:bold; font-size:40px; letter-spacing:6px;">파스타</h1>
      	<h2 style=" font-weight:bold; color:#ccc; margin-bottom:30px; font-size:22px; letter-spacing:4px;">Pasta</h2>
      <hr>
      </div> 
	<div class="container O_container">
		<ul class="menu_wrap">
			<li class="menu_box">
				<div>
					<img style="width: 350px; height: 250px;"
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd43vWLUlGv8kfBmzg_CYXLe-1wh3A-_ADlw&usqp=CAU"
						alt="My Image">
				</div>
				<h3>Toowoomba pasta</h3>
				<h4>24,000 Won</h4>
				<p>그라나 파다노 치즈와 새우, 양송이를 함께 볶아 깊고 진한 크림소스 파스타 입니다.</p>
			</li>
			<li class="menu_box">
				<div>
					<img style="width: 350px; height: 250px;"
						src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTEwMDNfMTk4%2FMDAxNjMzMjY4MjQwNjQ2.V1zW6d7DQx33ACm47mf3fTH_2rYKlOsD-htSp1Mh094g.0ZxF4BnYgLeQFQJ1duW9pPi0ZkTPpienTcndUP-lGTsg.JPEG.ceunseo44%2Foutput_3478870214.jpg&type=sc960_832"
						alt="My Image">
				</div>
				<h3>Toowoomba steak pasta</h3>
				<h4>27,500 Won</h4>
				<p>부드러운 스테이크와 최고의 투움바 소스로 맛을 낸 최고의 파스타 입니다.</p>
			</li>
			<li class="menu_box">
				<div>
					<img style="width: 350px; height: 250px;"
						src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20151120_162%2F91kitten_14479786680196HCwO_JPEG%2FP20151119_194602955_74AD2D10-4514-46E9-A947-3285A5AA7EE7.JPG&type=sc960_832"
						alt="My Image">
				</div>
				<h3>Spicy toowoomba pasta</h3>
				<h4>24,500 Won</h4>
				<p>최고의 투움바 소스에 매운 맛과 풍미를 더한 파스타 입니다.</p>
			</li>
			<li class="menu_box">
				<div>
					<img style="width: 350px; height: 250px;"
						src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxOTA3MTZfNjAg%2FMDAxNTYzMjU2OTQyNTIw.EaQtRF453U3OXCcqBamqRbypvt18bW6zi71mozMTujcg.m8mQJp1AWnB9o8lWLB4eQ_79oPLbHXSJRCzml7ziwl4g.JPEG.hotzosel%2Foutput_1455330766.jpg&type=sc960_832"
						alt="My Image">
				</div>
				<h3>Spicy seafood aglio olio</h3>
				<h4>26,500 Won</h4>
				<p>관자, 새우, 오징어를 갈릭 올리브 오일에 함께 볶아낸 오일 파스타 입니다.</p>
			</li>
			<li class="menu_box">
				<div>
					<img style="width: 350px; height: 250px;"
						src="https://food.fnr.sndimg.com/content/dam/images/food/fullset/2010/3/18/0/Bertolli_Shrimp-Arrabbiata_s4x3.jpg.rend.hgtvcom.616.462.suffix/1371591107518.jpeg"
						alt="My Image">
				</div>
				<h3>Shrimp arrabbiata</h3>
				<h4>28,000 Won</h4>
				<p>갈릭 오일에 볶은 새우를 더하고 매콤하게 즐길수 있는 정통 이탈리안 토마토 파스타 입니다.</p>
			</li>
		</ul>
		<div class="menu-notice">
					<h4>NOTICE</h4>
					<p class="txt">- 식자재 수급이 원활하지 않아, 감자튀김이 제공되는 일부 메뉴에 한하여 다른 메뉴로 대체 제공되고 있습니다. 양해부탁드립니다.
<br>- 모든 메뉴 가격은 부가세가 포함된 금액입니다. 
<br>- 매장 사정에 따라 일부 매장의 메뉴는 홈페이지 메뉴와 상이할 수 있습니다.
<br>- 메뉴별 자세한 원산지 정보는 매장 내 "아웃백 대표 원산지 표시판" 참고 부탁드립니다.
<br>- 시즌에 따라 블랙라벨 스테이크의 가니시는 변경될 수 있습니다.</p>
				</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>