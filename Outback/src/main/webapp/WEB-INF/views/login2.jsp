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
<title> - 로그인 - </title>
</head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${path}/resources/css/style.css">

<style>
body {
	height:100%;
	background-color:#e9e9e9;
	margin-top:200px;
}
input {
    width: 150px;
    margin: 3px 0;
    outline: none;
    text-align: center;
}
div.input-button {
	left:20px;
}
.input-box {
	position:relative;
	margin:10px;
	text-align:center;
	font-weight:bold;
	display: flex;
    flex-direction: column;
    width: 100%;
    height: 100%;
    align-items: center;
    justify-content: center;
}
.input-box input {
	padding:20px 0px 5px 0px;
	font-size:14pt;
	width:20%;
	text-align:center;
}
input[type=button]{
	border:none;
	width:305px;
	font-size:30px;
	border-radius:5px;
	background-color:#8aa1a1;
	color:white;
	margin-left:18px;
}
</style>
<body align=center>
	<h1 style="color:white; text-align: center; font-weight: bold; font-size: 40px; letter-spacing: 10px;font-family: 'Gelasio','Noto Sans KR', sans-serif; ">La Campanella</h1>
	<form method="POST" action="/outback/loginChk2" id=frmLogin>
		<div>
			<div class="input-box">
				<label for="username"></label>
				      <svg x="0px" y="0px" width="12px" height="13px">
		        <path fill="#B1B7C4" d="M8.9,7.2C9,6.9,9,6.7,9,6.5v-4C9,1.1,7.9,0,6.5,0h-1C4.1,0,3,1.1,3,2.5v4c0,0.2,0,0.4,0.1,0.7 C1.3,7.8,0,9.5,0,11.5V13h12v-1.5C12,9.5,10.7,7.8,8.9,7.2z M4,2.5C4,1.7,4.7,1,5.5,1h1C7.3,1,8,1.7,8,2.5v4c0,0.2,0,0.4-0.1,0.6 l0.1,0L7.9,7.3C7.6,7.8,7.1,8.2,6.5,8.2h-1c-0.6,0-1.1-0.4-1.4-0.9L4.1,7.1l0.1,0C4,6.9,4,6.7,4,6.5V2.5z M11,12H1v-0.5 c0-1.6,1-2.9,2.4-3.4c0.5,0.7,1.2,1.1,2.1,1.1h1c0.8,0,1.6-0.4,2.1-1.1C10,8.5,11,9.9,11,11.5V12z"/>
		      </svg>
				<input type=text name=userid id=userid placeholder="ID">
		
			</div>	
			<div class="input-box">
				<label for=passcode></label>
				      <svg x="0px" y="0px" width="15px" height="5px">
		          <path fill="#B1B7C4" d="M6,2L6,2c0-1.1-1-2-2.1-2H2.1C1,0,0,0.9,0,2.1v0.8C0,4.1,1,5,2.1,5h1.7C5,5,6,4.1,6,2.9V3h5v1h1V3h1v2h1V3h1 V2H6z M5.1,2.9c0,0.7-0.6,1.2-1.3,1.2H2.1c-0.7,0-1.3-0.6-1.3-1.2V2.1c0-0.7,0.6-1.2,1.3-1.2h1.7c0.7,0,1.3,0.6,1.3,1.2V2.9z"/>
		      </svg>
				<input type=password id=passcode name=passcode placeholder="PASSWORD">
			</div>
			<div class="input-button">
			<input type="submit" id="btnLogin" name="btnLogin" value=Login>
			</div>
			<p>Not a member yet? <a href='/outback/signon'>Sign Up</a></p>
		</div>
	</form>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		let flag="fail";
		$(document)
		.ready(function() {
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