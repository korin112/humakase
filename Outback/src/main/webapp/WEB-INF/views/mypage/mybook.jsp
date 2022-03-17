<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>- My Reservation -</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/modals.css">
<link rel="stylesheet" href="${path}/resources/css/style.css">
<script src="${path}/resources/js/mypage.js"></script>
<style>
	.mybook_tt{display:flex; margin:0 auto 3rem; padding:0; justify-content:center;}
	.mybook_tt li{border:1px solid #ccc; width:50%;}
	.mybook_tt li:first-child{border-right:0;}
	.mybook_tt a{color:inherit;font-weight:700; display:block; padding:1rem 1.25rem;}
	.mybook_tt a:hover{color:#c93535;}
	.mybook_tt li.active{border-color:#c93535;}
	.mybook_tt li.active a{background:#c93535; color:#fff;}
	.mybook_ct ul{padding:0;}
	.mybook_ct > ul > li{display:none;}
	.mybook_ct > ul > li.on{display:block;}
	.modal-footer.mybook-modal-footer{justify-content:space-between;}
</style>
</head>
<body>
	<%@include file ="../header.jsp" %>
	<div class="submenu_title_wrap">
		<div class="container submenu_title">
			<h1>MY RESERVATION</h1>
			<p>Mypage - RESERVATION</p>
		</div>
	</div>
	<div class="container O_container">
		<div>
			<ul class="mybook_tt">
				<li><a href="/outback/mypage/mybook/later">예정된 예약내역</a></li>
				<li><a href="/outback/mypage/mybook/prev">지난 예약내역</a></li>
			</ul>
		</div>
		<div class="mybook_ct">
			<div>
				<div class="adm_comment mybook_comment">
					<p>* 방문일, 방문시간, 지점코드순으로 정렬되어 있습니다.</p>
				</div>
				<table class="adm_book_table mybook_table">
					<thead>
						<tr>
							<th>예약번호</th><th>지점이름</th>
							<th>방문인원</th><th>주문수량</th><th>주문총액</th>
							<th>방문일</th><th>방문시간</th><th>요청사항</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${mybook}" var="mybook">
							<tr>
								<td class="mybook_id">${mybook.book_id}</td>
								<td>${mybook.spot_name}</td><td>${mybook.howmany}</td><td>${mybook.m_qty}</td>
								<td><fmt:formatNumber value="${mybook.total}" type="number"/> 원</td><td>${mybook.vdate}</td>
								<td>${mybook.time_name}</td><td><p>${mybook.msg}</p></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot><tr><td></td></tr></tfoot>
				</table>
				<div class="adm_paging">
					<nav aria-label="Page navigation">
						<ul class="pagination">
							<c:if test="${pagination.prev}">
								<li class="page-item">
									<a class="page-link" href="#" aria-label="Previous" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
							<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
								<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
									<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
										${idx}
									</a>
								</li>
							</c:forEach>
							<c:if test="${pagination.next}">
								<li class="page-item next">
									<a class="page-link" href="#"  aria-label="Next" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
					<!-- Modal -->
			<div class="modal" tabindex="-1" id="myBookModal">
				<div class="modal-dialog modal-xl modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Modal title</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="bd_info">
								<div class="book_msg">
									<h4>고객요청사항</h4>
									<p></p>
								</div>
							</div>
							<table class="bd_table">
								<thead>
									<tr><th>메뉴이름</th><th>수량</th><th>가격</th><th>총액</th></tr>
								</thead>
								<tbody>
									<!-- ajax 호출 -->
								</tbody>
							</table>
						</div>
						<div class="modal-footer mybook-modal-footer">
							<button type="button" id="btnDelete" class="btn btn-outline-secondary">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
									<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"></path>
									<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"></path>
								</svg>
							</button>
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file ="../footer.jsp" %>
		<script>
		// 공통
		function all_paging(page, range, rangeSize){
			var url = window.location.pathname;
			url = url + "?range=" + range + "&page=" + page;
			location.href = url;
		}
		//이전 버튼 이벤트
		function fn_prev(page, range, rangeSize) {
			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;
			all_paging(page, range, rangeSize);
		}
		//페이지 번호 클릭
		function fn_pagination(page, range, rangeSize, searchType, keyword) {
			all_paging(page, range, rangeSize);
		}
		//다음 버튼 이벤트
		function fn_next(page, range, rangeSize) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			all_paging(page, range, rangeSize);
		}
		

	</script>
</body>
</html>