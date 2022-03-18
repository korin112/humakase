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
	.book-list article{display:block; margin:2rem 11.5rem; width:70%; height:100%;}
	.booking_info_box > ul{display:table; width:100%; margin:0; padding:0; border-bottom:1px solid #ccc;}
	.booking_info_box > ul:first-child{border-top:1px solid #ddd;}	
	.booking_info_box > ul > li{width:80%; display:table-cell; padding:1.25rem 0 1.25rem 2.125rem; outline:0;}
	.booking_info_box > ul > li:first-child{width:20%; vertical-align:middle; background:#EAEAEA;}
 	.booking_info_box input{border:none;} 
	.booking_info_box li #content{width:100%; resize:none; border:1px solid #ddd; padding:0.5rem; height:300px;}
	.booking_info_box .menu_name:nth-child(n+2) {padding-top:0;}  
 	.booking_info_box .menu_name:nth-last-child(n+2) {padding-bottom:0;}
	.booking_info_box .menu_name:nth-child(n+3):nth-last-child(n+1) {margin-top:0;}
	.board_btn{text-align:right; margin-top:1.5rem; margin-right:0.5rem;}
</style>
</head>
<body>
<%@include file ="header.jsp" %>
	<div class="container O_container">
	<section class="book-list fixed">
		<article class="booking_info_box">
		<input type="hidden" id="board_id" name="board_id" value="${b.board_id}">
			<ul class="fixed">
				<li>제목</li>
				<li><input type="text" id="title" name="title" value="${b.title}" maxlength="50" placeholder="최대 50자까지 가능합니다." 
					spellcheck=false style="width:100%; border:1px solid #ddd; padding:0.5rem;"></li>
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
				<li><textarea id="content" name="content" maxlength="500" placeholder="최대 500자까지 가능합니다." spellcheck=false>${b.content}</textarea></li>
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
			<button type="button" id="update" class="btn btn-outline-secondary">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
  					<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
				</svg> 완료
			</button>
			<button type="button" id="cancel" class="btn btn-outline-secondary">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-left" viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M14.5 1.5a.5.5 0 0 1 .5.5v4.8a2.5 2.5 0 0 1-2.5 2.5H2.707l3.347 3.346a.5.5 0 0 1-.708.708l-4.2-4.2a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 8.3H12.5A1.5 1.5 0 0 0 14 6.8V2a.5.5 0 0 1 .5-.5z"/>
				</svg> 취소
			</button>
		</div>	
		</article>
	</section>
	</div>
	<%@include file ="footer.jsp" %>
	<script>
		$(document)
		.on('click','#cancel',function() {
			if(!confirm("취소하시면 이전 화면으로 돌아갑니다. 취소하시겠습니까?")) return false;
			
			var path1='/outback/getBoard?board_id='+$('#board_id').val();
			var path2='/outback/mp_getBoard?board_id='+$('#board_id').val();
			findLink(path1,path2);
		})
		.on('click','#update',function() {
			$.ajax({url:'/outback/board_update',
					data:{board_id:$('#board_id').val(),
						  title:$('#title').val(),
						  content:$('#content').val()},
					method:'POST',
					datatype:'json',
					success:function(txt) {
						console.log($('#board_id').val()+","+$('#title').val()+","+$('#content').val());
						console.log(txt);
						var link=document.location.href;
						console.log(link);
						if(txt=="ok") {
							alert('수정 완료했습니다.');
							var path1='/outback/board_list';
							var path2='/outback/mypage/myboard';
							findLink(path1,path2);
						} else {
							alert('다시 수정해주세요.');
						}
					}
			});
		})
		
		function findLink(path1,path2) {
			var link=document.location.href.split('outback/');
			var link_str=link[1].split('?');
			if(link_str[0]=='board_update') {
				document.location=path1;
			}
			if(link_str[0]=="mp_board_update") {
				document.location=path2;
			}
		}
	</script>
</body>
</html>