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
</head>
<body>
	<%@include file ="header.jsp" %>
	<div class="container O_container">
	    <div>
	        <label>제목</label>
	        <input name="title" id="title">
	    </div>
	    <div>
	        <label>작성자</label>
	        <input type=text name="writer" id="writer" value="${userid}">
	    </div>
	    <div>
	        <label>날짜</label>
	     	<select name="vdate" id="vdate">
	     		<c:forEach items="${date}" var="d">
					<option value='${d.book_id},${d.vdate}'>${d.vdate}</option>
				</c:forEach>
			</select>	
	    </div>
	    <div>
	        <label>지점</label>
	        <select id="spot" name="spot"></select>
	    </div>
	    <div>
	        <label>메뉴</label>
	        <select id="menu" name="menu"></select>
	    </div>
	    <div>
	        <label>내용</label>
	        <textarea rows="5" id="content" name="content"></textarea>
	    </div>
	    <br>
	    <div>
		    <button id="done">완료</button>
		    <button id="cancel">취소</button>
	    </div>
	</div>
	<%@include file ="footer.jsp" %>
	<script>
		$(document)
		.ready(function() {
			let option='spot';
			optionList(option);
			
			option='menu';
			optionList(option);
		})
		.on('click','#vdate',function() {
			let option='spot';
			optionList(option);
			
			option='menu';
			optionList(option);
		})
		.on('click','#done',function() {
			let vdate=$('#vdate').val();
			let ar=vdate.split(',');
			
			let oParam = {title:$('#title').val(), writer:$('#writer').val(),
						  vdate:ar[1], spot:$('#spot').val(),
						  menu:$('#menu').val(), content:$('#content').val()};
			$.ajax({url:'/outback/board_insert',
				data:oParam,
				method:'POST',
				datatype:'json',
				success:function(txt) {
					if(txt=="ok") {
						alert('작성 완료했습니다.');
						document.location='/outback/board_list';
					} else {
						alert('다시 작성해주세요.');
					}
				}
			});
		})
		
		.on('click','#cancel',function() {
			if(!confirm("취소하시면 작성한 모든 내용이 사라집니다. 취소하시겠습니까?")) return false;
			document.location="/outback/board_list";
		})
		
		function optionList(option) {
			let vdate=$('#vdate').val();
			let ar=vdate.split(',');
			
			$('#'+option).empty();
			$.ajax({url:'/outback/'+option+'List',
				data:{booker:$('#writer').val(),
					  vdate:ar[1],
					  book_id:ar[0]},
				method:'GET',
				datatype:'json',
				success:function(txt) {
					console.log(txt);
					for(i=0;i<txt.length;i++) {
						let str='<option value='+txt[i][option+'_code']+'>'
									+txt[i][option+'_name']+'</option>';
						$('#'+option).append(str);
					}
				}
			});
		}
	</script>
</body>
</html>