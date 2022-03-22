<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${mtypename}</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<style>
.displaynone{display:none;}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="submenu_title_wrap">
		<div class="container submenu_title">
			<h1><c:out value="${mtypename}" /></h1>
			<p>La Campanella - <c:out value="${mtypename}" /></p>
		</div>
	</div>
	<div class="container O_container">
		<ul class="menu_wrap fixed">
			<c:forEach items="${menu}" var="menu">
				<li class="menu_box" data-value="${menu.menu_code}">
					<div class="menu_imgbox">
						<img src="${menu.img}" alt="${menu.menu_name}-image">
						<div class="menu_info">
							<p>${menu.comment}</p>
							<div>
								<c:choose>
									<c:when test="${mtypename=='STEAK' or mtypename eq 'PASTA'}">
										<button type="button" class="text-white addCart">메뉴담기</button>
										<button type="button" class="text-white goBook">예약하기</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="text-white addCart">메뉴담기</button>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<h4 class="menu_name">${menu.menu_name}</h4>
					<p class="menu_price" data-value="${menu.menu_price}">
						<span class="fs-3"><fmt:formatNumber value="${menu.menu_price}" type="number"/></span>원
					</p>
				</li>
			</c:forEach>
		</ul>
		<div class="menu-notice">
			<h4>NOTICE</h4>
			<ul class="txt">
				<li>모든 메뉴 가격은 부가세가 포함된 금액입니다.</li> 
				<li>매장 사정에 따라 일부 매장의 메뉴는 홈페이지 메뉴와 상이할 수 있습니다.</li>
				<li>최상의 품질로 스테이크를 제공하기 위해 한정수량으로 판매하며, 포장 불가합니다.</li>
				<li>시즌에 따라 블랙라벨 스테이크의 가니시는 변경될 수 있습니다.</li>
			</ul>
		</div>
		<div class="displaynone"></div>
	</div>
	<%@include file="footer.jsp"%>
	<script>
		$(document)
		.ready(function(){ // db데이터 내에 있는 메뉴 정 
			$('.menu_box').mouseover(function(){
				$('.menu_info',this).css('top','0');
			});
			$('.menu_box').mouseout(function(){
				$('.menu_info',this).css('top','100%');
			});
		})
		.on('click', '.addCart', function(){ // 장바구니에 담기 클릭시 실행
			let userid = "${userid}";
			if(userid == ""){ // 로그인이 안되어있을 경우
				alert("로그인 후 이용 가능합니다.");
			} else {
				$.ajax({ // 로그인이 되있을 경우 장바구니에 추가
					url:'/outback/insertCart',
					data:{
						menu_code:$(this).closest('.menu_box').attr('data-value'),
						menu_name:$(this).closest('.menu_imgbox').siblings('.menu_name').text(),
						menu_price:$(this).closest('.menu_imgbox').siblings('.menu_price').attr('data-value')
					},
					dataType:'text',
					method:'POST',
					success:function(txt) {
						if(txt=="addCart") {
							alert('장바구니에 추가 되었습니다.');
						} else if(txt=="updateCart"){
							alert('이미 추가된 메뉴입니다.\n수량을 추가하였습니다.')
						} else {
							alert('다시 시도해주세요.');
						}
					},
					error:function(){
						alert("[error] 다시 시도해주세요.");
					}
				});
			}
		})
		.on('click', '.goBook', function(){ // 예약하기 클릭
			let userid = "${userid}";
			if(userid == ""){ // 예약하기를 비로그인 상태로 클릭시
				alert("로그인 후 이용 가능합니다.");
			} else{ // 예약하기를 로그인 상태로 클릭시
				let menu_code = $(this).closest('.menu_box').attr('data-value');
				let input_menu_code = '<input name="menu_code" type="hidden" value="' + menu_code + '">';
				let bookForm = '<form action="/outback/book" method="POST" class="bookForm">' + input_menu_code + '</form>';
				$(".displaynone").append(bookForm);
				$('.bookForm').submit();
			}
		})
		;
	</script>
</body>
</html>