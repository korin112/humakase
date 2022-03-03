<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> - 로그인 - </title>
</head>
<body>
<form method="POST" action="/outback/login_check" id=frmLogin>
<table align=center valign=middle>
<h3 align=center>로그인을 진행해주세요</h3>
<tr><td>아이디</td><td><input type=text name=userid id=userid></td></tr>
<tr><td>비밀번호</td><td><input type=password name=passcode id=passcode></td></tr>
<tr><td colspan=2 align=center><input type=submit value="로그인">&nbsp;
				<input type=button value="취소" name= cancel id=cancel>&nbsp;
				<input type=button id=signon name=signon value=회원가입>
</td></tr>
</table>
</form>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('submit','#frmLogin',function(){
		if($('#userid').val() == ''){
			alert('userid를 입력하세요.');
			return false;
		}
		if($('#passcode').val() == ''){
			alert('password를 입력하세요.');
			return false;
		}
})
//취소 시 홈화면으로 이동
.on('click','#cancel',function(){
	document.location="/outback/";
	return false;
})
//회원가입.jsp로 이동
.on('click','#signon',function(){
	document.location="/outback/signon"
})
;
</script>
</html>