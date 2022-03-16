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
	*{margin:0; padding:0;}
	ul, li{list-style:none;}
	.fixed::after{content:''; clear:both; display:block;}
	.option .dropdown-toggle::after{margin-left:1.255rem;}
	.dropdown-menu{max-height:200px; overflow-y:auto; overflow-x:hidden;}
	.dropdown-item{cursor:pointer;}
	.book-list{overflow:hidden;}
	.book-list article{display:block; margin:3.5rem 1.25rem; width:Calc(55% - 1.25rem); height:100%; float:left;}
	.book-list #comment_article{margin:1.5rem 1.25rem;}
	.booking_info_box > ul{display:table; width:100%; margin:0; padding:0; border-bottom:1px solid #ddd;}
	.booking_info_box > ul:first-child{border-top:1px solid #ddd;}	
	.booking_info_box > ul > li{width:70%; display:table-cell; padding:1.25rem 0 1.25rem 2.125rem;}
	.booking_info_box > ul > li:first-child{width:30%; vertical-align:middle; background:#f9f9f9;}
	.booking_info_box input{border:none;}
	.booking_info_box li #content{width:100%; resize:none; border:1px solid #ddd; padding:0.5rem; height:300px;}
	.board_btn{text-align:center; margin:2.125rem 3.375rem;}
	.board_btn button{border:none; width:24%; padding:1rem 1rem;
		color:#090909; background:#D5D5D5; font-size:1.125rem; border-radius:5px;}
	.O_container .book-list{border-bottom:2px solid #ccc;}
	.O_container .book-list #comment_div #comment_info_box {padding-bottom:1rem; color:#BDBDBD; font-size:0.75rem;}
	.O_container .book-list #comment_div a {color:inherit;}
 	.O_container .book-list #comment_div #delBtn {padding-left:1rem; padding-right:0.5rem;}
  	.O_container .book-list #comment_div #cancel {padding-left:0.5rem;} 
</style>
</head>
<body>
	<%@include file ="header.jsp" %>
	<div class="container O_container">
	<section class="book-list fixed">
		<article class="booking_info_box">
			<input type="hidden" id="board_id" value="${b.board_id}">
			<ul class="fixed">
				<li>제목</li>
				<li><input id="title" name="title" readonly="readonly" value="${b.title}"></li>
			</ul>
			<ul class="fixed">
				<li>방문일</li>
				<li><input name="updateDate" readonly="readonly" value="${b.vdate}"></li>
			</ul>
			<ul class="fixed">
				<li>지점</li>
				<li><input name="spot" readonly="readonly" value="${b.spot_name}"></li>
			</ul>
			
			<ul class="fixed">
				<li>메뉴</li>
				<c:forEach items="${menu_name}" var="m">
					<ul><li data-value="${m.menu_name}">${m.menu_name}</li></ul>
				</c:forEach>
			</ul>
			<ul class="fixed">
					<li>내용</li>
					<li><textarea id="content" name="content" spellcheck=false readonly="readonly">${b.content}</textarea></li>
			</ul>
			<ul class="fixed">
					<li>작성자</li>
					<li><input name="writer" readonly="readonly" value="${b.writer}"></li>
			</ul>
			<ul class="fixed">
					<li>수정일</li>
					<li><input name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${b.updated}"/>'></li>
			</ul>
			<div class=board_btn>
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
			</div>
		</article>
	</section>
	<section class="book-list fixed">
		<article id="comment_article">
			<div>
				<span id="cmtBtn">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
			  			<path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
			  			<path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
					</svg>
					댓글
					<strong id="reCnt">${reCnt}</strong>
				</span>
			</div>
		</article>
	</section>
	<section class="book-list fixed" id="reBoard" style="display:none;">
		<article id="comment_article">
			<div id="comment_div"></div>
			<div>
				<c:if test="${m.userid==b.writer || m.user_type==1}">
					<div>
						<input type="text" id="userid" name="userid" readonly=readonly value="${m.userid}">
					</div>
					<div>
						<textarea id="cmt" name="cmt"  spellcheck=false placeholder="댓글을 입력해주세요" style="width:220px; height:80px;resize:none"></textarea>
					</div>
					<div>
						<button id="reInsert">댓글달기</button>
					</div>
				</c:if>
			</div>
		</article>
	</section>
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
			//console.log($(this).attr('data-value'));
			if(!confirm("정말 삭제하시겠습니까?")) return false;
			$.ajax({url:'/outback/re_delete',
				data:{re_id:$(this).attr('data-value')},
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
			console.log($(this).attr('data-value'));
			
			let ar=$(this).attr('data-value').split(",");
			let text="<textarea id='cmtUpdate' name='cmtUpdate' placeholder='수정할 내용을 입력해주세요'>"+ar[1]+"</textarea>";
			
			var comment_info=$(this).parent();
			var comment_content=comment_info.prev();
			comment_content.empty();
			comment_content.append(text);
			
			let btnC="<a href='#' role='button' id='cancel'>취소</a>";
			comment_info.append(btnC);
			
			$(this).text("완료");
			$(this).attr('id','upDateBtn');
		})
		.on('click','#cancel',function() {
			var comment_info=$(this).parent().prev();
			let comment="<span>"+comment_info.text()+"</span>";
			comment_info.empty();
			comment_info.append(comment);
			
			$('#cancel').remove();
			$('#upDateBtn').text("수정");
			$('#upDateBtn').attr('id','upBtn');
		})
		.on('click','#upDateBtn',function() {
			if($('#cmtUpdate').val()=="") {
				alert("수정할 내용을 입력해주세요.");
				return false;
			}
			
			let ar=$(this).attr('data-value').split(",");
			$.ajax({url:'/outback/re_update',
				data:{re_id:ar[0], content:$('#cmtUpdate').val()},
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
			$('#comment_div').empty();
			$.ajax({url:'/outback/reList',
				data:{board_id:$('#board_id').val()},
				method:'GET',
				datatype:'json',
				success:function(txt) {
					//console.log(txt);
					for(i=0;i<txt.length;i++) {
						let writer="<div><strong>"+txt[i]['writer']+"</strong></div>";
						let content="<div><span>"+txt[i]['content']+"</span></div>"
						let re_date="<span>"+txt[i]['re_date']+"</span>"
						let div1="<div id='comment_info_box'>";
						let div2="</div>"

						let btnD="<a href='#' role='button' id='delBtn' data-value='"+txt[i]['re_id']+"'>삭제</a>";
						let btnU="<a href='#' role='button' id='upBtn' data-value='"+txt[i]['re_id']+","+txt[i]['content']+"'>수정</a>";
						
						$('#comment_div').append(writer+content);
						if(${m.userid==b.writer}) {
							$('#comment_div').append(div1+re_date+btnD+btnU+div2);
						} else if(${m.user_type==1}) {
							$('#comment_div').append(div1+re_date+btnU+div2);
						} else {
							$('#comment_div').append(div1+re_date+div2);
						}
					}
				
					$('#reCnt').empty();
					$('#reCnt').append(txt.length);
				}	
			});
		}
	</script>
</body>
</html>