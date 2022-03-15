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
	.pageInfo{
		list-style : none;
	    display: inline-block;
	    margin: 50px 0 0 0;      
	}
	.pageInfo li{
		float: left;
	    margin-left: 18px;
	    padding: 7px;
 	    font-weight: 300; 
  	}
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
		<input type="text" id="keyword" name="keyword">
		<button id="keyBtn">검색</button>
		<c:if test="${userid!=null}">
			<button id="insert">글쓰기</button>
		</c:if>	
		<div>
			<ul id="pageInfo" class="pageInfo">
				<c:if test="${p.prev}">
					<li class="previous"><a href="${p.startPage-1}">◀</a></li>
			    </c:if>
			            
			    <c:forEach var="num" begin="${p.startPage}" end="${p.endPage}">
					<li class="pageInfo_btn ${p.page.pageNum==num}"><a href="${num}">${num}</a></li>
				</c:forEach>
			        	
				<c:if test="${p.next}">
			        <li class="next"><a href="${p.endPage+1}">▶</a></li>
			    </c:if>  
			</ul>
		</div>	
		
		<form id="move" method="get">
			<input type="hidden" name="pageNum" value="${p.page.pageNum}">
	        <input type="hidden" name="amount" value="${p.page.amount}">    
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
		.on('click','#keyBtn',function() {
			console.log($('#keyword').val());
			$('#getBoard').empty();
			$.ajax({url:'/outback/keyword',
				data:{keyword:$('#keyword').val()},
				method:'GET',
				datatype:'text',
				success:function(txt) {
					console.log(txt);
					let thead="<thead><tr><th>번호</th><th>지점</th><th>제목</th><th>작성자</th><th>작성일</th></tr></thead>";
					$("#getBoard").append(thead);
					for(i=0;i<txt.length;i++) {
						let id="<tr id='board_tr'><td>"+txt[i]['board_id']+"</td>"
						let title="<td>"+txt[i]['title']+"</td>"
						let spot="<td>"+txt[i]['spot_name']+"</td>"
						let writer="<td>"+txt[i]['writer']+"</td>"
						let created="<td>"+txt[i]['created']+"</td></tr>"
						
						$("#getBoard").append(id+spot+title+writer+created);
					}
				}
			})
		})
	</script>
</body>
</html>