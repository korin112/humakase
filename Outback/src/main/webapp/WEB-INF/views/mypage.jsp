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
.withdrwal_comment{margin-top:10px; opacity:0.5; margin-bottom:0;}
</style>
<body>
<%@include file ="header.jsp" %>
<div class="submenu_title_wrap">
	<div class="container submenu_title">
		<h1>MEMBER WITHDRWAL</h1>
		<p>Mypage - MEMBER WITHDRWAL</p>
	</div>
</div>
<form action="/outback/pwCheck" method="POST" id="deleteForm" name="deleteForm">
    <div class="container O_container">
        <div class="panel panel-default panel-margin-10 editWrap">
            <div class="panel-body panel-body-content text-center">
                <h1 style="text-align: center; font-weight: 500; font-size: 38px; margin-bottom:2rem;">회원 탈퇴</h1>
				<div class="form-group">
					<input type="text" id="userid" name="userid" value="${userid}"  class="form-control form-control-inline text-center" readonly/>
                    <input type="password" id = "passcode" name="passcode" class="form-control form-control-inline text-center" placeholder="비밀번호" />
                    <input type="password" id="passcode1" name="passcode1"  class="form-control form-control-inline text-center" placeholder="비밀번호 확인" />
                </div>
                <p class="withdrwal_comment">※ 탈퇴 후 같은 아이디로 재가입이 불가능합니다.</p>
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