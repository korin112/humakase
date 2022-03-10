<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<meta charset="UTF-8">
<title>Home</title>	
</head>
<jsp:include page="header.jsp" />
<h1 style="margin-top:40px;"><a href="/outback/home" style="color:black; font-weight:bold; font-size:40px; letter-spacing:8px; ">HUMAKASE</a></h1>
<div class="page-title">
<h2 style="font-weight:bold; font-size:29.5px; margin-top:15px; letter-spacing:8px; margin-left:10px;"></h2>
<h3 style="font-weight:bold; letter-spacing:13px; color:#ccc; font-size:20px; margin-left:13px; margin-top:15px;">RESTAURANT</h3>
</div> 
<body style="text-align:center;">
      <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" style="margin-top:60px; margin-bottom:100px; margin-right:60px; margin-left:60px;">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4" aria-label="Slide 5"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="5" aria-label="Slide 6"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="6" aria-label="Slide 7"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="7" aria-label="Slide 8"></button>
    
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img style="width: 350px; height: 900px;" src="https://food.fnr.sndimg.com/content/dam/images/food/fullset/2007/1/2/0/valentines_steak.jpg.rend.hgtvcom.826.620.suffix/1557859049553.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>T-bone</h5>
        <p>소의 안심과 등심사이, T자형 뼈 가운데 T자형 뼈의 좌우로 안심 / 등심이 나뉘어지며 스테이크 부위로는
					고급에 속하는 부위이고, 최고의 육질과 육즙을 선사하는 스테이크 입니다.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img style="width: 350px; height: 900px;" src="https://img.insight.co.kr/static/2019/12/09/700/e842mx2j26ba019u846t.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Tomahawk </h5>
        <p>Tomahawk는 육류 중에서 손잡이처럼 길다란 갈비뼈를 감싸는 갈비살이 등심에 붙어있는 형태로 정형된 고기를
					구운 스테이크 입니다.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img style="width: 350px; height: 900px;" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxOTA3MTZfNjAg%2FMDAxNTYzMjU2OTQyNTIw.EaQtRF453U3OXCcqBamqRbypvt18bW6zi71mozMTujcg.m8mQJp1AWnB9o8lWLB4eQ_79oPLbHXSJRCzml7ziwl4g.JPEG.hotzosel%2Foutput_1455330766.jpg&type=sc960_832" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Spicy seafood aglio olio</h5>
        <p>관자, 새우, 오징어를 갈릭 올리브 오일에 함께 볶아낸 오일 파스타 입니다.</p>
      </div>
    </div>
<div class="carousel-item">
      <img style="width: 350px; height: 900px;" src="https://food.fnr.sndimg.com/content/dam/images/food/fullset/2010/3/18/0/Bertolli_Shrimp-Arrabbiata_s4x3.jpg.rend.hgtvcom.616.462.suffix/1371591107518.jpeg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Shrimp arrabbiata</h5>
        <p>갈릭 오일에 볶은 새우를 더하고 매콤하게 즐길수 있는 정통 이탈리안 토마토 파스타 입니다.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img style="width: 350px; height: 900px;" src="https://littlespicejar.com/wp-content/uploads/2018/07/Crispy-Chicken-Salad-with-BBQ-Honey-Mustard-Dressing-13-720x540.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Chicken tender salad </h5>
        <p>바삭바삭한 치킨텐더와 신선한 야채가 만나 손이 갈 수 밖에 없는 치킨텐더 샐러드입니다.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img style="width: 350px; height: 900px;" src="http://embed.widencdn.net/img/beef/aqba2gbf7l/exact/beef-steak-salad-with-dried-cherries-horizontal-aerial.tif?keep=c&u=7fueml" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Beef tender salad </h5>
        <p>두툼하고 육즙이 가득한 채끝 등심과 신선한 야채가 만나 육즙의 풍미와
				야채의 신선함을 동시에 느낄수 있는 비프텐더 샐러드 입니다.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img style="width: 350px; height: 900px;" src="https://mblogthumb-phinf.pstatic.net/MjAxNzAxMjBfMTEz/MDAxNDg0ODk5OTk5MTMz.EgG12jl0uI7Loc6MHM_3OcefV93kk7scCyjj2Nd85f0g.BwD0Eq7BduwB7rEtW74Zfwqu1SzcZK2reH6ZqPzqnmwg.JPEG.kkddh93/554319.jpg?type=w800" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Mojito </h5>
        <p>시원한 모히또와 달콤한 음료수의 만남으로 상쾌한 느낌이 나는 음료입니다.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img style="width: 350px; height: 900px;" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgq4p_B3ytW5PofSPPPp2-j6y1Wp_PP0nhtw&usqp=CAU" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Beer</h5>
        <p>은은한 보리향과 톡 튀는 탄산으로 깔끔한 뒷맛이 예술인 음료입니다.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
