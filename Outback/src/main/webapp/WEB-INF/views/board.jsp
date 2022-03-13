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
			<input name="updateDate" readonly="readonly" value="${b.vdate}">
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
			<c:choose>
				<c:when test="${m.userid==b.writer}">
					<button id="updateBtn">수정</button>
					<button id="deleteBtn">삭제</button>
				</c:when>
				<c:when test="${m.user_type==1}">
					<button id="deleteBtn">삭제</button>
				</c:when>
			</c:choose>
			<button id="cmtBtn">댓글</button>
		</div>

		<div id="reBoard" style="display:none;">
			<!-- board_id에 해당하는 게시글에 관한 댓글 출력 -->
			<table id="getReBoard"></table>
	
			<c:if test="${m.userid==b.writer || m.user_type==1}">
				<div>
					<input type="text" id="userid" name="userid" value="${m.userid}" style="border: 0px;">
				</div>
				<div>
					<textarea id="cmt" name="cmt" placeholder="댓글을 입력해주세요" style="width:220px; height:80px;resize:none"></textarea>
				</div>
				<div>
					<button id="reInsert">댓글달기</button>
				</div>
			</c:if>
		</div>
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
			if($('#reBoard').css('display')=='none') {
				$('#reBoard').css('display','block');
				getReBoard();
			} else {
				$('#reBoard').css('display','none');
			}
			return false;
		})
		.on('click','#reInsert',function() {
			$.ajax({url:'/outback/re_insert',
				data:{board_id:$('#board_id').val(), 
					  writer:$('#userid').val(),
				  	  content:$('#cmt').val()},
				method:'POST',
				datatype:'json',
				success:function(txt) {
					if(txt=="ok") {
						alert('댓글 작성 완료했습니다.');
						getReBoard();
						$('#cmt').val('');
					} else {
						alert('댓글 작성에 실패했습니다. 다시 작성해주세요.');
					}
				}
			});
		})
		.on('click','#delBtn',function() {
			console.log($(this).val());
			
			$.ajax({url:'/outback/re_delete',
				data:{re_id:$(this).val()},
				method:'POST',
				datatype:'json',
				success:function(txt) {
					if(txt=="ok") {
						alert('댓글 삭제 완료했습니다.');
						getReBoard();
					} else {
						alert('댓글 삭제 실패했습니다. 다시 삭제해주세요.');
					}
				}
			});
		})
		.on('click','#upBtn',function() {
			let text="<tr><td colspan=2><textarea id='cmtUpdate' name='cmtUpdate' placeholder='수정할 내용을 입력해주세요' style='width:220px; height:80px;resize:none;'></textarea></td></tr>";
			var tr=$(this).parent().parent();
			tr.next().after(text);
			
			let btn="<td><button id='cancel'>취소</button></td>";
			var td=tr.children();
			td.eq(td.length-1).after(btn);
			
			$(this).attr('id','upDateBtn');
		})
		.on('click','#cancel',function() {
			var tr=$(this).parent().parent();
			var reset=tr.next().next().remove();
			
			$('#cancel').remove();
			$('#upDateBtn').attr('id','upBtn');
		})
		.on('click','#upDateBtn',function() {
			if($('#cmtUpdate').val()=="") {
				alert("수정할 내용을 입력해주세요.");
				return false;
			}
			
			$.ajax({url:'/outback/re_update',
				data:{re_id:$(this).val(),
					  content:$('#cmtUpdate').val()},
				method:'POST',
				datatype:'json',
				success:function(txt) {
					if(txt=="ok") {
						alert('댓글 수정 완료했습니다.');
						getReBoard();
					} else {
						alert('댓글 수정 실패했습니다. 다시 수정해주세요.');
					}
				}
			});
		})
		function getReBoard() {
			$('#getReBoard').empty();
			$.ajax({url:'/outback/reList',
				data:{board_id:$('#board_id').val()},
				method:'GET',
				datatype:'json',
				success:function(txt) {
					console.log(txt);
					for(i=0;i<txt.length;i++) {
						let str1="<tr><td>"+txt[i]['writer']+"</td><td>"
								+txt[i]['re_date']+"</td>";
						let btnD="<td><button id='delBtn' value='"+txt[i]['re_id']+"'>삭제</button></td>";
						let btnU="<td><button id='upBtn' value='"+txt[i]['re_id']+"'>수정</button></td>";
						let str2="</tr><tr><td colspan=2>"+txt[i]['content']+"</td></tr>";
						
						if(${m.userid==b.writer}) {
							$('#getReBoard').append(str1+btnD+btnU+str2);
						} else if(${m.user_type==1}) {
							$('#getReBoard').append(str1+btnD+str2);
						} else {
							$('#getReBoard').append(str1+str2);
						}
					}
				}	
			});
		}
	</script>
</body>
</html>