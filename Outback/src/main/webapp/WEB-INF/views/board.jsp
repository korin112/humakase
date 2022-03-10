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
<style>
</style>
</head>
<body>
	<%@include file ="header.jsp" %>
	<div class="container O_container">
		<input type="hidden" id="board_id" value="${b.board_id}">
		<div>
			<label>제목</label>
			<input name="title" readonly="readonly" value="${b.title}">
		</div>
		<div>
			<label>방문일</label>
			<input name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${b.vdate}"/>'>
		</div>
		<div>
			<label>지점</label>
			<input name="spot" readonly="readonly" value="${b.spot_name}">
		</div>
		<div>
			<label>메뉴</label>
			<input name="menu" readonly="readonly" value="${b.menu_name}">
		</div>
		<div>
			<label>내용</label><br>
			<textarea rows="3" name="content" readonly="readonly">${b.content}</textarea>
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
			<button id="listBtn">목록페이지</button>
			<c:if test="${m.userid==b.writer}">
				<button id="updateBtn">수정</button>
				<button id="deleteBtn">삭제</button>
			</c:if>
			<button id="cmtBtn">댓글</button>
		</div>
<%-- 		<div class="box"><%@include file = "re_board.jsp" %></div> --%>

		<div>
			<table>
			<!-- board_id에 해당하는 게시글에 관한 댓글만 출력 -->
				<c:forEach items="${reBoard}" var="re">
					<tr id="getBoard">
						<td><c:out value="${re.writer}"/></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${re.re_date}"/></td>
			        </tr>
			        <tr><td colspan=2><c:out value="${re.content}"/></td></tr>
				</c:forEach>
			</table>
			</div>
			<!-- 대댓글달기, 수정, 삭제 -->
			<c:if test="${m.userid==b.writer || m.user_type==1}">
				<div>
					<input type="text" id="userid" name="userid" value="${m.userid}" style="border: 0px;">
				</div>
				<div>
					<textarea id="cmt" name="cmt" placeholder="댓글을 입력해주세요" style="width:220px; height:80px;resize:none"></textarea>
				</div>
				<div>
					<button id="cmtBtn">댓글달기</button>
				</div>
			</c:if>
	</div>
	<%@include file ="footer.jsp" %>
	<script>
		$(document)
		.on('click',"#listBtn",function() {
			document.location="/outback/board_list";
		})
		.on('click','#updateBtn',function() {
			document.location="/outback/board_update?board_id="+$('#board_id').val();
		})
		.on('click','#deleteBtn',function() {
			if(!confirm("삭제하시겠습니까?")) return false;
			document.location="/outback/board_delete?board_id="+$('#board_id').val();
		})
		.on('click','#cmtBtn',function() {
// 			document.location="/outback/re_board?board_id="+$('#board_id').val();
// 			 $('.box').addClass('on');
		})
	</script>
</body>
</html>