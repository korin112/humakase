<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<header>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  <div class="container">
	    <a class="navbar-brand mb-md-0 h_logo" href="/outback/home">La Campanella</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div id="navbarSupportedContent">
	    <form name="frm" action="/outback/logout" method="POST">
			<input type="hidden" name="userid" value="${userid}" id=userid>
		</form> 
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link" aria-current="page" href="/outback/spot">지점위치</a>
	        </li>
	         <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            메뉴소개
	          </a>
	          <ul class="dropdown-menu  dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
	            <li><a class="dropdown-item" href="/outback/submenu/steak">Steak</a></li>
	            <li><a class="dropdown-item" href="/outback/submenu/pasta">Pasta</a></li>
	            <li><a class="dropdown-item" href="/outback/submenu/sidemenu">Side-menu</a></li>
	            <li><a class="dropdown-item" href="/outback/submenu/drink">Drink</a></li>
	          </ul>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/outback/board_list">리뷰게시판</a>
	        </li>
			<li class="nav-item">
				<a class="nav-link" id=cart1>예약하기</a>
			</li>
		        <c:if test="${userid==null}">
			        <li class="nav-item">
			          <a class="nav-link" href="/outback/login">로그인</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="/outback/signon">회원가입</a>
			        </li>
		        </c:if>
	       		<c:if test="${userid!=null}">
					<c:if test="${user_type != 0}">
						<li class="nav-item">
							<a class="nav-link" href="/outback/adm/menuadd">[관리자페이지 이동]</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#" onclick="if(confirm('로그아웃하시겠습니까?')){javascript:document.frm.submit();return false;}">로그아웃</a>
						</li>
					</c:if>
					<c:if test="${user_type == 0}">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
								${userid}님
							</a>
							<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
								<li><a class="dropdown-item" href="/outback/mypage/mybook/later">예약확인</a></li>
								<li><a class="dropdown-item" href="/outback/covid_check">코로나19 감염현황</a></li>
								<li><a class="dropdown-item" href="/outback/passEdit">비밀번호변경</a></li>
								<li><a class="dropdown-item" href="/outback/mypage">회원탈퇴</a></li>
								<li><a class="dropdown-item" href="/outback/mypage/myboard">리뷰관리</a></li>
							</ul>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#" onclick="if(confirm('로그아웃하시겠습니까?')){javascript:document.frm.submit();return false;}">로그아웃</a>
						</li>
					</c:if>
				</c:if>		
	      </ul>
	    </div>
	  </div>
	</nav>
</header>

<script>
$(document)
.on('click','#cart1',function(){
	if($('#userid').val() == ""){
		if(!confirm("로그인 후 이용해주세요")) return false;
		document.location="/outback/login";
	} else{
		document.location="/outback/cart";
	}
})
;
</script>