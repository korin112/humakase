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
<body>
<form action="/outback/pwEdit" method="POST" id="editForm" name="editForm">
<div>
	<ul>
		<li>
			<label for=userid>아이디</label>
			<input type=text id=userid name=userid value="${userid}" readonly>
		</li>
	</ul>
	<ul>
		<li>
			<label for=pass>기존 비밀번호</label>
			<input type=text id=pass name=pass value="${passcode}" readonly>
		</li>
	</ul>
	<ul>
		<li>
			<label for=passcode>비밀번호변경</label>
			<input type=text id=passcode name=passcode> 
		</li>
	</ul>
	<ul>
		<li>
			<label for=passcode1>비밀번호 변경확인</label>
			<input type=text id=passcode1 name=passcode1>
		</li>
	</ul>
	<ul>
		<li>
			<input type=button id=btnDone name=btnDone value=변경완료>
			<input type=button id=btnCancel name=btnCancel value=변경취소>
		</li>
	</ul>
</div>
</form>
<c:if test="${fail_user=='fail'}">
	<script type="text/javascript">
		alert("로그인에 실패했습니다.");
	</script>
</c:if>
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
	
	if ($("#passcode").val() != $("#passcode1").val()) {
		alert("비밀번호가 일치하지 않습니다.");
		return false;
		}
	$.ajax({url:"/outback/pwEdit",
			type:"POST",
			dataType:"text",
			data:{userid:$('#userid').val(),passcode:$('#passcode').val()},
			success:function(){
				alert("test");
			}
	})
})
.on('click','#btnCancel',function(){
	document.location='/outback/home';
	return false;
})
;
</script>
</html>