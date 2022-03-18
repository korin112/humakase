<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>- My Board -</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<style>
	.adm_paging .page-link:hover{color:inherit;}
 	.board_table {width:100%; border-top:2px solid #ccc; border-bottom:1px solid #ccc; text-align:center;}
	.board_table thead {background-color:#f9f9f9;}
	.board_table .board_th_tr {border-bottom:2px solid #ccc;}
	.board_table thead tr th {padding:1.25rem 0;}
	.board_table .th_check {width:5%;}
	.board_table .th_num {width:10%;}
	.board_table .th_spot {width:10%;}
	.board_table .th_title {width:45%;}
	.board_table .th_writer {width:15%;}
	.board_table .th_created {width:15%;}
	
 	.board_table tbody tr td {font-size:0.875rem; padding:1rem 0.5rem; border-bottom:1px solid #eee; border-left:1px solid #eee;}
	.board_table tbody tr:nth-child(even){background:#f9f9f9;}
	.board_table tbody td:first-child{border-left:0;}
	.board_table tbody tr:hover td {background-color:#f1f1f1; cursor:pointer;}
	
	
	.board_btn_option {padding-top:1rem; padding-bottom:3rem;}
	.board_btn_option .board_search {width:25%; height:10%; border-radius:6px; border:2px solid #eee; float:right;}
	.board_btn_option .board_search input {width:85%; padding-left:1rem;  border:0; outline:0;}
	.board_btn_option .board_search input::placeholder {color:#A6A6A6;}
 	.board_btn_option .board_search .board_btn_search .bi-search{text-align:right; height:20px; width:10%; cursor:pointer;}
	
	.board_btn_option .board_delete_insert {width:10%; float:left;}
	.mybook_comment {float:right;}
</style>
</head>
<body>
	<%@include file ="../header.jsp" %>
	<div class="submenu_title_wrap">
		<div class="container submenu_title">
			<h1>MY RESERVATION</h1>
			<p>Mypage - REVIEW BOARD</p>
		</div>
	</div>
	<div class="container O_container">
		<div class="mybook_comment">
			<p>* 방문일, 지점코드순으로 정렬되어 있습니다.</p>
		</div>
		<table id="getBoard" class="board_table">
			<thead>
				<tr class="board_th_tr">
					<th class="th_check"><input type="checkbox" name="checkAll"></th>
					<th class="th_num">번호</th>
					<th class="th_spot">지점</th>
					<th class="th_title">제목</th>
					<th class="th_writer">작성자</th>
					<th class="th_created">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${b_list}" var="b">
					<tr id="board_tr" class="board_tr">
						<td><input type="checkbox" name="check" value="${board_id}"></td>
						<td>${b.board_id}</td>
						<td>${b.spot_name}</td>
			            <td>${b.title}</td>
			            <td>${b.writer}</td>
			            <td><fmt:formatDate pattern="yy.MM.dd" value="${b.created}"/></td>
			        </tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="board_btn_option"> 
			<div class="board_search">
				<input type="text" id="keyword" name="keyword" spellcheck=false placeholder="검색어를 입력해주세요." value="${p.page.keyword}">
				<span class="board_btn_search" id="keyBtn">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  						<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
					</svg>
				</span>
			</div>
		
			<div class="board_delete_insert">
				<button type="button" id="btnDelete" class="btn btn-outline-secondary">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
						<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
						<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
					</svg>
				</button>
				
				<button type="button" id="insert" class="btn btn-outline-secondary">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
  						<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
					</svg>
				</button>
			</div>
		</div>

		<div class="adm_paging">
			<nav>
				<ul class="pagination" id="pageInfo">
					<c:if test="${p.prev}">
						<li class="page-item">
							<a class="page-link" href="${p.startPage-1}">&laquo;</a>
						</li>
				    </c:if>
				            
				    <c:forEach var="num" begin="${p.startPage}" end="${p.endPage}">
						<li class="page-item <c:out value="${p.page.pageNum==num ? 'active':''}"/>">
							<a class="page-link" href="${num}">${num}</a>
						</li>
					</c:forEach>
				        	
					<c:if test="${p.next}">
				        <li class="page-item">
				        	<a class="page-link" id="page" href="${p.endPage+1}">&raquo;</a>
				        </li>
				    </c:if>  
				</ul>
			</nav>
		</div>	
		
		<form id="move" method="get">
			<input type="hidden" name="pageNum" value="${p.page.pageNum}">
	        <input type="hidden" name="amount" value="${p.page.amount}">    
	        <input type="hidden" name="keyword" value="${p.page.keyword}">    
	    </form>    
	</div>
	<%@include file ="../footer.jsp" %>
	<script>
		$(document)
		.on('click','#pageInfo a',function(e) {
			e.preventDefault();
			$('#move').find("input[name='pageNum']").val($(this).attr("href"));
			$('#move').attr("action", "");
			$('#move').submit();
		})
		.on('click','#keyBtn',function(e) {
			 e.preventDefault();
		     let val = $("input[name='keyword']").val();
		     $('#move').find("input[name='keyword']").val(val);
		     $('#move').find("input[name='pageNum']").val(1);
		     $('#move').submit();
		})
		.on('click','#insert',function() {
			document.location="/outback/mp_board_insert";
		})
		.on('click','#board_tr',function() {
			var tr=$(this);
			var td=tr.children();
			var board_id=td.eq(1).text();
			
			document.location="/outback/mp_getBoard?board_id="+board_id;
		})
		.on('click','#btnDelete',function() {
			if($('input[name=check]:checked').length==0) {
				alert('하나 이상 체크하세요.');
				return false;
			}
			let check='';
			$('input[name=check]:checked').each(function() {
				check+=$(this).val()+",";
			});
			console.log(check);
			if(!confirm("정말 삭제하시겠습니까?")) return false;
// 			$.ajax({url:'/mypage/myboard/deletMyBoard',data:{check:check},
// 					method:'POST',datatype:'json',
// 					success:function(txt) {
// 						console.log(txt);
// 						if(txt=="ok") {
// 							alert('삭제 완료.');
// 							document.location='/mypage/myboard';
// 						} else {
// 							alert('다시 삭제해주세요.');
// 						}
// 					}
// 			});
		})
	</script>
</body>
</html>