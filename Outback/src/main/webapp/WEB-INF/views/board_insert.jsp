<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	        <%-- 작성자(member table userid) session --%>
	        <input type=text name="writer" id="writer">
	    </div>
	    <div>
	        <label>날짜</label>
	        <%-- booking table vdate --%>
<!-- 	        <select name="vdate"></select> -->
			<input type=text name="vdate" id="vdate">
	    </div>
	    <div>
	        <label>지점</label>
	        <%-- booking table spot code, spot name --%>
	        <select id="spot" name="spot"></select>
	    </div>
	    <div>
	        <label>메뉴</label>
	        <%-- booking table menu code, menu name --%>
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
			$.ajax({url:'/outback/spotList',
				data:{},
				method:'GET',
				datatype:'json',
				success:function(txt) {
					console.log(txt);
					for(i=0;i<txt.length;i++) {
						let str='<option value='+txt[i]['spot_code']+'>'
									+txt[i]['spot_name']+'</option>';
						$('#spot').append(str);
					}
				}
			});
			
			$.ajax({url:'/outback/menuList',
					data:{},
					method:'GET',
					datatype:'json',
					success:function(txt) {
						console.log(txt);
						for(i=0;i<txt.length;i++) {
							let str='<option value='+txt[i]['menu_code']+'>'
										+txt[i]['menu_name']+'</option>';
							$('#menu').append(str);
						}
					}
			});
		})
		
		.on('click','#done',function() {			
			let oParam = {title:$('#title').val(), writer:$('#writer').val(),
						  vdate:$('#vdate').val(), spot:$('#spot').val(),
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
	</script>
</body>
</html>