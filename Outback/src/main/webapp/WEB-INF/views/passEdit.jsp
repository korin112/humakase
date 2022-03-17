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
<title> - 비밀번호 수정 - </title>
</head>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<style>
div {
	align:center;
	text-align:center;
}
#btnDone.btn,#btnCancel.btn {
    background-color: #8aa1a1;
    border:none;
    color:white;
    border-radius: 5px;
}
</style>
<body>
<%@include file ="header.jsp" %>
<form action="/outback/pwEdit" method="POST" id="editForm" name="editForm">
<div class="container O_container">
                <h1 style="text-align: center; font-weight: bold; font-size: 40px; letter-spacing: 6px;">비밀번호 변경</h1>
					<h2 style="text-align: center; font-weight: bold; color: #ccc; margin-bottom: 30px; font-size: 22px; letter-spacing: 4px;">Change Password</h2>
	<div>
			<label for=userid>아이디</label>
			<input class="form-control form-control-inline text-center" type=text id=userid name=userid value="${userid}" readonly>
	</div>
	<div>
			<input class="form-control form-control-inline text-center" type=password id=passcode name=passcode placeholder="비밀번호변경"> 
	</div>
	<div>
			<input class="form-control form-control-inline text-center" type=password id=passcode1 name=passcode1 placeholder="비밀번호변경확인">
	</div>
			<button class="btn" type=button id=btnDone name=btnDone>변경완료</button>
			<button class="btn" type=button id=btnCancel name=btnCancel>변경취소</button>
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
.on('click','#btnDone',function(){
	if($("#passcode").val()==""){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	
	if($("#passcode1").val()==""){
		alert("비밀번호 확인을 입력해주세요");
		return false;
	}
	if($('#passcode').val() == $('#passcode1').val()){
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
	} else {
		alert("비밀번호가 다릅니다.");
		return false;
		}
})
.on('click','#btnCancel',function(){
	document.location='/outback/home';
	return false;
})
;
</script>
</html>