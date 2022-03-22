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
<title>- cart -</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<style>
	.cart{width:100%;}
	.cart tfoot{font-weight:500;}
	.cart thead tr, .cart tfoot tr{border-top:2px solid #ccc; border-bottom: 2px solid #ccc;}
	.cart thead tr{background:#f9f9f9;}
	.cart thead tr th, .cart tbody tr td, .cart tfoot tr td{padding:1.25rem 0; text-align:center;}
	.cart thead tr th:first-child{width:10%;}
	.cart tbody tr{border-bottom:1px solid #eee;}
	.cart tbody tr:last-child{border-bottom:none;}
	.cart tbody td{border-right:1px solid #eee;}
	.cart tbody td:last-child{border-right:none;}
	.cart tbody tr td > div {position:relative; display:inline-block; vertical-align:top;}
	.cart tbody input[type=number]{width:50px; position:relative;}
	.cart tbody input[type=button]{display:inline-block; position:absolute; left:0; top:0;}
	.ct_btn_wrap {text-align:right; margin-top:1.25rem;}
	#btnDelete.btn{line-height:1; padding:0.65rem 0.75rem;}
</style>
</head>
<body>
	<%@include file = "header.jsp" %>
	<div class="submenu_title_wrap">
		<div class="container submenu_title">
			<h1>RESERVATION CART</h1>
			<p>La Campanella - RESERVATION CART</p>
		</div>
	</div>
	<div class="container O_container">
			<table class="cart">
				<thead><tr><th><input type="checkbox" name="checkAll"></th><th>상품명</th><th>판매가</th><th>수량</th><th>합계</th></tr></thead>
				<tbody>
					<c:forEach items="${getCart}" var="getCart">
						<tr data-ctCode="${getCart.cart_code}">
							<td><input type="checkbox" name="check" value="${getCart.cart_code}"></td>
							<td data-mtype="${getCart.menu_code}">${getCart.menu_name}</td>
							<td data-ctPrice="${getCart.menu_price}"><fmt:formatNumber value="${getCart.menu_price}" type="number"/></td>
							<td><input type="number" value="${getCart.menu_cnt}" min="1" oninput="valiCheck(this);">
								<div><input type="button" value="적용" name="updateCt" style="display:none;"></div>
							</td>
							<td><fmt:formatNumber value="${getCart.menu_total}" type="number"/></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td>
							<button type="button" id="btnDelete" class="btn btn-outline-secondary">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
									<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
									<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
								</svg>
							</button>
						</td>
						<td colspan="2">선택한 결제금액</td>
						<td colspan="2" class="cnt_checkTotal">0</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2">총 결제금액</td>
						<td colspan="2" class="cnt_total"></td>
					</tr>
				</tfoot>
			</table>
			<div class="ct_btn_wrap">
<!-- 				<input type="button" class="submitCheckCart" value="선택예약"> -->
<!-- 				<input type="button" class="submitCart" value="전체예약"> -->
				<button type="button" class="btn btn-outline-danger submitCheckCart">선택예약</button>
				<button type="button" class="btn btn-outline-danger submitCart">전체예약</button>
			</div>
		<form action="/outback/book" method="POST" class="bookForm">
		</form>
	</div>
	<%@include file ="footer.jsp" %>
	<script>
		$(document).ready(function(){
			// 체크박스 전체 선택
			$('input[type=checkbox]').prop('checked','true');
			
			let cnt_total = null;
			for(i = 1; i <= $('.cart > tbody > tr').length; i++){
				let cnt_text = $('.cart > tbody > tr:nth-child('+ i + ') > td:last-child').text().split(',');
				let cnt = '';
				for(j = 0; j < cnt_text.length; j++){
					cnt += cnt_text[j];
				}
				cnt_total += parseInt(cnt);
			}
			if(cnt_total != null){
				$('.cnt_total').text(cnt_total.toLocaleString() + ' 원');
			} else {
				$('.cnt_total').text(0);
			}
				
			// 선택한 결제금액 기본 값
			$('.cnt_checkTotal').text($('.cnt_total').text());
		})
		.on('change','.cart > tbody > tr > td > input[type=number]', function(){
			$(this).next('div').children('input').show();
			let changeTotal = $(this).parent('td').prev().attr('data-ctPrice') * $(this).val();
			$(this).parent('td').next().text(changeTotal.toLocaleString());
		})
		.on('click', 'input[name="updateCt"]', function(){
			let update_cnt = $(this).parent().prev().val();
			let total = $(this).closest('td').next().text().split(',');
			let update_total = '';
			for(i = 0; i < total.length; i++){
				update_total += total[i];
			}
			$.ajax({
				url:'/outback/updateCart',
				data:{
					cart_code : $(this).closest('tr').attr('data-ctcode'),
					menu_cnt : update_cnt
				},
				method:'POST',
				datatype:'json',
				success:function() {
					document.location='/outback/cart';
				}
			});
		})
		// checkbox 전체 선택
		.on('click','input[name=checkAll]',function(){
			if($('input[name=checkAll]').is(':checked')){
				$('input[name=check]').prop('checked',true);
				$('.cnt_checkTotal').text($('.cnt_total').text());
			} else {
				$('input[name=check]').prop('checked',false);
				$('.cnt_checkTotal').text(0);
			}
		})
		.on('click', 'input[name=check]',function(){
			let checkCnt = $('input[name=check]').length;
			let checkedCnt = $('input[name=check]:checked').length;
			if(checkCnt != checkedCnt){
				$('input[name=checkAll]').prop('checked',false);
			} else {
				$('input[name=checkAll]').prop('checked',true);
			}
			// 체크박스 선택시 선택 결제금액 변경
			if($('input[name=check]:checked').length != 0){
				let cnt_checkTotal = null;
				$('.cart > tbody > tr > td:first-child > input[name=check]:checked').each(function(){
					change_checkTotal_str = $(this).parent('td').siblings('td:last-child').text().split(',');
					change_checkTotal = '';
					for(i = 0; i < change_checkTotal_str.length; i++){
						change_checkTotal += change_checkTotal_str[i];
					}
					cnt_checkTotal += parseInt(change_checkTotal);
				});
				$('.cnt_checkTotal').text(cnt_checkTotal.toLocaleString() + ' 원');
			} else {
				$('.cnt_checkTotal').text(0);
			}

		})
		.on('click','#btnDelete',function() {
			if($('input[name=check]:checked').length==0) {
				alert('하나 이상 체크하세요.');
				return false;
			}
			let check='';
			$('input[name=check]:checked').each(function() {
				check += $(this).val()+",";
			});
			console.log(check);
			$.ajax({
				url:'/outback/deleteCart',
				data:{check:check},
				method:'POST',
				dataType:'text',
				success:function(txt) {
					console.log(txt);
					if(txt=="ok") {
						alert('삭제 되었습니다.');
						document.location='/outback/cart';
					} else {
						alert('다시 시도해주세요.');
					}
				}
			});
		})
		.on('click', '.submitCheckCart', function(){
			if($('.cart tbody tr td input[name=check]').is(':checked') === true){
				let book_list_contents = '';
				i = 0;
				flag = 0;
				$('.cart tbody tr td input[name=check]:checked').each(function(){
					let mtype = $(this).parent('td').next().attr('data-mtype');
					if(mtype < 3){
						flag++;
					}
				})
				console.log("flag: " + flag);
				if(flag == 0){
					alert("메인 메뉴를 포함해주세요.");
					return false;
				} else {
					$('.cart tbody tr td input[name=check]:checked').each(function(){
						let cart_code = $(this).val();
						if(cart_code != null){
							let book_list = '<input name="cart['+ i +'].cart_code" type="hidden" value="' + cart_code + '">';
							i++;
							book_list_contents += book_list;
						}
					})
					$(".bookForm").html(book_list_contents);
					$('.bookForm').submit();
				}
			} else {
				alert('하나 이상의 메뉴를 선택해주세요.');
			}
		})
		.on('click', '.submitCart', function(){
			let book_list_contents = '';
			flag = 0;
			$('.cart tbody tr').each(function(){
				let mtype = $(this).children('td:nth-child(2)').attr('data-mtype');
				if(mtype < 3){
					flag++;
				}
			})
			if(flag == 0){
				alert("메인 메뉴를 포함해주세요.");
				return false;
			} else {
				$('.cart tbody tr').each(function(index){
					let cart_code = $('td input[type=checkbox]', this).val();
					let book_list = '<input name="cart['+ index +'].cart_code" type="hidden" value="' + cart_code + '">';
					book_list_contents += book_list;
				});
				$(".bookForm").html(book_list_contents);
				$('.bookForm').submit();
			}
		})
		;
		function valiCheck(el) {
			el.value = el.value.replace(/[^0-9]/g,'');
		}
		;
	</script>
</body>
</html>