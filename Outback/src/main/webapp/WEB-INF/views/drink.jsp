<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Drink</title>
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

.O_container {
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
	<%@include file="header.jsp"%>
	<div class="container O_container">
		<ul class="menu_wrap">
			<li class="menu_box">
				<div>
					<img style="width: 350px; height: 250px;"
						src="https://us.123rf.com/450wm/olegdudko/olegdudko1601/olegdudko160109497/51088233-limonada-.jpg"
						alt="My Image">
				</div>
				<h3>Ade</h3>
				<h4>7,500 Won</h4>
				<p>상큼한 레몬의 시원한 음료와 함께 어우러져 달콤한 맛을 내는 음료입니다.</p>
			</li>
			<li class="menu_box">
				<div>
					<img style="width: 350px; height: 250px;"
						src="https://mblogthumb-phinf.pstatic.net/MjAxNzAxMjBfMTEz/MDAxNDg0ODk5OTk5MTMz.EgG12jl0uI7Loc6MHM_3OcefV93kk7scCyjj2Nd85f0g.BwD0Eq7BduwB7rEtW74Zfwqu1SzcZK2reH6ZqPzqnmwg.JPEG.kkddh93/554319.jpg?type=w800"
						alt="My Image">
				</div>
				<h3>Mojito</h3>
				<h4>9,000 Won</h4>
				<p>시원한 모히또와 달콤한 음료수의 만남으로 상쾌한 느낌이 나는 음료입니다.</p>
			</li>
			<li class="menu_box">
				<div>
					<img style="width: 350px; height: 250px;"
						src="https://cdn-blob.austria.info/cms-uploads-prod/default/0001/09/thumb_8047_default_teaser.jpeg?cachebuster=1614487380"
						alt="My Image">
				</div>
				<h3>Soft drink</h3>
				<h4>4,500 Won</h4>
				<p>상쾌한 탄산과 청량감으로 식사를 마무리 해주는 음료입니다.</p>
			</li>
			<li class="menu_box">
				<div>
					<img style="width: 350px; height: 250px;"
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQvu2EMH4aQkzDSkRVX6md_NUHJrIobXReFA&usqp=CAU"
						alt="My Image">
				</div>
				<h3>Coffee</h3>
				<h4>5,000 Won</h4>
				<p>진한 원두향과 따듯한 온기로 몸과 마음을 따뜻하게 보내게 해주는 음료입니다.</p>
			</li>
			<li class="menu_box">
				<div>
					<img style="width: 350px; height: 250px;"
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgq4p_B3ytW5PofSPPPp2-j6y1Wp_PP0nhtw&usqp=CAU"
						alt="My Image">
				</div>
				<h3>Beer</h3>
				<h4>5,500 Won</h4>
				<p>은은한 보리향과 톡 튀는 탄산으로 깔끔한 뒷맛이 예술인 음료입니다.</p>
			</li>
		</ul>
	</div>
	<%@include file ="footer.jsp" %>
</body>
</html>