// adm_book
$(document)
.ready(function() {
	$('.adm_book_table tbody tr').on('click', 'td:not(:first-child)', function() {
		$('.adm_book_table tbody tr').attr('data-bs-target','');
		$('#admBookModal').modal('show');
		$(this).parent('tr').attr('data-bs-target','#admBookModal');
	});
	// checkbox 전체 선택
})
.on('click','.adm_book_table tbody tr', function(){
	let adm_book_id = $(this).children('.adm_book_id').text();
	let adm_book_msg = $(this).find('td:last-child p').text();
	$('#admBookModal .modal-title').text("예약번호 " + adm_book_id);
	$('#admBookModal .book_msg p').text(adm_book_msg);
	if($('#admBookModal .book_msg p').text() == ''){
		$('#admBookModal .book_msg p').text('요청사항이 없습니다.');
	}
	$.ajax({
		url:'/outback/adm/getbookingdetail',
		data:{
			book_id : adm_book_id
		},
		method:'POST',
		datatype:'json',
		success:function(data) {
			let str = '';
			$('#admBookModal .adm_bd_table tbody').empty();
			for(i = 0; i < data.length; i++){
				let price = Number(data[i]['price']) ;
				let total = Number(data[i]['total']) ;
				str = '<tr data-value="' + data[i]['menu_code'] + '"><td>'
					  + data[i]['menu_name'] + '</td><td>'
					  + data[i]['m_qty'] + '</td><td>'
					  + price.toLocaleString() + '원</td><td>'
					  + total.toLocaleString() + '원</td></tr>';
				$('#admBookModal .adm_bd_table tbody').append(str);
			}
		}
	})
})
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
})
.on('click','#btnDelete',function() {
	if($('input[name=check]:checked').length==0) {
		alert('하나 이상 체크하세요.');
		return false;
	}
	let check='';
	$('input[name=check]:checked').each(function() {
		check += $(this).parent().next('.adm_book_id').text()+",";
		console.log(check);
	});
	let url_page = window.location.pathname;
	$.ajax({
		url:'/outback/adm/deleteAdmBook',
		data:{check:check},
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
})
;
