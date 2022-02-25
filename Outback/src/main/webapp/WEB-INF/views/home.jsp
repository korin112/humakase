<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<!-- header.jsp로 분할 -->
	<div class="header_wrap">
		<header>
			<h1>
				<a href="#">logo</a>
			</h1>
			<nav>
				<ul>
					<li><a href="#">menu1</a></li>
					<li><a href="#">menu2</a></li>
					<li><a href="#">menu3</a></li>
					<li><a href="#">menu4</a></li>
				</ul>
			</nav>
		</header>
	</div>
	<div class="container">
		<section class="visual"></section>
		<section class="content02"></section>
		<section class="content03"></section>
	</div>
	<div class="footer_wrap">
		<footer>
			<h3>
				<a href="#">logo</a>
			</h3>
			<div class="f_info_wrap">
				<div class="f_info_site">
					<ul>
						<li><a href="#">menu1</a></li>
						<li><a href="#">menu2</a></li>
						<li><a href="#">menu3</a></li>
						<li><a href="#">menu4</a></li>
					</ul>
				</div>
				<div class="f_info">
					<p>
						대표 : | 전화번호 : <a href="tel"></a> | 주소 :
					</p>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>
