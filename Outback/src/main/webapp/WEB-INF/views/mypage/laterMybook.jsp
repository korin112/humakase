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
						<th><input type="checkbox" name="checkAll"></th><th>예약번호</th><th>지점이름</th>
						<th>방문인원</th><th>주문수량</th><th>주문총액</th>
						<th>방문일</th><th>방문시간</th><th>요청사항</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${mylaterbook}" var="mylaterbook">
						<tr>
							<td><input type="checkbox" name="check"></td><td class="adm_book_id">${mylaterbook.book_id}</td>
							<td>${mylaterbook.spot_name}</td><td>${mylaterbook.howmany}</td><td>${mylaterbook.m_qty}</td>
							<td><fmt:formatNumber value="${mylaterbook.total}" type="number"/> 원</td><td>${mylaterbook.vdate}</td>
							<td>${mylaterbook.time_name}</td><td><p>${mylaterbook.msg}</p></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td>
							<button type="button" id="btnDelete" class="btn btn-outline-secondary">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
									<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
									<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
								</svg>
							</button>
						</td>
						<td colspan="10"></td>
					</tr>
				</tfoot>
			</table>
			<div class="adm_paging">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<c:if test="${laterPagination.prev}">
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Previous" onClick="fn_prev('${laterPagination.page}', '${laterPagination.range}', '${laterPagination.rangeSize}')">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:if>
						<c:forEach begin="${laterPagination.startPage}" end="${laterPagination.endPage}" var="idx">
							<li class="page-item <c:out value="${laterPagination.page == idx ? 'active' : ''}"/> ">
								<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${laterPagination.range}', '${laterPagination.rangeSize}')">
									${idx}
								</a>
							</li>
						</c:forEach>
						<c:if test="${laterPagination.next}">
							<li class="page-item next">
								<a class="page-link" href="#"  aria-label="Next" onClick="fn_next('${laterPagination.range}', '${laterPagination.range}', '${laterPagination.rangeSize}')">
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