<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/style.css">
</head>
<body>
	<%@include file ="header.jsp" %>
	<div class="container O_container">
	<form action="/hotel/board_insert" method="post">
	    <div>
	        <label>제목</label>
	        <input name="title" id="title">
	    </div>
	    <div>
	        <label>작성자</label>
	        <%-- 작성자(member table userid) session --%>
	        <input type=text name="writer" id="writer">
	    </div>
	    <div>
	        <label>날짜</label>
	        <%-- booking table vdate --%>
<!-- 	        <select name="vdate"></select> -->
			<input type=text name="vdate" id="vdate">
	    </div>
	    <div>
	        <label>지점</label>
	        <%-- booking table spot code, spot name --%>
<!-- 	        <select name="spot"></select> -->
			<input type=text name="spot" id="spot">
	    </div>
	    <div>
	        <label>메뉴</label>
	        <%-- booking table menu code, menu name --%>
	        <select id="menu" name="menu"></select>
	    </div>
	    <div>
	        <label>내용</label>
	        <textarea rows="5" id="content" name="content"></textarea>
	    </div>
	    <br>
	    <button id="done">완료</button>
	</form>
	</div>
	<%@include file ="footer.jsp" %>
	<script>
		$(document)
		.ready(function() {
			$.ajax({url:'/hotel/menuList',
					data:{},
					method:'GET',
					datatype:'json',
					success:function(txt) {
						console.log(txt);
						for(i=0;i<txt.length;i++) {
							let str='<option value='+txt[i]['menu_code']+'>'
										+txt[i]['menu_name']+'</option>';
							$('#menu').append(str);
						}
					}
			});
		})
		
		.on('click','#done',function() {
			console.log($('#title').val());
			console.log($('#writer').val());
			console.log($('#vdate').val());
			console.log($('#spot').val());
			console.log($('#menu').val());
			console.log($('#content').val());
		})
	</script>
</body>