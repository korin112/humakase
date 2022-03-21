<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${path}/resources/css/sidebars.css">
<link rel="stylesheet" href="${path}/resources/css/style.css">
<style>
	.board_btn_option {padding-top:1rem; padding-bottom:3rem;}
	.board_btn_option .board_search {width:25%; height:10%; border-radius:6px; border:2px solid #eee; float:right;}
	.board_btn_option .board_search input {width:85%; padding-left:1rem;  border:0; outline:0;}
	.board_btn_option .board_search .board_btn_search .bi-search{text-align:right; height:20px; width:10%; cursor:pointer;}
	.board_btn_option .board_delete {width:20%; float:left;}
</style>
<title>관리자 페이지 - 리뷰관리</title>
</head>
	<main class="adm_main">
		<%@include file ="admin_header.jsp" %>	
		<div class="adm_container_wrap">
			<div class="container adm_container">
				<div class="adm_comment">
					<p>* 작성일순으로 정렬되어 있습니다.</p>
				</div>
				<table id="getBoard" class="adm_book_table">
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
								<td class="td_check"><input type="checkbox" name="check" value="${b.board_id}"></td>
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
				
					<div class="board_delete">
						<button type="button" id="btnDelete" class="btn btn-outline-secondary">
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
								<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
								<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
							</svg>
						</button>
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
		</div>
	</main>
	<script>
	$(document)
	.ready(function() {
		$("input[name=checkAll]").click(function() {
			if($("input[name=checkAll]").is(":checked")) $("input[name=check]").prop("checked", true);
			else $("input[name=check]").prop("checked", false);
		});
		
		$("input[name=check]").click(function() {
			var total = $("input[name=check]").length;
			var checked = $("input[name=check]:checked").length;
			
			if(total != checked) $("input[name=checkAll]").prop("checked", false);
			else $("input[name=checkAll]").prop("checked", true); 
		});
	})
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
	.on('click', '.board_tr td:nth-child(n+2)', function() {
		console.log($(this).parent().children().eq(1).text());
//			console.log("★" + $(this).siblings('td:nth-child(n)').text());
		
		var board_id=$(this).parent().children().eq(1).text();
		document.location="/outback/adm_getBoard?board_id="+board_id;
	})
	.on('click','#btnDelete',function() {
		if($('input[name=check]:checked').length==0) {
			alert('하나 이상 체크하세요.');
			return false;
		}
		
		let check_str='';
		$('input[name=check]:checked').each(function() {
			check_str+=","+$(this).val();
		});
		let check=check_str.replace(',','');
		console.log(check);
		console.log(typeof(check));
		
		if(!confirm("정말 삭제하시겠습니까?")) return false;
		
		$.ajax({url:'/outback/adm/adm_board_delete',data:{check:check},
				method:'POST',datatype:'json',
				success:function(txt) {
					console.log(txt);
					if(txt=="ok") {
						alert('삭제 완료했습니다.');
						document.location='/outback/adm/adm_board';
					} else {
						alert('다시 삭제해주세요.');
					}
				}
		});
	})
	</script>
</body>
</html>