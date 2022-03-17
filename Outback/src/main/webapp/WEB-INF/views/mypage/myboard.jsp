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
	<%@include file ="../footer.jsp" %>
</body>
</html>