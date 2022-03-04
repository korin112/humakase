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
</style>
</head>
<body>
	<%@include file ="header.jsp" %>
	<div class="container O_container">
		
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>지점</th>
					<th>메뉴</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<c:forEach items="${b_list}" var="b">
				<tr>
					<td><c:out value="${b.board_id}"/></td>
					<td><c:out value="${b.spot_code}"/></td>
		            <td><c:out value="${b.menu_name}"/></td>
		            <td><c:out value="${b.title}"/></td>
		            <td><c:out value="${b.writer}"/></td>
		            <td><fmt:formatDate pattern="yy/MM/dd" value="${b.created}"/></td>
		        </tr>
			</c:forEach>
		</table>
		<button id="insert">글쓰기</button>	    
	</div>
	<%@include file ="footer.jsp" %>
	<script>
		$(document)
		.on('click','#insert',function() {
			document.location="/hotel/board_insert";
		})
	</script>
</body>
</html>