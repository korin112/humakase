<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${path}/resources/css/sidebars.css">
<link rel="stylesheet" href="${path}/resources/css/modals.css">
<link rel="stylesheet" href="${path}/resources/css/style.css">
<%-- <script src="${path}/resources/js/admin.js"></script> --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<style>

</style>
<meta charset="UTF-8">
<title>관리자 페이지 - 회원관리</title>	
</head>
<body>
	<main class="adm_main">
		<%@include file ="admin_header.jsp" %>
		<div class="adm_container_wrap">
			<div class="container adm_container">
			

<table class="adm_member_table">
	<thead>
		<tr>
			<th>No.</th>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이름</th>
			<th>모바일</th>
			<th>성별</th>
			<th>등급</th>
			<th>로그인시간</th>
			<th>로그아웃시간</th>
			<th><input type=button id=btnDel value=선택삭제></th>
		</tr>
	</thead>
	<tbody id=tblMember>
	</tbody>	 
</table>
<div id=dlgEdit style='display:none;'>
			<table>
				<tr>
					<td><select id=selInfo size=10 style='width:250px'></select></td>
					<td>
					<table>
						<tr><td align=center>아이디</td><td><input type=text id=_userid name=_userid readonly></td></tr>
						<tr><td align=center>번호</td><td><input type=number id=_type_code name=_type_code></td></tr>
						<tr><td align=center>등급</td><td><input type=text id=_type_name name=_type_name></td></tr>
						<tr><td colspan=2 align=center><input type=button id=btnDone value=수정완료></td></tr>
					</table>
					</td>
				</tr>
			</table>
			</div>
</div>
</div>
</main>
<div id=dlgEdit style='display:none;'>
<table>
	<tr>
		<td><select id=selInfo size=10 style='width:250px'></select></td>
		<td>
		<table>
			<tr><td align=center>아이디</td><td><input type=text id=_userid name=_userid readonly></td></tr>
			<tr><td align=center>번호</td><td><input type=number id=_type_code name=_type_code></td></tr>
			<tr><td align=center>등급</td><td><input type=text id=_type_name name=_type_name></td></tr>
			<tr><td colspan=2 align=center><input type=button id=btnDone value=수정완료></td></tr>
		</table>
		</td>
	</tr>
</table>
</div>
</body>


<script>
$(document)
.ready(function(){
	member();
	$('#dlgEdit').dialog({
		title:'등급 수정',
		autoOpen:false,
		modal:true,
		width:700,
		open:function(){
			$('#selInfo').empty();
			$.ajax({url:'/outback/getDig',
					data:{},
					method:'POST',
					dataType:'json',
					success:function(txt){
						for(i=0; i < txt.length; i++){
							let str='<option>'+txt[i]['_type_code2']+' '+txt[i]['_type_name2']+'</option>';
							$('#selInfo').append(str);
							
						}
					}
				});
		},
		close:function(){
			$('#_type_code,#_type_name').val('');
		}
	});
})
//수정버튼 클릭시 다이얼로그 실행
.on('click','#btnEdit',function(){
	$('#_userid').val($(this).attr('data-userid'));
	$.ajax({url:'/outback/digEdit',
			data:{},
			method:'GET',
			dataType:'json',
			success:function(txt){
				let user="";
				for(i=0; i < txt.length; i++){
					user=txt[i]['_type_code2'];
					if($('#_type_code').val() == user){
 						$('#_type_code').val(txt[i]['_type_code2']);
						$('#_type_name').val(txt[i]['_type_name2']);
					}
				}
			}
		});
	$('#dlgEdit').dialog("open");
})
//dialog select 선택옵션
.on('click','#selInfo option',function(){
	let txt=$(this).text();
	let ar=txt.split(' ');
	$('#_type_code').val($.trim(ar[0]));
	$('#_type_name').val($.trim(ar[1]));
	return false;
})
.on('click','#btnCancel',function(){
	document.location='/outback/home';
	return false;
})
//dialog 수정
.on('click','#btnDone',function(){
	if($('#_userid').val() == ''){
		alert("아이디를 입력하세요.");
		return false;
	}
	if($('#_type_code').val() == ''){
		alert("번호를 입력하세요.");
		return false;
	}
	if($('#_type_name').val() == ''){
		alert("등급을 입력하세요.");
		return false;
	}
	
	let oParam={userid:$('#_userid').val(),user_type:$('#_type_code').val()};
	$.ajax({url:"/outback/updateMember",
			data:oParam,
			method:'POST',
			dataType:'text',
			success:function(txt){
				if(txt == "ok"){
					$('#tblMember').empty();
					member();
					alert("수정완료");
				} else {
					alert("수정실패");
				}
			}
	})
	$('#dlgEdit').dialog('close');
})
//선택삭제
.on('click','#btnDel',function(){
	if($('input[name=box]:checked').length == 0) {
		alert('체크 후 삭제버튼을 누르십시오.');
		return false;
	}
	let select='';
	$('input[name=box]:checked').each(function(){
		select+=$(this).val()+',';
	});
	if(!confirm('삭제 하시겠습니까?')) return false;
	$.ajax({url:'/outback/delMember',
			data:{box:select},
			method:'POST',
			dataType:'text',
			success:function(txt){
				console.log(txt);
				if(txt == "ok") {
					alert("삭제 완료");
					document.location='/outback/adm/adm_member';
				} else {
					alert("삭제 실패");
				}
			}
		});
})
.on('click','#btnCancel',function(){
	document.location='/outback/home';
	return false;
})

function member(){
	$.ajax({url:"/outback/memberList",
			method:"GET",
			data:{},
			dataType:"json",
			success:function(txt){

				for(i=0; i < txt.length; i++){
					let box='<tr><td><input type=checkbox name=box value="'+txt[i]['userid']+'"></td>'
					let str='<td>'+txt[i]['userid']+'</td><td>'+txt[i]['passcode']+'</td><td>'+txt[i]['name']+
					'</td><td>'+txt[i]['mobile']+'</td><td>'+txt[i]['gender']+'</td><td>'+txt[i]['user_type']+
					'</td><td>'+txt[i]['login_time']+'</td><td>'+txt[i]['logout_time']+'</td>';
					let btn='<td align=center><input type=button id=btnEdit value="수정" data-userid='+txt[i]['userid']+'></td></tr>';
					$('#tblMember').append(box+str+btn);
				}
			}
		});
}
</script>
</html>