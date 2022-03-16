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
}
input {
    width: 150px;
    margin: 3px 0;
    outline: none;
    text-align: center;
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
/* 	border:none; */
/* 	border-bottom:1px solid #ccc; */
	padding:20px 0px 5px 0px;
	font-size:14pt;
	width:20%;
	text-align:center;
}
input[type=button],input[type=submit] {
	border:none;
	
}

/* .input-box { */
/* 	position:relative; */
/* 	margin:10px 0; */
/* 	left:630px; */
/* 	top:60px; */
/* } */
/* .input-box > input { */
/* 	background:transparent; */
/* 	border:none; */
/* 	border-bottom:solid 1px #ccc; */
/* 	padding:20px 0px 5px 0px; */
/* 	font-size:14pt; */
/*  	width:20%; */
/* } */
/* input::placeholder{ */
/*  	color:transparent; */
/*  } */
/* input:focus + label, label{ */
/*  	color:#8aa1a1; */
/*  	font-size:10pt; */
/*  	pointer-events:none; */
/*  	position: absolute; */
/*  	left:0px; */
/*  	top:0px; */
/*  	transition:all 0.2s ease; */
/* } */
/* input[type=submit],input[type=button]{ */
/*     background-color: #8aa1a1; */
/*     border:none; */
/*     color:white; */
/*     border-radius: 5px; */
/*     width:80px; */
/*     height:35px; */
/*     font-size: 14pt; */
/*     margin-top:140px; */
/* } */
/* #forgot{ */
/*     text-align: right; */
/*     font-size:12pt; */
/*     color:rgb(164, 164, 164); */
/*     margin:10px 0px; */
/* } */
/* input:focus, input:not(:placeholder-shown){ */
/*  	border-bottom:solid 1px #8aa1a1; */
/*  	outline:none; */
/* } */
/* .input-button { */
/* 	margin-left:660px; */
/* } */
</style>
<body align=center>
<%-- <%@include file ="header.jsp" %> --%>
<h1 style="text-align: center; font-weight: bold; font-size: 40px; letter-spacing: 6px;">로그인</h1>
			<h2 style="text-align: center; font-weight: bold; color: #ccc; margin-bottom: 30px; font-size: 22px; letter-spacing: 4px;">Login</h2>
<form method="POST" action="/outback/login_check" id=frmLogin>
<div>
	<div class="input-box">
		<label for="username">아이디</label>
		<input type=text name=userid id=userid placeholder="ID">
		<input type=hidden name=user id=user value="${fail_user}">
	</div>	
	<div class="input-box">
		<label for=passcode>비밀번호</label>
		<input type=password id=passcode name=passcode placeholder="PASSWORD">
	</div>
	<div class="input-button">
	<input type=submit value=로그인>
	<input type=button name=cancel id=cancel value=취소>
	<input type=button name=signon id=signon value=회원가입>
	</div>
</div>
</form>
<c:if test="${fail_user=='fail'}">
	<script type="text/javascript">
		alert("로그인에 실패했습니다.");
	</script>
</c:if>
<%-- <%@include file ="footer.jsp" %> --%>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('submit','#frmLogin',function(){
		if($('#userid').val() == ''){
			alert('아이디를 입력하세요.');
			return false;
		}
		if($('#passcode').val() == ''){
			alert('비밀번호를 입력하세요.');
			return false;
		}
})
//취소 시 홈화면으로 이동
.on('click','#cancel',function(){
	document.location="/outback/home";
	return false;
})
//회원가입.jsp로 이동
.on('click','#signon',function(){
	document.location="/outback/signon"
})
;
</script>
</html>