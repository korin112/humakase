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
<title>  - 회원 탈퇴 -  </title>
</head>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<style>
#btnDel.btn,#btnCancel.btn {
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
<form action="/outback/pwCheck" method="POST" id="deleteForm" name="deleteForm">
    <div class="container O_container">
        <div class="panel panel-default panel-margin-10">
            <div class="panel-body panel-body-content text-center">
                <h1 style="text-align: center; font-weight: bold; font-size: 40px; letter-spacing: 6px;">회원 탈퇴</h1>
					<h2 style="text-align: center; font-weight: bold; color: #ccc; margin-bottom: 30px; font-size: 22px; letter-spacing: 4px;">Member Withdrawal</h2>
                <div class="form-group">
                    <input style='width:500px; margin-left:400px;' type="text" id="userid" name="userid" value="${userid}"  class="form-control form-control-inline text-center" readonly/>
				</div>
                <div class="form-group">
                    <input style='width:500px; margin-left:400px;'  type="password" id = "passcode" name="passcode" class="form-control form-control-inline text-center" placeholder="비밀번호" />
                </div>
                <div class="form-group">
                    <input style='width:500px; margin-left:400px;'  type="password" id="passcode1" name="passcode1"  class="form-control form-control-inline text-center" placeholder="비밀번호 확인" />
                </div>
                <button type="button" id="btnDel" name="btnDel" class=btn>회원탈퇴</button>
                <button type="button" id="btnCancel" name="btnCancel" class=btn>취소</button>
            </div>
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
<script type="text/javascript">
let flag="";
$(document)
//비밀번호 유효성검사
.on('click','#btnDel',function(){
		if($("#passcode").val()==""){
			alert("비밀번호를 입력해주세요");
			return false;
		}
		
		if($("#passcode1").val()==""){
			alert("비밀번호 확인을 입력해주세요");
			return false;
		}
		
		if($('#passcode').val() == $('#passcode1').val()){ //로그인한 정보의 비밀번호가 맞는지 체크(ajax call)
			$.ajax({
				url : "/outback/pwCheck",
				type : "POST",
				dataType : "text",
				data : {userid:$('#userid').val(),passcode:$('#passcode').val()},
				success: function(txt){
					if(txt == "fail"){ //model.addAttribute("fail_user",retval);를 사용해서 다르면 fail
						alert("비밀번호가 다릅니다.");
						return false;
					} else { //session.invalidate(); 로그인 정보가 맞으면 ok
						alert("그동안 이용해 주셔서 감사합니다.");
						document.location='/outback/home';
						flag="true";
					}
					return true;
				}
			})			
		}
})
.on('click','#btnCancel',function(){
	document.location="/outback/home";
	return false;
})
;
</script>
</html>