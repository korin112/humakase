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
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<!-- <th>수정일</th> -->
			</tr>
		</thead>
		<%-- <c:forEach> --%>
			<tr>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
	            <td><c:out value=""/></td>
	            <td><fmt:formatDate pattern="yyyy/MM/dd" value=""/></td>
	            <td><fmt:formatDate pattern="yyyy/MM/dd" value=""/></td>
	        </tr>
		<%-- </c:forEach> --%>
	</table>
</body>
</html>