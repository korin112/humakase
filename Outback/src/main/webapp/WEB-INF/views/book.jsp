<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>- Book -</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<style>
	*{margin:0; padding:0;}
	ul, li{list-style:none;}
	.fixed::after{content:''; clear:both; display:block;}
	
	.O_container .order-list, .O_container .book-list{border-top:2px solid #ccc;}
	.O_container .book-list{border-bottom:2px solid #ccc;}
	.book_tap{border-bottom:2px solid #ccc; position:relative; padding:1rem 2.125rem; font-weight:700; font-size:1.125rem;}
	.taptt_arrow{width:5%; height:100%; position:absolute; right:0; top:0; background:#f2f2f2;}
	.bi-chevron-down, .bi-chevron-up{position:absolute; left:50%; top:50%; transform:translate(-50%, -50%);}
	.cart{width:100%;border-top:none; text-align:center;}
	.cart td, .cart th{padding:0.85rem;}
	.cart thead tr{border-bottom:1px solid #ccc;}
	.cart tbody tr{border-bottom:1px solid #eee;}
	.cart tbody tr:last-child{border-bottom:0;}
	.cart td{border-right:1px solid #eee;}
	.cart td:last-child{border-right:0;}
	.book-list{overflow:hidden;}
	.book-list article{display:block; margin:2.125rem 1.25rem; width:Calc(60% - 1.25rem); height:100%; float:left;}
	.book-list article:last-child{margin-left:0; border:1px solid #ccc; width:Calc(40% - 1.25rem * 2);}
	.book-list article > ul{padding:0 2.125rem; margin:1.25rem;}
	.book-list article > ul > li{width:69%; display:inline-block;}
	.book-list article > ul > li:first-child{width:30%;}
	.option .dropdown-toggle::after{margin-left:1.255rem}
</style>
</head>
<body>
	<%@include file ="header.jsp" %>
	<div class="container O_container">
		<section class="order-list">
			<div class="book_tap">
				주문 목록 확인
				<div class="taptt_arrow">
					<div class="arrow arrow_hide">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
			  				<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
						</svg>
					</div>
					<div class="arrow arrow_show" style="display:none;">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16">
	  						<path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
						</svg>
					</div>
				</div>
			</div>
			<table class="cart">
				<thead><tr><th>상품명</th><th>판매가</th><th>수량</th><th>합계</th></tr></thead>
				<tbody>
					<c:forEach items="${getCartlist}" var="getCartlist">
						<tr data-ctCode="${getCartlist.cart_code}">
							<td>${getCartlist.menu_name}</td>
							<td data-ctPrice="${getCartlist.menu_price}"><fmt:formatNumber value="${getCartlist.menu_price}" type="number"/></td>
							<td>${getCartlist.menu_cnt}</td>
							<td><fmt:formatNumber value="${getCartlist.menu_total}" type="number"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
		<section class="book-list fixed">
			<div class="book_tap">
				예약 정보 작성
				<div class="taptt_arrow">
					<div class="arrow arrow_hide">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
			  				<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
						</svg>
					</div>
					<div class="arrow arrow_show" style="display:none;">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16">
	  						<path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
						</svg>
					</div>
				</div>
			</div>
			<article>
				<ul class="fixed">
					<li>예약지점</li>
					<li class="dropdown option">
						<a href="#" class="dropdown-toggle link-dark" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							지점을 선택하세요
						</a>
						<ul class="dropdown-menu">
						<c:forEach items="${spot}" var="spot">
							<li class="dropdown-item" data-value="${spot.spot_code}">${spot.spot_name}</li>
						</c:forEach>
						</ul>
					</li>
				</ul>
				<ul class="fixed">
					<li>방문일</li>
                    <li><input type="date" id="in_date"></li>
				</ul>
				<ul class="fixed">
					<li>예약시간</li>
					<li class="dropdown option">
						<a href="#" class="dropdown-toggle link-dark" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							방문하실 시간을 선택해주세요.
						</a>
						<ul class="dropdown-menu">
						<c:forEach items="${vtime}" var="vtime">
							<li class="dropdown-item" data-value="${vtime.time_code}">${vtime.time_name}</li>
						</c:forEach>
						</ul>
					</li>
				</ul>
				<ul class="fixed">
					<li>방문인원</li>
					<li><input type="number" id="howmany" min="1" value="1">명</li>
				</ul>
				<ul>
					<li>예약자명</li>
					<li><input type="text" class="get_booker" name="booker" value="${userSession.name}" readonly></li>
                </ul>
                <ul>
                    <li>연락처</li>
                    <li><input type="text" class="get_mobile" name="mobile" value="${userSession.mobile}"></li>
                </ul>
                <ul>
                    <li>요청사항</li>
                    <li><textarea>글자수제한두기</textarea></li>
                </ul>
			</article>
			<article>
				<ul>
					<li>총 주문 금액</li>
					<li>2500원</li>
				</ul>
				<div><button>form안에 넣고 전송할수도</button></div>
			</article>
		</section>
		
	</div>
	<%@include file ="footer.jsp" %>
	<script>
		// 체크인에 오늘 날짜 입력
		let in_date= document.getElementById('in_date');
		let todayData = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().substring(0, 10);
		in_date.value = todayData;
		// 체크인 최소값 : 오늘 날짜
		in_date.setAttribute('min', todayData);
		
		// 체크인 날짜 변경시
		in_date.addEventListener('change',function(){
			if(in_date.value == ""){
			// 날짜 삭제시 오늘 날짜 입력
				in_date.value = todayData;
			} else if (in_date.value < todayData){
			// 이전 날짜 입력시(키보드 입력) alert 후 오늘 날짜 입력
				alert('이전 날짜로 예약할 수 없습니다. 날짜를 다시 선택해주세요.');
				in_date.value = todayData;
			}
		});
		
		if(typeof(document.getElementById('howmany').value) != Number){
			console.log('연산 기호 못넣게 만들거야!!!');
			console.log(typeof(document.getElementById('howmany').value));
		}
		
		$(document)
// 		.on('click', '.option', function(){
// 			$('.option > ul').slideToggle();
// 			return false;
// 		})
// 		.on('click',function(e){ //문서 body를 클릭했을때
// 				if(e.target.className =="option"){
// 					return false;
// 				}
// 				$('.option > ul').slideUp();
// 		})
		.on('click', '.option > ul > li', function(){
			$(this).parent('ul').prev().text($(this).text());
			console.log($(this).parent('ul').prev().text());
			$('.option > a').attr('data-value',$(this).attr('data-value'));
		})
		.on('click', '#btnView', function(){
			if($('.option p').attr('data-value') == null){
				alert('객실 종류를 선택해주세요.');
			}
			$.ajax({
				url : '/project/getBookList',
				data : {
					room_type : $('.option p').attr('data-value'),
					checkin : $('#in_date').val(),
					checkout : $('#out_date').val(),
					howmany : $('#howmany').val()
				},
				datatype : 'Json',
				method : 'post',
				beforeSend:function(){
					$('#getRoomList tbody').empty();
				},
				success : function(data) {
					for(i = 0; i < data.length; i++){
						let str = '<tr data-value="' + data[i]['id'] + '"><td class="roomname">'
								  + data[i]['name'] + '</td><td class="roomtype">'
								  + data[i]['type_name'] + '</td><td class="howmany">'
								  + data[i]['howmany'] + '</td><td class="howmuch">'
								  + data[i]['howmuch'] + '</td></tr>';
						$('#getRoomList tbody').append(str);
					}
				}
			});
		})
		.on('click','#getRoomList tbody tr', function(){
			$('.get_roomtype').val($('.roomtype', this).text());
			$('.get_in_date').val($('#in_date').val());
			$('.get_out_date').val($('#out_date').val());
			$('.get_roomname').val($('.roomname', this).text());
			$('.get_roomid').val($(this).attr("data-value"));
			$('.get_howmany').val($('.howmany', this).text());
			$('.get_howmuch').val($('.howmuch', this).text());
		});
	</script>

</body>
</html>