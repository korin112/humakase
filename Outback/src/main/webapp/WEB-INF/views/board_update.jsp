<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<style>
	*{margin:0; padding:0;}
	ul, li{list-style:none;}
	.fixed::after{content:''; clear:both; display:block;}
	.option .dropdown-toggle::after{margin-left:1.255rem;}
	.dropdown-menu{max-height:200px; overflow-y:auto; overflow-x:hidden;}
	.dropdown-item{cursor:pointer;}
	.book-list{overflow:hidden;}
	.book-list article{display:block; margin:3.5rem 1.25rem; width:Calc(55% - 1.25rem); height:100%; float:left;}
	.booking_info_box > ul{display:table; width:100%; margin:0; padding:0; border-bottom:1px solid #ddd;}
	.booking_info_box > ul:first-child{border-top:1px solid #ddd;}	
	.booking_info_box > ul > li{width:70%; display:table-cell; padding:1.25rem 0 1.25rem 2.125rem;}
	.booking_info_box > ul > li:first-child{width:30%; vertical-align:middle; background:#f9f9f9;}
	.booking_info_box input{border:none;}
	.booking_info_box li #title{width:100%; resize:none; border:1px solid #ddd; padding:0.5rem; height:45px;}
	.booking_info_box li #content{width:100%; resize:none; border:1px solid #ddd; padding:0.5rem; height:300px;}
</style>
</head>
<body>
<%@include file ="header.jsp" %>
	<div class="container O_container">
	<section class="book-list fixed">
		<article class="booking_info_box">
		<input type="hidden" id="board_id" name="board_id" value="${b.board_id}">
		<ul class="fixed">
				<li>제목</li>
				<li><input type="text" id="title" name="title" value="${b.title}" maxlength="30" placeholder="최대 30자까지 가능합니다." spellcheck=false></li>
			</ul>
			<ul class="fixed">
				<li>방문일</li>
				<li><input name="updateDate" readonly="readonly" value="${b.vdate}"></li>
			</ul>
			<ul class="fixed">
				<li>지점</li>
				<li><input name="spot" readonly="readonly" value="${b.spot_name}"></li>
			</ul>
			<ul class="fixed">
				<li>메뉴</li>
				<c:forEach items="${menu_name}" var="m">
					<ul><li data-value="${m.menu_name}">${m.menu_name}</li></ul>
				</c:forEach>
			</ul>
			<ul class="fixed">
				<li>내용</li>
				<li><textarea id="content" name="content" maxlength="500" placeholder="최대 500자까지 가능합니다." spellcheck=false>${b.content}</textarea></li>
			</ul>
			<ul class="fixed">
				<li>작성자</li>
				<li><input name="writer" readonly="readonly" value="${b.writer}"></li>
			</ul>
			<ul class="fixed">
				<li>수정일</li>
				<li><input name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${b.updated}"/>'></li>
			</ul>
		<div>
			<button id="update">수정</button>	
			<button id="cancel">취소</button>
		</div>	
		</article>
	</section>
	</div>
	<%@include file ="footer.jsp" %>
	<script>
		$(document)
		.on('click','#cancel',function() {
			if(!confirm("취소하시면 이전 화면으로 돌아갑니다. 취소하시겠습니까?")) return false;
			document.location="/outback/getBoard?board_id="+$('#board_id').val();
		})
		.on('click','#update',function() {
			$.ajax({url:'/outback/board_update',
					data:{board_id:$('#board_id').val(),
						  title:$('#title').val(),
						  content:$('#content').val()},
					method:'POST',
					datatype:'json',
					success:function(txt) {
						console.log($('#board_id').val()+","+$('#title').val()+","+$('#content').val());
						console.log(txt);
						if(txt=="ok") {
							alert('수정 완료했습니다.');
							document.location='/outback/board_list';
						} else {
							alert('다시 수정해주세요.');
						}
					}
			});
		})
	</script>
</body>
</html>