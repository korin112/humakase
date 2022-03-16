<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
<title> - 회원가입 - </title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${path}/resources/css/style.css">
</head>
<style>
.input-box {
	position:relative;
	margin:10px 0;
	left:630px;
	top:20px;
}
.input-box > input {
	list-style:none;
	background:transparent;
	border:none;
	border-bottom:solid 1px #ccc;
	padding:20px 0px 5px 0px;
	font-size:14pt;
	margin:10px;

/*  	width:20%; */
}
input::placeholder{
 	color:transparent;
 }
input:focus + label,label{
 	color:#8aa1a1;
 	font-size:10pt;
 	pointer-events:none;
  	position: static;
 	left:0px;
 	top:0px;
 	align:center;
}
input[type=submit],input[type=button],input[type=reset]{
    background-color: #8aa1a1;
    border:none;
    color:white;
    border-radius: 5px;
    width:80px;
    height:45px;
    font-size: 14pt;
/*     margin-top:140px; */
}
input[type=radio]{
	text-align:center;
	margin-left:80px;
}
/* #forgot{ */
/*     text-align: right; */
/*     font-size:12pt; */
/*     color:rgb(164, 164, 164); */
/*     margin:10px 0px; */
/* } */
input:focus, input:not(:placeholder-shown){
 	border-bottom:solid 1px #8aa1a1;
 	outline:none;
}
.input-button {
	margin-left:660px;
}

</style>
<body>
<%@include file ="header.jsp" %>
<h1 style="text-align: center; font-weight: bold; font-size: 40px; letter-spacing: 6px;">회원가입</h1>
			<h2 style="text-align: center; font-weight: bold; color: #ccc; margin-bottom: 30px; font-size: 22px; letter-spacing: 4px;">Sign Up</h2>
<div>
	<div class="input-box">
			<label for="userid">아이디</label>
			<input type="text" id="userid">
			<input type=button value=중복확인 id=btnCheck>
	</div>
	<div class="input-box">
			<label for="passcode">비밀번호</label>
			<input type="password" id="passcode">
	</div>
	<div class="input-box">
			<label for="passcode1">비밀번호 확인</label>
			<input type="password" id="passcode1">
	</div>
	<div class="input-box">
			<label for="name">실명</label>
			<input type="text" id="name">
	</div>
	<div class="input-box">
			<label for="mobile">전화번호</label>
			<input type="text" id="mobile">
	</div>
	<div class="input-box">
			<label for="gender">성별</label>
			<input type="radio" id="gender" name="gender" value="남성">
			<label for="gender">남성</label>	
			<input type="radio" id="gender" name="gender" value="여성">
			<label for="gender">여성</label>
	</div>
	<div class="input-button">
		<input type="submit" id=btnDone value="완료">
		<input type="reset" id=btnReset value="비우기">
		<input type="button" id=btnCancel value="취소">
	</div>
</div>
<%@include file ="footer.jsp" %>
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