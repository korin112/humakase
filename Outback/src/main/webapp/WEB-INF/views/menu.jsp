<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식 종류</title>
</head>
<style>
table {border-collapse:collapse}
th,td {border:1px solid black;}
</style>
<body>
<table>
<thead>
	<tr><th>메뉴코드</th><th>메뉴이름</th><th>메뉴타입</th>
		<th>가격</th></tr>
</thead>
<c:forEach items="${alMenu}" var="menu">
	<tr>
		<td>${menu.menu_code}</td>
		<td>${menu.menu_type}</td>
		<td>${menu.menu_name}</td>
		<td>${menu.menu_price}</td>
	</tr>
</c:forEach>
</table>
</body>
</html>