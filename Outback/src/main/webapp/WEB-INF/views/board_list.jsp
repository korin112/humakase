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
	.adm_paging .page-link:hover{color:inherit;}
 	.board_table {width:100%; border-top:2px solid #ccc; border-bottom:1px solid #ccc; text-align:center;}
	.board_table thead {background-color:#f9f9f9;}
	.board_table .board_th_tr {border-bottom:2px solid #ccc;}
	.board_table thead tr th {padding:1.25rem 0;}
	.board_table .th_num {width:10%;}
	.board_table .th_spot {width:10%;}
	.board_table .th_title {width:50%;}
	.board_table .th_writer {width:15%;}
	.board_table .th_created {width:15%;}
	
 	.board_table tbody tr td {font-size:0.875rem; padding:1rem 0.5rem; border-bottom:1px solid #eee;}
/*  	.board_table tbody tr:nth-child(even){background:#f9f9f9;} */
	.board_table tbody td:first-child{border-left:0;}
	.board_table tbody tr:hover td {background-color:#f1f1f1; cursor:pointer;}
	
	
	.board_btn_option {padding-top:1rem; padding-bottom:3rem;}
	.board_btn_option .board_search {width:25%; height:10%; border-radius:6px; border:2px solid #eee; float:right;}
	.board_btn_option .board_search input {width:85%; padding-left:1rem; border:0; outline:0;}
	.board_btn_option .board_search input::placeholder {color:#A6A6A6;}
 	.board_btn_option .board_search .board_btn_search .bi-search{text-align:right; height:20px; width:10%; cursor:pointer;}
	
 	.board_write {padding-bottom:1rem; float:right;} 
</style>
</head>
<body>
	<%@include file ="header.jsp" %>
	<div class="container O_container">
		<div class="board_write">
			<c:if test="${userid!=null}">
				<div class="board_btn_write" id="insert">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
	  					<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
	  					<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
					</svg>
					<strong>글쓰기</strong>
				</div>
			</c:if>
		</div>
		<table id="getBoard" class="board_table">
			<thead>
				<tr class="board_th_tr">
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
						<td>${b.board_id}</td>
						<td>${b.spot_name}</td>
						<%-- <td><c:out value="${b.menu_name}"/></td> --%>
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
	<%@include file ="footer.jsp" %>
	<script>
		$(document)
		.ready(function() {
			let result="${result}";
			if(result=="delete") {
				alert("삭제 완료했습니다.");
			}
		})
		.on('click','#insert',function() {
			document.location="/outback/board_insert";
		})
		.on('click','#board_tr',function() {
			var tr=$(this);
			var td=tr.children();
			var board_id=td.eq(0).text();
			
			//console.log(board_id);
			
			document.location="/outback/getBoard?board_id="+board_id;
		})
		
		// 페이지 이동
		.on('click','#pageInfo a',function(e) {
			e.preventDefault();
			$('#move').find("input[name='pageNum']").val($(this).attr("href"));
			$('#move').attr("action", "/outback/board_list");
			$('#move').submit();
		})
		
		// 검색
		.on('click','#keyBtn',function(e) {
			 e.preventDefault();
		     let val = $("input[name='keyword']").val();
		     $('#move').find("input[name='keyword']").val(val);
		     $('#move').find("input[name='pageNum']").val(1);
		     $('#move').submit();
		})
	</script>
</body>
</html>