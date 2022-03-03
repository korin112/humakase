<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<style>
    *{margin:0; padding:0;}
    ul, li{list-style:none;}
    li{display:inline-block;}
    .fixed::after{content:''; clear:both; display:block;}
    .book-list ul {}
    .book-list li:first-child{width:150px;}
    .book-list li{width:450px;}
    article{display:inline-block;text-align:center;}
    .book-list, .order-list{font-size:1rem; display:inline-block;}
    .order-list{margin-right:calc(100% - (601px*2))}
.book-list article, .order-list article {width:595px; box-sizing:border-box;border:1px solid #ddd; padding:40px; display:inline-block; vertical-align:top; height:650px;}
.book-list article:first-child{margin-right:6px;}
.book-list input{font-size:1rem; border:none; text-align:right;}
.book-list input[type=button]{margin:10px 0; cursor:pointer; width:100%; text-align:center; padding:10px 0;}
.book-list input[type=submit]{margin-top:10px;cursor:pointer; width:100%; text-align:center; padding:10px 0;}
.book-list input[type=date]{padding:0; margin:0;}
.book-list ul{width:100%;}
.book-list ul li{float:left; text-align:right; border-bottom:1px solid #ccc; height:50px; line-height:50px; width:70%;}
.book-list ul li:first-child{width:30%; font-weight:500; text-align:left;}
.book-list .option{position:relative; background:#fff; cursor:pointer; padding-right:25px; box-sizing:border-box;}
.book-list .option::before{content:''; display:block; transform:rotate(45deg) translateY(-100%);
	position:absolute; right:10px; top:50%;
	border:4px solid #666; border-top-color:transparent; border-left-color:transparent;}
.book-list .option ul{position:absolute; right:0; top:100%; border:1px solid #ccc; box-sizing:border-box; background:#fff; width:160px; box-shadow:0px 0px 10px 1px rgb(0 0 0 / 10%);}
.book-list .option ul li{font-weight:300; text-align:right;height:auto; padding:5px 20px 5px 0; box-sizing:border-box; background:#fff; width:100%; line-height:1.2; white-space:nowrap; cursor:pointer;}
.book-list .option ul li:last-child{border-bottom:0;}
#getRoomList{width:100%; border-collapse:collapse;}
#getRoomList th{border:1px solid #ccc; padding:6px 0;}
#getRoomList tbody tr{cursor:pointer;}
#getRoomList tbody tr:hover{background:#f2f2f2;}
#getRoomList tbody tr td{text-align:center; padding:5px; box-sizing:border-box;}
    
</style>
</head>
<body>
	<%@include file ="header.jsp" %>
	<div class="container O_container">
		<section class="order-list">
			<article>
				
			</article>
		</section>
		<section class="book-list">
			<article>
				<ul class="fixed">
					<li>예약지점</li>
					<li class="option">
						<p>지점을 선택하세요.</p>
						<ul style="display:none;">
						<c:forEach items="${roomtypeList}" var="roomtypeList">
							<li data-value="${roomtypeList.type_code}">${roomtypeList.type_name}</li>
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
                    <li>
                        <ul style="display:none;">
                            <li>오전 9시 ~ 오전 10시</li>
                            <li>오전 10시 ~ 오전 10시</li>
                            <li>오전 11시 ~ 오전 10시</li>
                            <li>오전 12시 ~ 오전 10시</li>
                            <li>오전 13시 ~ 오전 10시</li>
                            <li>오전 14시 ~ 오전 10시</li>
                            <li>오전 15시 ~ 오전 10시</li>
                            <li>오전 16시 ~ 오전 10시</li>
                            <li>오전 17시 ~ 오전 10시</li>
                        </ul>
                    </li>
				</ul>
				<ul class="fixed">
					<li>방문인원</li>
					<li><input type="number" id="howmany" min="1" value="1">명</li>
				</ul>
				<ul class="fixed">
				<li>주문목록</li>
				<li>
					<ul style="display: none;">
						<c:forEach items="${roomtypeList}" var="roomtypeList">
							<li>메뉴이름</li>
							<li data-value="${roomtypeList.type_code}">가격${roomtypeList.type_name}</li>
							<li>수량</li>
						</c:forEach>
					</ul>
				</li>
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
                <ul>
                    <li>총 주문 금액</li>
                    <li>2500원</li>
                </ul>
                <div><button>form안에 넣고 전송할수도</button></div>
			</article>
			<!-- <article>
				<form action="/project/insertBook" method="POST">
					<ul>
						<li>예약지점</li>
						<li><input type="text" class="get_roomtype" name="roomtype" placeholder="자동입력란" readonly></li>
					</ul>
					<ul>
						<li>방문일</li>
						<li><input type="text" class="get_in_date" name="in_date" placeholder="자동입력란" readonly></li>
					</ul>
	
					<ul>
						<li>방문인원</li>
						<li><input type="number" class="get_howmany" name="howmany" placeholder="자동입력란" readonly>명</li>
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
						<li>비용</li>
						<li><input type="text" class="get_howmuch" name="howmuch" placeholder="자동입력란" readonly>원</li>
					</ul>
					<div>
						<input type="submit" value="예약">
					</div>
				</form>
			</article> -->
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
		.on('click', '.option', function(){
			$('.option > ul').slideToggle();
			return false;
		})
		.on('click',function(e){ //문서 body를 클릭했을때
				if(e.target.className =="option"){
					return false;
				}
				$('.option > ul').slideUp();
		})
		.on('click', '.option > ul > li', function(){
			$('.option > p').text($(this).text()); 
			$('.option > p').attr('data-value',$(this).attr('data-value'));
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