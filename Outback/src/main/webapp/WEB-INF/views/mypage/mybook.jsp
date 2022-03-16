<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>- My Reservation -</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/modals.css">
<link rel="stylesheet" href="${path}/resources/css/style.css">
<script src="${path}/resources/js/mypage.js"></script>
<style>
	.mybook_tt{display:flex; margin:0 auto 3rem; padding:0; justify-content:center;}
	.mybook_tt li{border:1px solid #ccc; width:50%;}
	.mybook_tt li:first-child{border-right:0;}
	.mybook_tt a{color:inherit;font-weight:700; display:block; padding:1rem 1.25rem;}
	.mybook_tt a:hover{color:#c93535;}
	.mybook_tt li.active{border-color:#c93535;}
	.mybook_tt li.active a{background:#c93535; color:#fff;}
	.mybook_ct ul{padding:0;}
</style>
</head>
<body>
	<%@include file ="../header.jsp" %>
	<div class="submenu_title_wrap">
		<div class="container submenu_title">
			<h1>My RESERVATION</h1>
			<p>Mypage - RESERVATION</p>
		</div>
	</div>
	<div class="container O_container">
		<div>
			<ul class="mybook_tt">
				<li class="active"><a href="#">예정된 예약내역</a></li>
				<li><a href="#">지난 예약내역</a></li>
			</ul>
		</div>
		<div class="mybook_ct">
			<ul>
				<li id="laterMybook">
					<%@include file ="laterMybook.jsp" %>
				</li>
				<li id="prevMybook">
					<%@include file ="prevMybook.jsp" %>
				</li>
			</ul>
		</div>
	</div>
	<%@include file ="../footer.jsp" %>
		<script>
		// 공통
		function all_paging(page, range, rangeSize){
			console.log();
			if($('#laterMybook').show()==true){
				var url = "${pageContext.request.contextPath}/mypage/mybook?where=later";
			} else {
				var url = "${pageContext.request.contextPath}/mypage/mybook?where=prev";
			}
			url = url + "?range=" + range + "&page=" + page;
			location.href = url;
		}
		//이전 버튼 이벤트
		function fn_prev(page, range, rangeSize) {
			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;
			all_paging(page, range, rangeSize);
		}
		//페이지 번호 클릭
		function fn_pagination(page, range, rangeSize, searchType, keyword) {
			all_paging(page, range, rangeSize);
		}
		//다음 버튼 이벤트
		function fn_next(page, range, rangeSize) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			all_paging(page, range, rangeSize);
		}
		

	</script>
</body>
</html>