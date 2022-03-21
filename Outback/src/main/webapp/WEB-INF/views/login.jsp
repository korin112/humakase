<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="${path}/resources/css/style.css">
<title> - 로그인 - </title>
</head>

<style>
body {
	height:100%;
	background-color:#e9e9e9;
	margin-top:200px;
}
input:-webkit-autofill, input:-webkit-autofill:hover, input:-webkit-autofill:focus, input:-webkit-autofill:active {
	transition: background-color 5000s ease-in-out 0s;
	-webkit-transition: background-color 9999s ease-out;
}
.login_wrap{width:30rem; margin:0 auto;}
.login_logo{text-align:center;font-weight:normal; text-align:center; font-size:2.5rem; margin:0 0 2rem;
	font-family: 'Gelasio','Noto Sans KR', sans-serif; color:#212529;}
.login_logo a{color:#212529;}
div.input-button {
	margin-top:1rem;
}
.input-box {
	text-align:center;
	width: 100%;
	height: 100%;
	margin-bottom:1rem;
	border:1px solid #ccc;
	background:#fff;
}
.input-box label{display:inline-block; width:11%; color:#646c74; opacity:0.8; text-align:center;}
.input-box input {
	padding:0.75rem 1rem 0.75rem 0;
	display:inline-block;
	font-size:1rem;
	width:88%;
	border:0;
}
.input-box input:focus{outline:none; border:none;}
.input-button > input[type=submit]{
	margin-top:1rem;
	border:none;
	width:100%;
	font-size:1.5rem;
	background-color:#c93535;
	padding:0.75rem 0;
	color:white;
}
.go_signon {text-align:center; color:#646c74; margin:0.5rem 0;}
.go_signon a{color:#c93535; font-weight:500;}
</style>
<body>
	<h1 class="login_logo"><a href="/outback/home" title="홈페이지로 이동">La Campanella</a></h1>
	<form method="POST" action="/outback/loginChk2" id=frmLogin>
		<div class="login_wrap">
			<div class="input-box">
				<label for="userid">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
						<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
					</svg>
				</label>
				<input type=text name=userid id=userid placeholder="ID">
		
			</div>	
			<div class="input-box">
				<label for="passcode">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-key" viewBox="0 0 16 16">
						<path d="M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8zm4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5z"/>
						<path d="M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
					</svg>
				</label>
				<input type=password id=passcode name=passcode placeholder="PASSWORD">
			</div>
			<div class="input-button">
			<input type="submit" id="btnLogin" name="btnLogin" value=Login>
			</div>
			<p class="go_signon">Not a member yet? <a href='/outback/signon'>Sign On</a></p>
		</div>
	</form>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		let flag="fail";
		$(document)
		.ready(function() {
			$('.input-box > input').focus(function(){
				$('.input-box').css('border','1px solid #ccc');
				$(this).parent('.input-box').css('border','2px solid rgba(201,25,25,0.75)');
			});
			$('html').click(function(e){ //문서 body를 클릭했을때
				if($(e.target.parentElement).hasClass('input-box') || $(e.target).hasClass('input-box')){
					return false;
				} else {
					$('.input-box').css('border','1px solid #ccc');
				}
			});
			let result = '<c:out value="${result}"/>';
			if (result == "none"){
				if(confirm("등록되지 않은 아이디 입니다. 회원가입으로 이동하시겠습니까?")){
					document.location="/outback/signon";
				} else{
					return false;
				}
			} else if(result == "idchk"){
				alert("아이디 혹은 비밀번호를 다시 확인해주세요.");
			} else if(result == 2){
				alert("탈퇴한 회원입니다.");
			}
		})
		.on('click','#btnLogin',function(){
			if($('#userid').val() == ''){
				alert('아이디를 입력하세요.');
				return false;
			}
			if($('#passcode').val() == ''){
				alert('비밀번호를 입력하세요.');
				return false;
			}
		})
		;
	</script>
</body>
</html>