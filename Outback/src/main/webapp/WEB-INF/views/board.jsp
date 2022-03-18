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
	*{margin:0; padding:0; outline:0;}
	ul, li{list-style:none;}
	.fixed::after{content:''; clear:both; display:block;}
	.option .dropdown-toggle::after{margin-left:1.255rem;}
	.dropdown-menu{max-height:200px; overflow-y:auto; overflow-x:hidden;}
	.dropdown-item{cursor:pointer;}
	.book-list{overflow:hidden;}
	.book-list article{display:block; margin:0 auto; width:70%; height:100%;}
	.booking_info_box > ul{display:table; width:100%; margin:0; padding:0; border-bottom:1px solid #ccc;}
	.booking_info_box > ul:first-child{border-top:1px solid #ddd;}	
	.booking_info_box > ul > li{width:80%; display:table-cell; padding:1.25rem 0 1.25rem 2.125rem;}
	.booking_info_box > ul > li:first-child{width:20%; vertical-align:middle; background:#EAEAEA;}
	.booking_info_box input{border:none; width:100%;}
	.booking_info_box li #content{width:100%; height:200px; resize:none; border:0; overflow:hidden; overflow-wrap:break-word;}
   	.booking_info_box .menu_name:nth-child(n+2) {padding-top:0;}  
 	.booking_info_box .menu_name:nth-last-child(n+2) {padding-bottom:0;}
	.booking_info_box .menu_name:nth-child(n+3):nth-last-child(n+1) {margin-top:0;}
	
	.board_btn{text-align:right; margin-top:1.5rem; margin-right:0.5rem;}

	/* 댓글 */
	.O_container #comment_div #comment_box_cmt {padding-left: 2.25rem;}
	.O_container #comment_div #comment_info_box {padding-left: 2.25rem; padding-bottom:1rem; color:#BDBDBD; font-size:0.75rem;}
	.O_container #comment_div a {color:inherit;}
 	.O_container #comment_div #delBtn {padding-left:1rem; padding-right:0.5rem;}
 	.O_container #comment_div #upDateBtn {padding-left:1rem;} 	
  	.O_container #comment_div #cancel {padding-left:0.5rem;}
  	 
  	/* 댓글 달기 */
  	.O_container .article_wrap {margin:1.5rem auto; width:70%; border-bottom:2px solid #ccc;}
  	.O_container .article_wrap .bi-chat-dots{width:20px; height:35px; padding-bottom:0.25rem;}
   	.O_container .article_wrap .comment_icon {float:left;}
   	.O_container .article_wrap .comment_writer_info {display:inline-block;}
    .O_container .article_wrap .bi-person-circle {width:20px; height:35px; margin-right:1rem;} 
    .O_container .article_wrap .bi-wrench-adjustable-circle {color:#FF9090; width:20px; height:35px; margin-right:1rem;}
  	.O_container .article_wrap #cmtUpdate {overflow:hidden; overflow-wrap:break-word; width:95%; resize:none;
  		border:2px solid #ccc; padding:0.5rem; height:2.5rem; max-height:500px; font-size:1rem; border-radius:5px;}
  	
  	.CommentWriter {margin:12px 0 12px; padding:12px 10px 8px 18px; 
  		border:2px solid #A6A6A6; border-radius:6px; box-sizing:border-box; background:#ffffff;}
  	.CommentWriter .comment_inbox {position:relative; margin-bottom:10px;}
  	.CommentWriter .comment_inbox_name {margin-bottom:10px;}
  	.CommentWriter .comment_inbox_text::placeholder{color:#BDBDBD;}
  	.CommentWriter .comment_inbox_text {overflow:hidden; overflow-wrap:break-word; width:100%;
    	min-height:1.35rem; max-height:500px; font-size:1rem; padding-right:1px; margin-top:8px;
  		border:0px; resize:none; box-sizing:boder-box; display:block; outline:0;}
  	.CommentWriter .comment_attach {position:relative;  padding-right:10px;}
  	.CommentWriter .comment_attach .register_box {text-align:right;}
  	.CommentWriter .comment_attach .register_box a {color:#A6A6A6;}
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
					<li class="menu_name" style="display:inline-block; font-weight:400;" data-value="${m.menu_name}">${m.menu_name}</li>
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
				<button id="listBtn" class="btn btn-outline-secondary">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
  						<path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
					</svg> 목록
				</button>
				<c:choose>
					<c:when test="${m.userid==b.writer}">
						<button type="button" id="updateBtn" class="btn btn-outline-secondary">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
  								<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
							</svg> 수정
						</button>
						<button type="button" id="deleteBtn" class="btn btn-outline-secondary">
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
								<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
								<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
							</svg> 삭제
						</button>
<!-- 						<button id="deleteBtn">삭제</button> -->
					</c:when>
					<c:when test="${m.user_type==1}">
						<button type="button" id="deleteBtn" class="btn btn-outline-secondary">
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
								<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
								<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
							</svg> 삭제
						</button>
					</c:when>
				</c:choose>
			</div>
		</article>
	</section>
	<section>
		<article class="article_wrap">
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
	<section  id="reBoard" style="display:none;">
		<div class="article_wrap">		
			<div id="comment_div"></div>
			<c:if test="${m.userid==b.writer || m.user_type==1}">
				<div class="CommentWriter">
					<div class="comment_inbox">
						<strong class="comment_inbox_name" id="userid">${m.userid}</strong>
						<textarea id="cmt" name="cmt" spellcheck=false placeholder="댓글을 남겨보세요."
								class="comment_inbox_text" style="height:1.8rem;" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
					</div>
					<div class="comment_attach">
						<div class="register_box">
							<a href="#none" role="button" class="button" id="reInsert">등록</a>
						</div>
					</div>
				</div>
			</c:if>
		</div>
	</section>
	</div>
	<%@include file ="footer.jsp" %>
	<script>
		$(document)
		.on('click',"#listBtn",function() {
			var path1='/outback/board_list';
			var path2='/outback/mypage/myboard';
			findLink(path1,path2);
		})
		.on('click','#updateBtn',function() {
			var path1="/outback/board_update?board_id="+$('#board_id').val();
			var path2="/outback/mp_board_update?board_id="+$('#board_id').val();
			findLink(path1,path2);	
		})
		.on('click','#deleteBtn',function() {
			if(!confirm("삭제하시겠습니까?")) return false;
			
			var path1="/outback/board_delete?board_id="+$('#board_id').val();
			var path2="/outback/mp_board_delete?board_id="+$('#board_id').val();
			findLink(path1,path2);
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
			if($('#cmt').val()=='') {
				alert('댓글을 입력해주세요');
				return false;
			}
			console.log($('#userid').text());
			console.log($('#userid').val());
			
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
			// console.log($(this).attr('data-value'));
			let ar=$(this).attr('data-value').split(",");
			let style="style:'height:1.5rem;' onkeydown='resize(this)' onkeyup='resize(this)'";
			let text="<textarea id='cmtUpdate' name='cmtUpdate' spellcheck=false "+style+"placeholder='수정할 내용을 입력해주세요'>"+ar[1]+"</textarea>";
			
			var comment_info=$(this).parent();
			var comment_content=comment_info.prev();
			comment_content.empty();
			comment_content.append(text);
			
			let btnC="<a href='#none' role='button' id='cancel'>취소</a>";
			comment_info.append(btnC);
			
			$(this).text("완료");
			$(this).attr('id','upDateBtn');
			
			let btnD=comment_info.find('a[id=delBtn]');
			if(ar[0]==btnD.attr('data-value')) {
				btnD.css('display','none');
			}
		})
		.on('click','#cancel',function() {
			let btnD=$(this).parent().find('a[id=delBtn]');
			if(btnD.css('display')=='none') {
				btnD.css('display','');
			}
			
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
					console.log(txt);
					for(i=0;i<txt.length;i++) {
						let enter=txt[i]['content'];
						let result=replaceEnter(enter);

						let type=txt[i]['user_type'];
						let icon=Icon(type);
						
						let writer=icon+"<div><strong>"+txt[i]['writer']+"</strong></div>";
						let content="<div id='comment_box_cmt'><span>"+result+"</span></div>"
						let re_date="<span>"+txt[i]['re_date']+"</span>"
						let div1="<div id='comment_info_box'>";
						let div2="</div>"

						let btnD="<a href='#none' role='button' id='delBtn' data-value='"+txt[i]['re_id']+"'>삭제</a>";
						let btnU="<a href='#none' role='button' id='upBtn' data-value='"+txt[i]['re_id']+","+txt[i]['content']+"'>수정</a>";
						
// 						console.log(${m.user_type});
						$('#comment_div').append(writer+content);
						if(${m.userid==b.writer}) {
							$('#comment_div').append(div1+re_date+btnD+btnU+div2);
						} else if(${m.user_type==1}) {
							$('#comment_div').append(div1+re_date+btnD+div2);
						} else {
							$('#comment_div').append(div1+re_date+div2);
						}
					}
				
					$('#reCnt').empty();
					$('#reCnt').append(txt.length);
				}	
			});
		}
		
		function resize(obj) {
			obj.style.height = '1px';
			obj.style.height = obj.scrollHeight+'px';
		}
		
		function findLink(path1,path2) {
			var link=document.location.href.split('outback/');
			var link_str=link[1].split('?');
			if(link_str[0]=='getBoard') {
				document.location=path1;
			}
			if(link_str[0]=="mp_getBoard") {
				document.location=path2;
			}
		}
		
		function replaceEnter(enter) {
			if(enter.indexOf('\r\n')!=-1) {
				var enter_cmt=enter.replaceAll("\r\n","<br>");
			} else if(enter.indexOf('\n')!=-1) {
				var enter_cmt=enter.replaceAll("\n","<br>");
			} else if(enter.indexOf('\r')!=-1) {
				var enter_cmt=enter.replaceAll("\r","<br>");
			} else {
				var enter_cmt=enter;
			}
			return enter_cmt;
		}
		
		function Icon(type) {
			if(type==0) {	
				var icon='<div class="comment_icon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">';
				icon+='<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>';
				icon+='<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>';
				icon+='</svg></div>';
			}
			if(type==1) {
				var icon='<div class="comment_icon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-wrench-adjustable-circle" viewBox="0 0 16 16">';  
				icon+='<path d="M12.496 8a4.491 4.491 0 0 1-1.703 3.526L9.497 8.5l2.959-1.11c.027.2.04.403.04.61Z"/>';
				icon+='<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0Zm-1 0a7 7 0 1 0-13.202 3.249l1.988-1.657a4.5 4.5 0 0 1 7.537-4.623L7.497 6.5l1 2.5 1.333 3.11c-.56.251-1.18.39-1.833.39a4.49 4.49 0 0 1-1.592-.29L4.747 14.2A7 7 0 0 0 15 8Zm-8.295.139a.25.25 0 0 0-.288-.376l-1.5.5.159.474.808-.27-.595.894a.25.25 0 0 0 .287.376l.808-.27-.595.894a.25.25 0 0 0 .287.376l1.5-.5-.159-.474-.808.27.596-.894a.25.25 0 0 0-.288-.376l-.808.27.596-.894Z"/>';
				icon+='</svg></div>';
			}
			return icon;
		}
	</script>
</body>
</html>