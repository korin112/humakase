<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<input type="hidden" id="board_id" name="board_id" value="${b.board_id}">
		<div>
			<label>제목</label>
			<input id="title" name="title" value="${b.title}">
		</div>
		<div>
			<label>지점</label>
			<input name="spot" readonly="readonly" value="${b.spot_code}">
		</div>
		<div>
			<label>메뉴</label>
			<input name="menu" readonly="readonly" value="${b.menu_name}">
		</div>
		<div>
			<label>내용</label><br><br>
			<textarea rows="3" id="content" name="content">${b.content}</textarea>
		</div>
		<div>
			<label>작성자</label>
			<input name="writer" readonly="readonly" value="${b.writer}">
		</div>
		<div>
			<label>수정일</label>
			<input name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${b.updated}"/>'>
		</div>
		<div>
			<button id="update">수정</button>	
			<button id="cancel">취소</button>
		</div>	
	</div>
	<%@include file ="footer.jsp" %>
	<script>
		$(document)
		.on('click','#cancel',function() {
			document.location="/hotel/getBoard?board_id="+$('#board_id').val();
		})
		.on('click','#update',function() {
			$.ajax({url:'/hotel/board_update',
					data:{board_id:$('#board_id').val(),
						  title:$('#title').val(),
						  content:$('#content').val()},
					method:'POST',
					datatype:'json',
					success:function(txt) {
						console.log($('#board_id').val()+","+$('#title').val()+","+$('#content').val());
						console.log(txt);
						if(txt=="ok") {
							alert('수정 완료.');
							document.location='/hotel/board_list';
						} else {
							alert('다시 수정해주세요.');
						}
					}
			});
		})
	</script>
</body>
</html>