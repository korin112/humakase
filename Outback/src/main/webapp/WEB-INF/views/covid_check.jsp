<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
 table{ 
 	border-collapse: collapse; 
 	border: 1px solid black; 
	text-align:center; 
	width:800px;
} 
.div1{
	width:800px;
	position:relative; 
	margin:auto;
	margin-top:40px; 
}

</style>
<body>
<%@include file ="header.jsp" %>
<div class="div1">
		<h1 style="text-align:center; font-weight:bold; font-size:26px; letter-spacing:6px;">코로나바이러스 시/도발생 현황</h1>
	<div style="text-align:center;">
	  	<input type="text" id=coviddt name=coviddt placeholder='검색할 날짜를 입력해주세요 YYYY-MM-DD' style="width:400px;">
	  	<input type="button" id=btnSearch name=btnSearch value="Search">
	</div>
			<table id=tbl >
				<thead>
					<tr>
						<th>등록일시</th>
						<th>사망자 수</th>
						<th>지역명</th> 
						<th>전일대비 증감수</th>
						<th>확진자 수</th>
						<th>지역발생 수</th>
					</tr>
				</thead>
				<tbody id=ctbody>
					
				</tbody>
			</table>
</div>	
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#btnSearch',function(){
	$('#ctbody').empty();
	$.ajax({
		url:"/outback/covidcheck",
		data:{coviddt:$("#coviddt").val()},
		method:"GET",
		dataType:"json",
		success:function(txt){
			console.log(txt);
			for(i=0; i<txt.length; i++){
				let str='<tr><td>'+txt[i]['creatdt']+'</td><td>'+
						 txt[i]['deathcnt']+'</td><td>'+
						 txt[i]['gubun']+'</td><td>'+
						 txt[i]['incdec']+'</td><td>'+
						 txt[i]['defcnt']+'</td><td>'+
						 txt[i]['localocccnt']+'</td></tr>'
				$('#ctbody').append(str);
			}
		}
	})
})
</script>
</html>