<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<div>
		<input type="hidden" id="board_id" name="board_id" value="${b.board_id}">
		<div>
		<!-- board_id에 해당하는 게시글에 관한 댓글만 출력 -->
			<c:forEach items="${re}" var="re">
				<tr id="getBoard">
					<td><c:out value="${re.writer}"/></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${re.re_date}"/></td>
					<br>
					<td><c:out value="${re.content}"/></td>
		        </tr>
			</c:forEach>
		</div>
		<!-- 대댓글달기, 수정, 삭제 -->
		<!--  -->
		<div>
			<!-- 관리자, userid와 작성자가 같을 경우 입력 가능 -->
			<textarea id="cmt" name="cmt" placeholder="댓글을 입력해주세요" style="width:220px; height:80px;resize:none"></textarea>
		</div>
		<div>
			<!-- 관리자, userid와 작성자가 같을 경우 입력 가능 -->
			<button id="cmtBtn">댓글달기</button>
		</div>
	</div>
	<script>
	$(document)
	.ready(function() {
		
	})
	.on('click','#cmtBtn',function() {
		
	})
	</script>
</body>
</html>