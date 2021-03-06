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
	.cart thead tr{border-bottom:1px solid #ccc; background:#f9f9f9;}
	.cart tbody tr{border-bottom:1px solid #eee;}
	.cart tbody tr:last-child{border-bottom:0;}
	.cart td{border-right:1px solid #eee;}
	.cart td:last-child{border-right:0;}
	.book-list{overflow:hidden;}
	.book-list article{display:block; margin:3.5rem 1.25rem; width:Calc(55% - 1.25rem); height:100%; float:left;}
	.book-list article.total_payment_box{margin-left:5%; border:2px solid #797979; width:Calc(40% - 1.25rem * 2);}
	.booking_info_box > ul{display:table; width:100%; margin:0; padding:0; border-bottom:1px solid #ddd;}
	.booking_info_box > ul:first-child{border-top:1px solid #ddd;}	
	.booking_info_box > ul > li{width:70%; display:table-cell; padding:1.25rem 0 1.25rem 2.125rem;}
	.booking_info_box > ul > li:first-child{width:30%; vertical-align:middle; background:#f9f9f9;}
	.booking_info_box input{border:none;}
	.booking_info_box li textarea{width:100%; resize:none; border:1px solid #ddd; padding:0.5rem; height:100px;}
	.option .dropdown-toggle::after{margin-left:1.255rem;}
	.option_span{opacity:0.5;}
	.dropdown-menu{max-height:200px; overflow-y:auto; overflow-x:hidden;}
	.dropdown-item{cursor:pointer;}
	.total_payment_box{text-align:right;}
	.total_payment_box > ul{padding:0 2.125rem; margin:1.25rem;}
	.total_payment_box h6{font-size:1.125rem; text-align:left; padding:1rem 0 1.125rem;
		border-bottom:1px solid #ccc;}	
	.total_payment_box li:nth-child(2){color:#c93535; font-weight:500;}
	.total_payment_box .tpb_big{font-size:1.5125rem; font-weight:700;}
	.total_payment_box .tpb_btn{text-align:center; margin:2.125rem 3.375rem;}
	.total_payment_box .tpb_btn button{border:none;width:100%; padding:1.125rem 1rem;
		color:#fff; background:#c93535; font-size:1.125rem; border-radius:5px;}
	.displaynone{display:none;}
</style>
</head>
<body>
	<%@include file ="header.jsp" %>
	<div class="submenu_title_wrap">
		<div class="container submenu_title">
			<h1>RESERVATION</h1>
			<p>La Campanella - RESERVATION</p>
		</div>
	</div>
	<div class="container O_container">
		<section class="order-list">
			<div class="book_tap">
				?????? ?????? ??????
<!-- 				<div class="taptt_arrow"> -->
<!-- 					<div class="arrow arrow_hide"> -->
<!-- 						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16"> -->
<!-- 			  				<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/> -->
<!-- 						</svg> -->
<!-- 					</div> -->
<!-- 					<div class="arrow arrow_show" style="display:none;"> -->
<!-- 						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16"> -->
<!-- 	  						<path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/> -->
<!-- 						</svg> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
			<div class="book_ctt">
				<table class="cart">
					<thead><tr><th>?????????</th><th>?????????</th><th>??????</th><th>??????</th></tr></thead>
					<tbody>
						<c:set var="getCartlist" value="${getCartlist}" />
						<c:set var="getMenu" value="${getMenu}" />
						<c:choose>
							<c:when test="${!empty getCartlist}">
								<c:forEach items="${getCartlist}" var="getCartlist">
									<tr data-ctCode="${getCartlist.cart_code}">
										<td>${getCartlist.menu_name}</td>
										<td data-ctPrice="${getCartlist.menu_price}"><fmt:formatNumber value="${getCartlist.menu_price}" type="number"/></td>
										<td>${getCartlist.menu_cnt}</td>
										<td><fmt:formatNumber value="${getCartlist.menu_total}" type="number"/></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr data-mcode="${getMenu.menu_code}">
									<td>${getMenu.menu_name}</td>
									<td data-ctPrice="${getMenu.menu_price}"><fmt:formatNumber value="${getMenu.menu_price}" type="number"/></td>
									<td>1</td>
									<td><fmt:formatNumber value="${getMenu.menu_price}" type="number"/></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</section>
		<section class="book-list fixed">
			<form action="/outback/InsertBook" method="POST" class="insert_bookForm">
				<div class="book_tap">
					?????? ?????? ??????
<!-- 					<div class="taptt_arrow"> -->
<!-- 						<div class="arrow arrow_hide"> -->
<!-- 							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16"> -->
<!-- 				  				<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/> -->
<!-- 							</svg> -->
<!-- 						</div> -->
<!-- 						<div class="arrow arrow_show" style="display:none;"> -->
<!-- 							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-up" viewBox="0 0 16 16"> -->
<!-- 		  						<path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/> -->
<!-- 							</svg> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
				<div class="book_ctt">
					<article class="booking_info_box">
						<ul class="fixed">
							<li>????????????</li>
							<li id="spotlist" class="dropdown option">
								<a href="#" class="dropdown-toggle link-dark" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
									????????? ???????????????
								</a>
								<ul class="dropdown-menu">
								<c:forEach items="${spot}" var="spot">
									<li class="dropdown-item" data-value="${spot.spot_code}">${spot.spot_name}</li>
								</c:forEach>
								</ul>
							</li>
						</ul>
						<ul class="fixed">
							<li>?????????</li>
							<li><input type="date" name="vdate" id="vdate"></li>
						</ul>
						<ul class="fixed">
							<li>????????????</li>
							<li id="vtimelist" class="dropdown option" >
								<a href="#" class="dropdown-toggle link-dark" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
									???????????? ????????? ??????????????????.
								</a>
								<ul class="dropdown-menu">
		<%-- 						<c:forEach items="${vtime}" var="vtime"> --%>
		<%-- 							<li class="dropdown-item" data-value="${vtime.time_code}">${vtime.time_name}</li> --%>
		<%-- 						</c:forEach> --%>
								</ul>
							</li>
						</ul>
						<ul class="fixed">
							<li>????????????</li>
							<li id="howmany" class="dropdown option">
								<a href="#" class="dropdown-toggle link-dark" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
									??????????????? ??????????????????.
								</a>
								<ul class="dropdown-menu">
								</ul>
							</li>
						</ul>
						<ul>
							<li>????????????</li>
							<li><input type="text" class="get_booker" name="booker" value="${userSession.name}" readonly></li>
						</ul>
						<ul>
							<li>?????????</li>
							<li><input type="text" class="get_mobile" name="mobile" value="${userSession.mobile}" readonly></li>
						</ul>
						<ul>
							<li>????????????</li>
							<li><textarea name="msg" maxlength="255" spellcheck="false" placeholder="?????? 255????????? ?????? ???????????????."></textarea></li>
						</ul>
					</article>
					<article class="total_payment_box">
						<ul>
							<li><h6>??? ?????? ??????</h6></li>
							<li><span class="tpb_big cnt_num"></span></li>
						</ul>
						<ul>
							<li><h6>??? ?????? ??????</h6></li>
							<li><span class="tpb_big cnt_total"></span>???</li>
						</ul>
						<div class="tpb_btn"><button type="button" class="submitBook">????????????</button></div>
					</article>
				</div>
				<div class="displaynone"></div>
			</form>
		</section>
	</div>
	<%@include file ="footer.jsp" %>
	<script>
		// ???????????? ?????? ?????? ??????
		let vdate= document.getElementById('vdate');
		let todayData = new Date(new Date().getTime() + (1000 * 60 * 60 * 24) - new Date().getTimezoneOffset() * 60000).toISOString().substring(0, 10);
		vdate.value = todayData;
		// ????????? ????????? : ?????? ??????
		vdate.setAttribute('min', todayData);
		
		// ????????? ?????? ?????????
		vdate.addEventListener('change',function(){
			if(vdate.value == ""){
			// ?????? ????????? ?????? ?????? ??????
				vdate.value = todayData;
			} else if (vdate.value < todayData){
			// ?????? ?????? ?????????(????????? ??????) alert ??? ?????? ?????? ??????
				alert('?????? ????????? ????????? ??? ????????????. ????????? ?????? ??????????????????.');
				vdate.value = todayData;
			}
		});
		
// 		if(typeof(document.getElementById('howmany').value) != Number){
// 			console.log('?????? ?????? ????????? ????????????!!!');
// 			console.log(typeof(document.getElementById('howmany').value));
// 		}
		
		$(document)
		.ready(function(){
			let cnt_total = null;
			let cnt_num = null;
			for(i = 1; i <= $('.cart > tbody > tr').length; i++){
				let cnt_text = $('.cart > tbody > tr:nth-child('+ i + ') > td:last-child').text().split(',');
				let cnt_int = $('.cart > tbody > tr:nth-child('+ i + ') > td:nth-child(3)').text();
				let cnt = '';
				for(j = 0; j < cnt_text.length; j++){
					cnt += cnt_text[j];
				}
				cnt_total += parseInt(cnt);
				cnt_num += parseInt(cnt_int);
			}
			$('.cnt_total').text(cnt_total.toLocaleString());
			$('.cnt_num').text(cnt_num);
		})
		// Toggle Tap ?????? ??????
// 		.on('click', '.taptt_arrow', function(){
// 			let tap = $(this).closest('.book_tap').next('.book_ctt');
// 			tap.slideToggle();
// 			$(this).find('.bi-chevron-down').css('transform','translate(-50%, -50%) rotate(180deg)');
// 		})
		.on('click', '.option > ul > li', function(){
			$(this).parent('ul').prev().html($(this).html());
// 			console.log($(this).parent('ul').prev().text());
			$(this).closest('.option').children('a').attr('data-value',$(this).attr('data-value'));
		})
		.on('click', '#spotlist', function(){
			resetOption();
		})
		.on('change','#vdate', function(){
			resetOption();
		})
		.on('click', '#vtimelist', function(){
			if($('#spotlist > a').attr('data-value') == null){
				$('.dropdown-menu.show').removeClass('show');
				alert('??????????????? ??????????????????.');
			} else {
				console.log($('#spotlist > a').attr('data-value'));
				getVtime();
			}
		})
		.on('click', '#vtimelist > ul > li', function(){
			let maxlist = $(this).children('span').attr('data-max');
			$('#howmany > ul').empty();
			for(i = 1; i <= maxlist; i++){
				$('#howmany > ul').append('<li class="dropdown-item">' + i + '</li>');
			}
		})
		.on('click','#howmany', function(){
			if($('#spotlist > a').attr('data-value') == null){
				$('.dropdown-menu.show').removeClass('show');
				alert('??????????????? ??????????????????.');
			} else if($('#vtimelist > a').attr('data-value') == null){
				$('.dropdown-menu.show').removeClass('show');
				alert('???????????? ????????? ??????????????????.');
			}
		})
		.on('click','#howmany > ul > li', function(){
			$(this).closest('.option').children('a').attr('data-max',$(this).text());
		})
		.on('click', '.submitBook', function(){
			if($('#spotlist > a').attr('data-value') == null){
				alert('??????????????? ??????????????????.');
			} else if($('#vdate').val() == null){
				alert('???????????? ????????? ??????????????????.');
			} else if($('#vtimelist > a').attr('data-value') == null){
				alert('???????????? ????????? ??????????????????.');
			} else if($('#howmany > a').attr('data-max') == null){
				alert('??????????????? ??????????????????.');
			} else if($('.get_booker').val() == null){
				alert('??????????????? ??????????????????.');
			} else if($('.get_mobile').val() == null){
				alert('???????????? ??????????????????.');
			} else {
				let book_list_contents = '';
				if($('.cart tbody tr').attr('data-ctcode') != null){
					$('.cart tbody tr').each(function(index){
						let cart_code = $(this).attr('data-ctcode');
						console.log('cart_code: '+cart_code);
						let book_list = '<input name="cart['+ index +'].cart_code" type="hidden" value="' + cart_code + '">';
						book_list_contents += book_list;
					});
				} else {
					let menu_code = $('.cart tbody tr').attr('data-mcode');
					book_list_contents = '<input name="menu_code" value="'+ menu_code +'">';
					console.log('menu_code: '+menu_code);
				}
				$(".insert_bookForm .displaynone").append(book_list_contents);
				
				let spot_code = $('#spotlist > a').attr('data-value');
				let input_spot_code = '<input name="spot_code" type="hidden" value="' + spot_code +'">';
				
				let vtime = $('#vtimelist > a').attr('data-value');
				let input_vtime = '<input name="vtime" type="hidden" value="' + vtime +'">';
				
				let howmany = $('#howmany > a').attr('data-max');
				let input_howmany = '<input name="howmany" type="hidden" value="' + howmany +'">';
				
				let m_qty = $('.cnt_num').text();
				let input_m_qty = '<input name="m_qty" type="hidden" value="' + m_qty +'">';
				
				let cnt_total = '';
				let cnt = $('.cnt_total').text().split(',');
				for(i = 0; i < cnt.length; i++){
					cnt_total += cnt[i];
				}
				let input_total = '<input name="total" type="hidden" value="' + cnt_total +'">';
				$(".insert_bookForm .displaynone").append(input_spot_code, input_vtime, input_howmany, input_m_qty, input_total);
				
				$('.insert_bookForm').submit();
			}
		})
		;
		function getVtime(){
			$.ajax({
				url : '/outback/getVtime',
				async: true,
				data : {
					spot_code : $('#spotlist > a').attr('data-value'),
					vdate : $('#vdate').val()
				},
				dataType : 'json',
				method : 'post',
				beforeSend:function(){
					$('#vtimelist > ul').empty();
				},
				success : function(data) {
					for(i = 0; i < data.length; i++){
						let str_remain = null;
						if(data[i]['remain'] == 0){
							str_remain = '<li class="dropdown-item disabled" data-value="';
						} else {
							str_remain = '<li class="dropdown-item" data-value="';
						}
						let str = data[i]['time_code'] + '">'
						+ '<span class="option_span" data-max="'+ data[i]['remain']
						+ '">[?????? '+ data[i]['remain'] + '??? ????????????] </span>' + data[i]['time_name']
						+ '</li>';
						$('#vtimelist > ul').append(str_remain + str);
					}
				},
				error : function(){
					alert("?????? ??????????????????.");
				}
				
			});
		};
		function resetOption(){
			$('#vtimelist > a').text('???????????? ????????? ??????????????????.');
			$('#vtimelist > a').attr('data-value',null);
			$('#howmany > a').text('??????????????? ??????????????????.');
			$('#howmany > a').attr('data-max',null);
		};
	</script>

</body>
</html>