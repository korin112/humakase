<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> - 마이 페이지 - </title>
</head>
<style>
table {
	border-collapse:collapse;
}
tr,td,th{
	box-sizing:border-box;
	border:1px solid #ddd;
}
</style>
<body>
<div>
<table id=tblMember></table>
</div><br>
<div id=dlgEdit style='display:none;'>
<table>
	<tr>
		<td><select id=selInfo size=10 style='width:250px'></select></td>
		<td>
		<table>
			<tr><td align=center>아이디</td><td><input type=text id=_userid name=_userid readonly></td></tr>
			<tr><td align=center>등급</td><td><input type=number id=_user_type name=_user_type></td></tr>
			<tr><td colspan=2 align=center><input type=button id=btnDone value=수정완료></td></tr>
		</table>
		</td>
	</tr>
</table>
</div>
</body>
<script src="https:/code.jquery.com/jquery-3.5.0.js"></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)
.ready(function(){
	member();
})
//수정버튼 클릭시 다이얼로그 실행
.on('click','#btnEdit',function(){
	$('#_userid').val($(this).attr('data-userid'));
	$.ajax({url:'/outback/getDig',
			data:{},
			method:'GET',
			dataType:'json',
			success:function(txt){
				let user="";
				for(i=0; i < txt.length; i++){
					user=txt[i]['userid'];
					if($('#_userid').val() == user){
						$('#_user_type').val(txt[i]['m_user_type']);
					}
				}
			}
		});
	$('#dlgEdit').dialog({
		modal:true,
		width:500,
		open:function(){
			$('#selInfo').empty();
			$.ajax({url:'/outback/dlgEdit',
					data:{},
					method:'POST',
					dataType:'json',
					success:function(txt){
						for(i=0; i < txt.length; i++){
							let str='<option>'+txt[i]['m_user_type']+'</option>';
							$('#selInfo').append(str);
						}
					}
				});
		},
		close:function(){
			$('#_user_type').val('');
		}
	});
	return false;
})
function member(){
	$.ajax({url:"/outback/memberList",
			method:"GET",
			data:{},
			dataType:"json",
			success:function(txt){
				let head='<thead><tr><th></th><th>아이디</th><th>패스워드</th><th>이름</th><th>모바일</th><th>성별</th><th>'
				+'등급</th><th>로그인시간</th><th><input type=button id=btnDel value=선택삭제></th></tr></thead>';
				$('#tblMember').append(head);
				
				for(i=0; i < txt.length; i++){
					let box='<tr><td><input type=checkbox name=box value="'+txt[i]['userid']+'"></td>'
					let str='<td>'+txt[i]['userid']+'</td><td>'+txt[i]['passcode']+'</td><td>'+txt[i]['name']+
					'</td><td>'+txt[i]['mobile']+'</td><td>'+txt[i]['gender']+'</td><td>'+txt[i]['user_type']+
					'</td><td>'+txt[i]['login_time']+'</td>';
					let btn='<td align=center><input type=button id=btnEdit value="수정" data-userid='+txt[i]['userid']+'></td></tr>';
					$('#tblMember').append(box+str+btn);
				}
			}
		});
}
</script>
</html>