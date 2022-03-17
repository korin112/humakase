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
<style>
.main_container{
	background:url('https://www.outback.co.kr/asset/images/content/main_benefit_visual.jpg') center no-repeat;
	background-size:cover;
	height:70vh;
}
.carousel-inner{
	overflow:hidden;
	margin:0 auto;
	position:relative;
	width:1390px;
}

</style>



<body>
<%@include file ="header.jsp" %>
<div class="main_container">
	<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" style="margin-top:45px; margin-left:50px; float:left; width:480px; height:620px;">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
		</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="https://www.outback.co.kr/upload/banner/20180627/20180627183554751017.jpg" alt="...">
						<div style="color:white;">
							
						</div>
				</div>
				<div class="carousel-item">
					<img src="https://www.outback.co.kr/upload/banner/20190108/20190108172841884005.jpg"  alt="...">
						<div style="color:white;">
<<<<<<< HEAD
						
=======
							
>>>>>>> branch 'main' of https://github.com/korin112/humakase.git
						</div>
				</div>
				<div class="carousel-item">
					<img src="https://www.outback.co.kr/upload/banner/20201019/20201019101227003222.jpg"  alt="...">
						<div style="color:white;">
<<<<<<< HEAD
						
=======
							
>>>>>>> branch 'main' of https://github.com/korin112/humakase.git
						</div>
				</div>
				<div class="carousel-item">
					<img src="https://www.outback.co.kr/upload/banner/20180627/20180627183609110019.jpg"  alt="...">
						<div style="color:white;">
<<<<<<< HEAD
=======
							
>>>>>>> branch 'main' of https://github.com/korin112/humakase.git
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
	</div>
	
</div>

<%@include file ="footer.jsp" %>
</body>
</html>
