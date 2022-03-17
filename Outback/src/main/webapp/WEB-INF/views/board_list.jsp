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
	.board_table {width:100%; border-top:1px solid #ccc; border-bottom:1px solid #ccc;  text-align:center;}
	.board_table thead {background-color:#EAEAEA;}
	.board_table .board_th_tr {border-bottom:1px solid #ccc;}
	.board_table thead tr th {padding-top:15px; padding-bottom:15px;}
	.board_table .th_num {width:3rem;}
	.board_table .th_spot {width:5rem;}
	.board_table .th_title {width:20rem;}
	.board_table .th_writer {width:10rem;}
	.board_table .th_created {width:10rem;}
 	.board_table tbody tr td {padding-top:10px; padding-bottom:10px;border-bottom:1px solid #f1f1f1;}
	.board_table tbody tr:hover td {background-color:#f1f1f1;}
	
	.board_btn_option {padding-top:20px; padding-bottom:45px;}
	
	.board_btn_option .board_search {float:left;}
	.board_search input::placeholder {color:#A6A6A6;}
	
	.board_btn_option .board_write {float:right;}
</style>
</head>
<body>
	<%@include file ="header.jsp" %>
	<div class="container O_container">
	
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
				<input type="text" id="keyword" name="keyword" spellcheck=false placeholder="검색어를 입력해주세요" value="${p.page.keyword}">
				<button id="keyBtn">검색</button>
			</div>
			<div class="board_write">
				<c:if test="${userid!=null}">
					<button  id="insert">글쓰기</button>
				</c:if>
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