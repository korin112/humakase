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
</style>
</head>
<body>
	<%@include file ="header.jsp" %>
	<div class="container O_container">
		<table id="getBoard">
			<thead>
				<tr>
					<th>번호</th>
					<th>지점</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<c:forEach items="${b_list}" var="b">
				<tr id="board_tr">
					<td>${b.board_id}</td>
					<td>${b.spot_name}</td>
<%-- 		            <td><c:out value="${b.menu_name}"/></td> --%>
		            <td>${b.title}</td>
		            <td>${b.writer}</td>
		            <td><fmt:formatDate pattern="yy.MM.dd" value="${b.created}"/></td>
		        </tr>
			</c:forEach>
		</table>
		
		<input type="text" id="keyword" name="keyword" value="${p.page.keyword}">
		<button id="keyBtn">검색</button>
		<c:if test="${userid!=null}">
			<button id="insert">글쓰기</button>
		</c:if>	
		
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