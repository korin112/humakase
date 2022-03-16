<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

		<div>
			<div class="adm_comment">
				<p>* 방문일, 방문시간, 지점코드순으로 정렬되어 있습니다.</p>
			</div>
			<table class="adm_book_table">
				<thead>
					<tr>
						<th>예약번호</th><th>지점이름</th>
						<th>방문인원</th><th>주문수량</th><th>주문총액</th>
						<th>방문일</th><th>방문시간</th><th>요청사항</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${myPrevbook}" var="myPrevbook">
						<tr>
							<td class="adm_book_id">${myPrevbook.book_id}</td>
							<td>${myPrevbook.spot_name}</td><td>${myPrevbook.howmany}</td><td>${myPrevbook.m_qty}</td>
							<td><fmt:formatNumber value="${myPrevbook.total}" type="number"/> 원</td><td>${myPrevbook.vdate}</td>
							<td>${myPrevbook.time_name}</td><td><p>${myPrevbook.msg}</p></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot><tr><td></td></tr></tfoot>
			</table>
			<div class="adm_paging">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<c:if test="${prevPagination.prev}">
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Previous" onClick="fn_prev('${prevPagination.page}', '${prevPagination.range}', '${prevPagination.rangeSize}')">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:if>
						<c:forEach begin="${prevPagination.startPage}" end="${prevPagination.endPage}" var="idx">
							<li class="page-item <c:out value="${prevPagination.page == idx ? 'active' : ''}"/> ">
								<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${prevPagination.range}', '${prevPagination.rangeSize}')">
									${idx}
								</a>
							</li>
						</c:forEach>
						<c:if test="${prevPagination.next}">
							<li class="page-item next">
								<a class="page-link" href="#"  aria-label="Next" onClick="fn_next('${prevPagination.range}', '${prevPagination.range}', '${prevPagination.rangeSize}')">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
				<!-- Modal -->
		<div class="modal" tabindex="-1" id="admBookModal">
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
						<table class="adm_bd_table">
							<thead>
								<tr><th>메뉴이름</th><th>수량</th><th>가격</th><th>총액</th></tr>
							</thead>
							<tbody>
								<!-- ajax 호출 -->
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>