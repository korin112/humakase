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
		<table>
		<!-- board_id에 해당하는 게시글에 관한 댓글만 출력 -->
			<c:forEach items="${re}" var="re">
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
	<script>
	$(document)
	.ready(function() {
		
	})
	.on('click','#cmtBtn',function() {
		$.ajax({url:'/outback/re_insert',
			data:{board_id:$('#board_id').val(), 
				  writer:$('#userid').val(),
			  	  content:$('#cmt').val()},
			method:'POST',
			datatype:'json',
			success:function(txt) {
				if(txt=="ok") {
					alert('댓글 작성 완료했습니다.');
					document.location='/outback/re_board?board_id='+$('#board_id').val();
				} else {
					alert('dd다시 작성해주세요.');
				}
			}
		});
	})
	</script>
</body>
</html>