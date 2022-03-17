// adm_book
$(function() {
	let url_page = window.location.pathname;
	console.log(url_page);
	if(url_page != '/outback/mypage/mybook/later'){
		$('#myBookModal .modal-footer.mybook-modal-footer #btnDelete').remove();
		$('#myBookModal .modal-footer.mybook-modal-footer').css('justify-content','flex-end');
	}
	$('.mybook_tt li').each(function() {
		if($(this).children('a').attr('href') == url_page) {
			$('.mybook_tt li').removeClass('active');
			$(this).addClass('active');
		}
	})
})
$(document)
.ready(function() {
	$('.mybook_table tbody tr').on('click', 'td:not(:first-child)', function() {
		$('.mybook_table tbody tr').attr('data-bs-target','');
		$('#myBookModal').modal('show');
		$(this).parent('tr').attr('data-bs-target','#myBookModal');
	});
	// checkbox 전체 선택
})
.on('click','.mybook_table tbody tr', function(){
	let mybook_id = $(this).children('.mybook_id').text();
	let mybook_msg = $(this).find('td:last-child p').text();
	$('#myBookModal .modal-title').text("예약번호 " + mybook_id);
	$('#myBookModal .modal-title').attr('data-value',mybook_id);
	$('#myBookModal .book_msg p').text(mybook_msg);
	if($('#myBookModal .book_msg p').text() == ''){
		$('#myBookModal .book_msg p').text('요청사항이 없습니다.');
	}
	$.ajax({
		url:'/outback/adm/getbookingdetail',
		data:{
			book_id : mybook_id
		},
		method:'POST',
		datatype:'json',
		success:function(data) {
			let str = '';
			$('#myBookModal .bd_table tbody').empty();
			for(i = 0; i < data.length; i++){
				let price = Number(data[i]['price']) ;
				let total = Number(data[i]['total']) ;
				str = '<tr data-value="' + data[i]['menu_code'] + '"><td>'
					  + data[i]['menu_name'] + '</td><td>'
					  + data[i]['m_qty'] + '</td><td>'
					  + price.toLocaleString() + '원</td><td>'
					  + total.toLocaleString() + '원</td></tr>';
				$('#myBookModal .bd_table tbody').append(str);
			}
		}
	})
})
// mybook
.on('click','#btnDelete',function() {
	let confirm_msg = confirm('삭제하시겠습니까?');
	if(confirm_msg == true){
		let url_page = window.location.pathname;
		let mybook_id = $('.modal-title').attr('data-value');
		$.ajax({
			url:'/outback/mypage/mybook/deleteMybook',
			data:{mybook_id:mybook_id},
			method:'POST',
			dataType:'text',
			success:function(txt) {
				console.log(txt);
				if(txt=="ok") {
					alert('삭제 되었습니다.');
					document.location=url_page;
				} else {
					alert('다시 시도해주세요.');
				}
			}
		});
	}
})
.on('click','.mybook_tt li', function(){
	$('.mybook_tt li').removeClass('active');
	$('.mybook_ct > ul > li').removeClass('on');
	$(this).addClass('active');
	let tab_tt = $(this).children('a').attr('href');
	$(tab_tt).addClass('on');
})
;