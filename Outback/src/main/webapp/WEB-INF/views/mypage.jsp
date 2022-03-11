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
<title>  - 마이 페이지 -  </title>
</head>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<style>
#btnDel.btn,#btnCancel.btn {
    background-color: #8aa1a1;
    border:none;
    color:white;
    border-radius: 5px;
}
</style>
<body>
<%@include file ="header.jsp" %>
<form action="/outback/pwCheck" method="POST" id="deleteForm" name="deleteForm">
                       <input type="hidden" id="userid" name="userid" value="${userid}" readonly>
    <div class="col-sm-8 col-sm-offset-2">
        <div class="panel panel-default panel-margin-10">
            <div class="panel-body panel-body-content text-center">
                <p class="lead">회원탈퇴를 하려면 비밀번호를 입력해주세요.</p>
                <div class="form-group">
                    <input type="password" id = "passcode" name="passcode" class="form-control form-control-inline text-center" placeholder="비밀번호" />
                </div>
                <div class="form-group">
                    <input type="password" id="passcode1" name="passcode1"  class="form-control form-control-inline text-center" placeholder="비밀번호 확인" />
                </div>
                <button type="button" id="btnDel" name="btnDel" class=btn>회원탈퇴</button>
                <button type="button" id="btnCancel" name="btnCancel" class=btn>취소</button>
            </div>
        </div>
    </div>
    </form>
    <c:if test="${fail_user=='fail'}">
	<script type="text/javascript">
		alert("로그인에 실패했습니다.");
	</script>
</c:if>
<%@include file ="footer.jsp" %>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript">
$(document)
.on('click','#btnDel',function(){
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
		$.ajax({
			url : "/outback/pwCheck",
			type : "POST",
			dataType : "text",
			data : {userid:$('#userid').val(),passcode:$('#passcode').val()},
			success: function(){
				alert("그동안 이용해 주셔서 감사합니다.");
				document.location='/outback/home';
			}
		})
})
.on('click','#btnCancel',function(){
	document.location="/outback/home";
	return false;
})
;

</script>
</html>