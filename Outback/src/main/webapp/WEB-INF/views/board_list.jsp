<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type=hidden id=board_id name=board_id>
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
		<%-- <c:forEach> --%>
			<tr>
				<td><c:out value=""/></td> <%-- 번호 --%>
				<td><c:out value=""/></td> <%-- 지점 --%>
	            <td><c:out value=""/></td> <%-- 메뉴 --%>
	            <td><c:out value=""/></td> <%-- 제목 --%>
	            <td><c:out value=""/></td> <%-- 작성자 --%>
	            <td><fmt:formatDate pattern="yy/MM/dd" value=""/></td>
	        </tr>
		<%-- </c:forEach> --%>
	</table>
</body>
</html>