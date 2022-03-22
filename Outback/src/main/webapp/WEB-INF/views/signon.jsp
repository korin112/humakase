<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> - 회원가입 - </title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${path}/resources/css/style.css">
</head>
<style>
.input-box_wrap{width:50%; margin:0 auto;}
.input-box{overflow:hidden; margin-bottom:1.25rem; padding:0;}
.input-box > li{
	display:block;
	float:left;
}
.input-box > li{width:80%; border-bottom:1px solid #ccc; height:3rem; overflow:hidden;}
.input-box > li > * {vertical-align:middle; line-height:3rem;}
.input-box > li > label {font-weight:500;}
.input-box > li input{border:0; background:transparent; width:100%; line-height:2.5rem;}
.input-box:first-child > li input:first-child{width:80%;}
.input-box > li button{line-height:1.5; padding:0.5rem; float:right;}
.input-box > li:first-child{width:20%; border-bottom:0; line-height:3rem;}
.input-box > input {
	list-style:none;
	background:transparent;
	border:none;
	border-bottom:solid 1px #ccc;
	font-size:1rem;
	margin:10px;
}
.input-box_wrap .input-box:nth-child(6) > li:last-child label:first-child{margin-right:1rem;}
.input-box > li input[type=radio]{width:auto;}
input[type=submit],input[type=button],input[type=reset]{
	background: #8aa1a1;
	border:none;
	color:white;
	font-size: 1.125rem;
}
input[type=radio]{
	text-align:center;
}
.input-button{
	margin-top:2.5rem;
	overflow:hidden;
}
.input-button button{
	float:left; margin-right:0.5rem; font-size:1.125rem; font-weight:500;
}
.input-button button:last-child{
	margin-right:0;
	float:right;
}
.form-floating.genderclick>.form-control:focus, .form-floating.genderclick>.form-control:not(:placeholder-shown){padding-top:1rem !important; padding-bottom:1rem !important;}
.genderclick h6{display:inline; margin-right:1.5rem; font-weight:normal;}
#btnCheck{position:absolute; right:0; top:0; bottom:0; padding:1rem 0.75rem; font-weight:500;}
#userids{padding-right:100px;}
#btnDone{background-color:#c93535; border-color:#c93535; padding:0.375rem 1.25rem;}
#btnDone:hover{background-color:#bc2222; border-color:#bc2222;}
</style>
<body>
<%@include file ="header.jsp" %>
<div class="submenu_title_wrap">
	<div class="container submenu_title">
		<h1>SIGN ON</h1>
		<p>La Campanella - SIGN ON</p>
	</div>
</div>
<div class="container O_container">
	<div class="input-box_wrap">
		<div class="form-floating mb-3">
			<input type="text" class="form-control" id="userids" placeholder="아이디" required>
			<label for="userids">아이디</label>
			<button type="button" id="btnCheck" name="btnCheck" class="btn btn-outline-secondary">중복확인</button>
		</div>
		<div class="form-floating mb-3">
			<input type="password" class="form-control" id="passcode" placeholder="비밀번호">
			<label for="passcode">비밀번호</label>
		</div>
		<div class="form-floating mb-3">
			<input type="password" class="form-control" id="passcode1" placeholder="비밀번호 확인">
			<label for="passcode1">비밀번호 확인</label>
		</div>
		<div class="form-floating mb-3">
			<input type="text" class="form-control" id="name" placeholder="실명">
			<label for="name">실명</label>
		</div>
		<div class="form-floating mb-3">
			<input type="text" class="form-control" id="mobile" placeholder="연락처">
			<label for="mobile">연락처</label>
		</div>
		<div class="form-floating mb-3 genderclick">
			<div class="form-control">
				<h6>성별</h6>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="gender" id="male" value="남성">
					<label class="form-check-label" for="male">남성</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="gender" id="female" value="여성">
					<label class="form-check-label" for="female">여성</label>
				</div>
			</div>
		</div>
		<div class="input-button">
<!-- 			<input type="button" id=btnCancel value="취소"> -->
			<button type="button" id="btnCancel"class="btn btn-secondary">취소</button>
<!-- 			<input type="reset" id=btnReset value="비우기"> -->
			<button type="reset" id="btnReset" class="btn btn-outline-secondary">비우기</button>
			<button type="submit" id="btnDone" class="btn btn-danger">완료</button>
		</div>
<!-- 		<ul class="input-box"> -->
<!-- 			<li><label for="userids">아이디</label></li> -->
<!-- 			<li> -->
<!-- 				<input type=text id="userids" required> -->
<!-- 				<button type="button" id="btnCheck" name="btnCheck" class="btn btn-outline-secondary">중복확인</button> -->
<!-- 			</li> -->
<!-- 		</ul> -->
<!-- 		<ul class="input-box"> -->
<!-- 			<li><label for="passcode">비밀번호</label></li> -->
<!-- 			<li><input type="password" id="passcode"></li> -->
<!-- 		</ul> -->
<!-- 		<ul class="input-box"> -->
<!-- 			<li><label for="passcode1">비밀번호 확인</label></li> -->
<!-- 			<li><input type="password" id="passcode1"></li> -->
<!-- 		</ul> -->
<!-- 		<ul class="input-box"> -->
<!-- 			<li><label for="name">실명</label></li> -->
<!-- 			<li><input type="text" id="name"></li> -->
<!-- 		</ul> -->
<!-- 		<ul class="input-box"> -->
<!-- 			<li><label for="mobile">전화번호</label></li> -->
<!-- 			<li><input type="text" id="mobile"></li> -->
<!-- 		</ul> -->
<!-- 		<ul class="input-box"> -->
<!-- 			<li>성별</li> -->
<!-- 			<li> -->
<!-- 				<label><input type="radio" id="male" name="gender" value="남성"> 남성</label> -->
<!-- 				<label><input type="radio" id="female" name="gender" value="여성"> 여성</label> -->
<!-- 			</li> -->
<!-- 		</ul> -->
<!-- 		<div class="input-button"> -->
<!-- 			<input type="button" id=btnCancel value="취소"> -->
<!-- 			<button type="button" id="btnCancel"class="btn btn-secondary">취소</button> -->
<!-- 			<input type="reset" id=btnReset value="비우기"> -->
<!-- 			<button type="reset" id="btnReset" class="btn btn-outline-secondary">비우기</button> -->
<!-- 			<button type="submit" id="btnDone" class="btn btn-danger">완료</button> -->
<!-- 		</div> -->
	</div>
</div>
<%@include file ="footer.jsp" %>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
let flag="";
$(document)
//유효성 검사
.on('click','#btnDone',function(){
	if($('#userids').val() == ''){
		alert('아이디를 입력하세요.');
		return false;
	} else if(flag != "true") {
		alert("중복검사를 진행해주세요.");
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
		data:{userids:$('#userids').val(),passcode:$('#passcode').val(),name:$('#name').val(),
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
//취소시 홈
.on('click','#btnCancel',function(){
	document.location="/outback/home";
	return false;
})
//클릭시 비우기
.on('click','#btnReset',function(){
	if(confirm("모두 지우시겠습니까?")){
	$('#userids,#passcode,#passcode1,#name,#mobile').val('');
	$('#input[name=gender]:checked').prop('checked',false);
	return false;
	}
})
//중복확인 검사
.on('click','#btnCheck',function(){
	if($('#userids').val()==''){
		return false;
	}else{
		$.ajax({
			url:'confirm_check',
			type:'POST',
			dataType:'text',
			data:{userids:$('#userids').val()},
			success:function(txt){
				if (txt == 'fail') {
					alert('이미 사용중 및 사용한 아이디 입니다. 다른아이디를 입력해주세요.');
					return false;
				} else {
					alert('사용 가능한 아이디 입니다.');
					flag="true";
				}
			return true;
			}
		})
	}
})
</script>
</html>