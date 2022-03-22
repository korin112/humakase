<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> - 비밀번호 수정 - </title>
</head>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<style>
.O_container div {
	text-align:center;
}
#btnDone.btn,#btnCancel.btn {
    background-color: #8aa1a1;
    border:none;
    color:white;
    border-radius: 5px;
    margin-top:25px;
	margin-left:20px;
	margin-right:20px;
}

</style>
<body>
<%@include file ="header.jsp" %>
<div class="submenu_title_wrap">
	<div class="container submenu_title">
		<h1>CHANGE PASSWORD</h1>
		<p>Mypage - CHANGE PASSWORD</p>
	</div>
</div>
<form action="/outback/pwEdit" method="POST" id="editForm" name="editForm">
<div class="container O_container">
	<h1 style="text-align: center; font-weight:500; font-size:38px; margin-bottom:2rem;">비밀번호 변경</h1>
	<div class="editWrap">
			<input class="form-control form-control-inline text-center" type=text id=userid name=userid value="${userid}" readonly>
			<input class="form-control form-control-inline text-center" type=password id=passcode name=passcode placeholder="비밀번호변경"> 
			<input class="form-control form-control-inline text-center" type=password id=passcode1 name=passcode1 placeholder="비밀번호변경확인">
	</div>
	<div>
		<button class="btn" type=button id=btnCancel name=btnCancel>변경취소</button>
		<button class="btn" type=button id=btnDone name=btnDone>변경완료</button>
	</div>
</div>
</form>
<c:if test="${fail_user=='fail'}">
	<script type="text/javascript">
		alert("변경에 실패했습니다.");
	</script>
</c:if>
<%@include file ="footer.jsp" %>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
//비밀번호 변경 가능여부
.on('click','#btnDone',function(){
	if($("#passcode").val()==""){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	
	if($("#passcode1").val()==""){
		alert("비밀번호 확인을 입력해주세요");
		return false;
	}
	if($('#passcode').val() == $('#passcode1').val()){ //로그인 한 아이디를 불러오고(ajax call), 비밀번호 변경 
		$.ajax({url:"/outback/pwEdit",
			type:"POST",
			dataType:"text",
			data:{userid:$('#userid').val(),passcode:$('#passcode').val()},
			success:function(txt){
				if(txt=="ok"){
					console.log(txt);
					alert("비밀번호 변경완료되었습니다.");
					document.location='/outback/home';			
				}
			}
		})
	} else {	//비밀번호가 다를 시 return
		alert("비밀번호가 다릅니다.");
		return false;
		}
})
// 취소버튼 눌렀을 시 home으로 이동
.on('click','#btnCancel',function(){
	document.location='/outback/home';
	return false;
})
;
</script>
</html>