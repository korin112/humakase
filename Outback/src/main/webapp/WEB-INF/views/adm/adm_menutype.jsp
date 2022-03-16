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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${path}/resources/css/sidebars.css">
<link rel="stylesheet" href="${path}/resources/css/style.css">
<script src="${path}/resources/js/admin.js"></script>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<main class="adm_main">
		<%@include file ="admin_header.jsp" %>
		<div class="container">
			<form id=frmMenu action="/outback/adm/adm_menutype">
		<div style="width:470px; position:relative; margin:auto; margin-top:40px; margin-bottom:100px;">
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
      <select class="form-select" multiple aria-label="multiple select example" id=getType  size=10
            style="margin-bottom:15px; padding:5px 5px 5px 5px;">
      </select>
      </div>
	</div>
	</form>
		</div>
	</main>
</body>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
	$(document)
		.ready(function() {
		$.ajax({
				url : '/outback/adm/typelist',
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
						let url = "/outback/adm/deleteType?mtype_code="
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