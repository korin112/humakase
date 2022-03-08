<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<meta charset="UTF-8">
<title>메뉴 타입 관리</title>
</head>
<body>
<%@include file="header.jsp"%>
	<form id=frmType action="/outback/addType">
	<div style="width:470px; position:relative; margin:auto; margin-top:40px;">
		<h1 style="text-align:center; font-weight:bold; font-size:40px; letter-spacing:6px;">메뉴타입 관리</h1>
      	<h2 style="text-align:center; font-weight:bold; color:#ccc; margin-bottom:30px; font-size:22px; letter-spacing:4px;">Menu Type Control</h2>
	<div class="input-group mb-3">
     	<span class="input-group-text" id="inputGroup-sizing-default" style="width:120px;">Mtype_Code</span>
     	<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
           id=mtype_code name=mtype_code readonly placeholder='타입코드를 선택해주세요'>
   </div>
   <div class="input-group mb-3">
     <span class="input-group-text" id="inputGroup-sizing-default" style="width:120px;">Mtype_Name</span>
     <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
           id=mtype_name name=mtype_name placeholder='타명을 입력해주세요'>
   </div>
   <div style="float:right; margin-bottom:15px;">
               <input type="submit" class="btn btn-secondary" value="Add">
               <button type="button" class="btn btn-secondary" id=btnDelete >Delete</button>
               <button type="reset" class="btn btn-secondary" >Reset</button>
      </div>
      <div class="selectfont">   
      <select class="form-select" multiple aria-label="multiple select example" id=getType  size=15
            style="margin-bottom:15px; padding:5px 5px 5px 5px;">
      </select>
      </div>
	</div>
	</form>
	<%@include file ="footer.jsp" %>
</body>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
	$(document)
		.ready(function() {
		$.ajax({
				url : '/outback/typelist',
				data : {},
				datatype : 'json',
				method : 'post',
				success : function(txt) {
				for (i = 0; i < txt.length; i++) {
				let str = '<option value="'+txt[i]['mtype_code']+'">'
						+ txt[i]['mtype_name']
						+ '</option>';
				console.log(str);
				$('#getType').append(str);
						}
					}
				})
			})

			.on('click', '#getType option', function() {
				console.log($(this).val() + ',' + $(this).text());
				$('#mtype_code').val($(this).val());
				let str = $(this).text();
				$('input[name=mtype_name]').val(str);
				return false;
			})
			.on(
					'click',
					'#btnDelete',
					function() {
						let url = "/outback/deleteType?mtype_code="
								+ $('#mtype_code').val();
						console.log(url);
						document.location = url;
						return false;
					})

			.on('submit', '#frmType', function() {
				if ($('input[name=mtype_name]').val() == '') {
					alert('모든 값이 입력 되어야 합니다.');
					return false;
				}
				return true;
			})
</script>
</html>