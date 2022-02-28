<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<section class="book-list">
			<article>
				<ul class="fixed">
					<li>예약 지점</li>
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
					<li>예약기간</li>
					<li>
						<p>체크인 <input type="date" id="in_date"></p>
						<p>체크아웃 <input type="date" id="out_date"></p>
					</li>
				</ul>
				<ul class="fixed">
					<li>숙박인원</li>
					<li><input type="number" id="howmany" min="1" value="1">명</li>
				</ul>
				<div>
					<input type="button" id="btnView" value="예약 가능 객실 조회">
				</div>
				<div>
					<table id="getRoomList">
						<thead>
							<tr>
								<th style="width:25%;">객실명</th><th style="width:35%;">객실종류</th>
								<th style="width:20%;">최대인원</th><th style="width:20%;">금액</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</article>
			<article>
				<form action="/project/insertBook" method="POST">
	<!-- 				<ul> -->
	<!-- 					<li>예약번호</li> -->
	<!-- 					<li><input type="text" id="book_id" name="book_id" placeholder="자동입력란" readonly></li> -->
	<!-- 				</ul> -->
					<ul>
						<li>객실종류</li>
						<li><input type="text" class="get_roomtype" name="roomtype" placeholder="자동입력란" readonly></li>
					</ul>
					<ul>
						<li>예약기간</li>
						<li>
							<p>체크인 <input type="text" class="get_in_date" name="in_date" placeholder="자동입력란" readonly></p>
							<p>체크아웃 <input type="text" class="get_out_date" name="out_date" placeholder="자동입력란" readonly></p>
						</li>
					</ul>
					<ul>
						<li>객실명</li>
						<li>
							<input type="text" class="get_roomname" name="roomname" placeholder="자동입력란" readonly>
							<input type="hidden" class="get_roomid" name="roomid" readonly>
						</li>
					</ul>
	
					<ul>
						<li>최대인원</li>
						<li><input type="number" class="get_howmany" name="howmany" placeholder="자동입력란" readonly>명</li>
					</ul>
					<ul>
						<li>예약자명</li>
						<li><input type="text" class="get_booker" name="booker" value="${userSession.name}" readonly></li>
					</ul>
					<ul>
						<li>휴대폰번호</li>
						<li><input type="text" class="get_mobile" name="mobile" value="${userSession.mobile}" readonly></li>
					</ul>
					<ul>
						<li>비용</li>
						<li><input type="text" class="get_howmuch" name="howmuch" placeholder="자동입력란" readonly>원</li>
					</ul>
					<div>
						<input type="submit" value="예약">
					</div>
				</form>
			</article>
		</section>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		// 체크인에 오늘 날짜 입력
		let in_date= document.getElementById('in_date');
		let todayData = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().substring(0, 10);
		in_date.value = todayData;
		// 체크인 최소값 : 오늘 날짜
		in_date.setAttribute('min', todayData);
		// 체크아웃 오늘 + 1일 입력
		let out_date = document.getElementById('out_date');
		let nextData = new Date(new Date(in_date.value).setDate(new Date(in_date.value).getDate()+1)).toISOString().substring(0, 10);
		out_date.value = nextData;
		// 체크아웃 최소값 : 오늘 + 1일
		out_date.setAttribute('min', nextData);
		
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
			// 체크아웃 날짜가 체크인 당일 포함 이전 날짜일때 체크아웃 날짜를 체크인 다음 날로 변경
			if(out_date.value <= in_date.value){
				nextData = new Date(new Date(in_date.value).setDate(new Date(in_date.value).getDate()+1)).toISOString().substring(0, 10);
				out_date.value = nextData;
				out_date.setAttribute('min', nextData);
			}
		});
		// 체크아웃 날짜 변경시
		out_date.addEventListener('change',function(){
			console.log('test');
			if(out_date.value == ""){
				// 체크아웃 날짜 삭제시
				nextData = new Date(new Date(in_date.value).setDate(new Date(in_date.value).getDate()+1)).toISOString().substring(0, 10);
				out_date.value = nextData;
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