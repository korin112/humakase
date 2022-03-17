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
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick-theme.min.css">
<link rel="stylesheet" href="${path}/resources/css/style.css">
<meta charset="UTF-8">
<title>Home</title>	
</head>
<style>
</style>



<body>
<%@include file ="header.jsp" %>
<div class="main_container">
	<div class="visual">
		<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="${path}/resources/images/visual01.jpg">
				</div>
				<div class="carousel-item">
					<img src="${path}/resources/images/visual02.jpg">
					<div style="color:white;">
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
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
				</div>
			</div> 
		</div>
	</div>
	<section class="main_section">
		<div class="container">
			<h3>NEW MENU</h3>
			<div>
				<div class="slide-box">
					<ul class="new_menu_slide">
						<li class="slide-contents">
							<div>이미지 위치</div>
							<h5>메뉴이름</h5>
						</li>
					</ul>
					<!-- //event-slide  -->

					<!-- 슬라이드 재생, 정지 버튼 -->
<!-- 					<div class="slide-btnGR"> -->
<!-- 						<button class="play-pause pause" id="slideToggle">pause</button> -->
<!-- 					</div> -->
				</div>
			</div>
		</div>
	</section>
	<section>
		여기에 뭐들어갈까
	</section>
</div>

<%@include file ="footer.jsp" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.min.js"></script>
<script>
	var slider = $('.new_menu_slide');
	var option = function(centerMode) {
		return {
			autoplay : true,
			swipeToSlide : true,
			arrow : true,
			centerMode : true,
			centerPadding : '20',
			slidesToShow : centerMode ? 3 : 1,
			slidesToScroll : 1,
			dots : true,
			infinite : true,
			variableWidth : true,
			responsive : [ {
				breakpoint : 768,
				settings : {
					slidesToShow : 1
				}
			} ]
		}
	}

	// 슬라이드 5개 미만일때
	slider.each(function(i, el) {
		if ($(el).find('li').length > 3) {//최대개수
			$(el).slick(option(true));
		} else {
			$(el).slick(option()).addClass('item--center');
			$('#slideToggle').hide()
		}
	});

	// slide play,stop button
	$('#slideToggle').click(function() {
		if ($(this).html() == 'pause') {
			$('.event-slide').slick('slickPause')
			$(this).html('play')
			$(this).addClass('play')
			$(this).removeClass('pause')
		} else {
			$('.event-slide').slick('slickPlay')
			$(this).html('pause')
			$(this).addClass('pause')
			$(this).removeClass('play')
		}
	});
</script>
</body>
</html>
