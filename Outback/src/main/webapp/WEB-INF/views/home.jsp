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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
					<div class="carousel-caption d-none d-md-block">
						<img src="${path}/resources/images/visual_txt1.png">
					</div>
				</div>
				<div class="carousel-item">
					<img src="${path}/resources/images/visual02.jpg">
					<div class="carousel-caption d-none d-md-block">
						<img src="${path}/resources/images/visual_txt2.png">
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
	<section class="main_section1">
		<div>
			<h3>NEW MENU</h3>
			<div>
				<div class="slide-box">
					<ul class="new_menu_slide">
						<c:forEach items="${newmenu}" var="newmenu">
							<li class="slide-contents">
								<div class="newmenu_img"><img src="${newmenu.img}"></div>
								<h5>${newmenu.menu_name}</h5>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<div class="scrollTop">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-circle" viewBox="0 0 16 16">
			<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
		</svg>
	</div>
</div>

<%@include file ="footer.jsp" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.min.js"></script>
<script>
	$(function(){
		$('.new_menu_slide').slick({
			centerMode : true,
// 			autoplay : true,
			swipeToSlide : true,
			arrow : false,
			slidesToShow : 5,
			centerPadding: '0',
			dots : true,
			infinite : true,
			responsive: [{
				breakpoint: 1650,
				settings: {
				centerPadding: '0',
				slidesToShow: 3
				}
			}, {
				breakpoint: 950,
				settings: {
				centerPadding: '15%',
				slidesToShow: 1
				}
			}]
		})
// 		// slide play,stop button
// 		$('#slideToggle').click(function() {
// 			if ($(this).html() == 'pause') {
// 				$('.new_menu_slide').slick('slickPause')
// 				$(this).html('play')
// 				$(this).addClass('play')
// 				$(this).removeClass('pause')
// 			} else {
// 				$('.new_menu_slide').slick('slickPlay')
// 				$(this).html('pause')
// 				$(this).addClass('pause')
// 				$(this).removeClass('play')
// 			}
// 		});
		$('.scrollTop').click(function(){
			if($('html, body').scrollTop() != 0){
				$('html, body').animate({scrollTop: 0}, 100);
			}
		});
	});

</script>
</body>
</html>
