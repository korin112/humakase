<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Home</title>	
</head>
	
</head>

<style>
	
	.body {
		padding: 0px;
		margin: 0px;
		background-color: white;
	}
	
	.video {
		width: 100%;
	}
	
	.jb-text {
		position: absolute;
		top: 50%;
		width: 100%;
	}
	
	.jb-text p {
		margin-top: -24px;
		text-align: center;
		font-size: 48px;
		color: #ffffff;
	}
	
	#Videos .MyFrame {
		position:relative;width:100%;height:100vh;min-height:700px;overflow:hidden;
		}
	#Videos .MyFrame #MyVideo {
		position:absolute;top:50%;left:50%;transform: translate(-50%,-50%);background-repeat:no-repeat;background-position:100% 100%;
		}
	#Videos .MyFrame #MyVideo {
		min-width:150%;min-height:130%;width:1000px;height:10px;object-fit:cover;background-size:cover;display:block;
		}

</style>

<body>

	<jsp:include page="header.jsp" />

	<br>
	<br>
	<br>
		<section>
			<div class="section video" id="Videos">
				<div class="MyFrame">
					<iframe 
							src="http://file2.instiz.net/data/cached_img/upload/2015022214/e9d50c1fe1a4b6c41b4aaa77c01f4fd1.gif" id="MyVideo" width="100%" height="100%" 
							frameborder="0" allowfullscreen="">
					</iframe>
				</div>
			</div>
		</section>

	<jsp:include page="footer.jsp" />

</body>
</html>
