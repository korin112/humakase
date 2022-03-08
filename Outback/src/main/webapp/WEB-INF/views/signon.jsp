<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> - 회원가입 - </title>
</head>
<body>
<table align=center valign=middle>
<h3 align=center>회원정보를 입력해주세요</h3>
    <tr>
        <td align=right>아이디</td>
        <td><input type=text id=userid name=userid size=20>
        	<input type=button value=중복확인 id=btnCheck></td>
    </tr>
    <tr>
        <td align=right> 비밀번호</td>
        <td><input type=password id=passcode name=passcode size=20></td>
    </tr>
    <tr>
        <td align=right>비밀번호 확인</td>
        <td><input type=password id=passcode1 name=passcode1 size=20></td>
    </tr> 
    <tr>
        <td align=right>실명</td>
        <td><input type=text id=name name=name size=20></td>
    </tr>
    <tr>
        <td align=right>모바일번호</td>
        <td><input type=text id=mobile name=mobile size=20></td>
    </tr>
    <tr>
        <td align=right>성별</td>
        <td><input type=radio id=male name=gender value=남성>남성<br>
            <input type=radio id=female name=gender value=여성>여성</td>
    </tr>
    <tr>
		<td colspan=2 align=center>
        <input type=submit id=btnDone value='가입완료'>&nbsp;
		<input type=button id=btnCancel value='취소' id='btnCancel'>&nbsp;
        <input type=reset id=btnReset value='비우기'>
		</td>
    </tr>
    </table>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
//유효성 검사
.on('click','#btnDone',function(){
	if($('#userid').val() == ''){
		alert('아이디를 입력하세요.');
		return false;
	}
	if($('#passcode').val() == ''){
		alert('비밀번호를 입력하세요.');
		return false;
	}
	if($('#passcode1').val() == ''){
		alert('비밀번호확인을 입력하세요.');
		return false;
	}
	if($('#passcode').val() != $('#passcode1').val()){
		alert('비밀번호가 일치하지 않습니다.');
		return false;
	}
	if($('#name').val() == ''){
		alert('실명을 입력하세요.');
		return false;
	}
	if($('#mobile').val() == ''){
		alert('모바일번호를 입력하세요.');
		return false;
	}
	if($('input[name=gender]:checked').length==0) {
		alert('성별을 체크하세요.');	
		return false;
	}

	$.ajax({
		url:'/outback/sign_check',
		type:'POST',
		dataType:'text',
		data:{userid:$('#userid').val(),passcode:$('#passcode').val(),name:$('#name').val(),
 			mobile:$('#mobile').val(),gender:$('input[name=gender]:checked').val()},
 		success:function(txt){
 			console.log(txt);
 			if(txt == "overlap"){
 				alert("이미 등록된 회원입니다.");
 			} else if(txt == "ok"){
 				alert("회원가입이 완료되었습니다.");
 				document.location="/outback/login";
 			} else {
 				alert("회원가입이 실패 했습니다.");
 			}
 		}		
	});
	return false;
})
//중복된 아이디 체크
.on('click','#btnCheck',function(txt){
	$.post('/outback/confirm_check',{userid:$('#userid').val()},function(txt){
		if(txt=='fail'){
			alert('아이디가 중복됩니다');
		}else if(txt=='ok'){	
			alert('사용가능한 아이디입니다.');
		}
	},'text');
})


//취소시 홈
.on('click','#btnCancel',function(){
	document.location="/outback/home";
	return false;
})
//클릭시 비우기
.on('click','#btnReset',function(){
	if(confirm("모두 지우시겠습니까?")){
	$('#userid,#passcode,#passcode1,#name,#mobile').val('');
	$('#input[name=gender]:checked').prop('checked',false);
	return false;
	}
})
;
</script>
</html>