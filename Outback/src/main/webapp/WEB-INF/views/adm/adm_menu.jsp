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
		<div class="adm_container_wrap">
			<div class="container adm_container">
		
			<form id=frmAdmMenu action="/outback/adm/adm_menu">
		<div
			style="width: 470px; position: relative; margin: auto; margin-top: 40px; margin-bottom: 100px;">
			
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default"
					style="width: 120px;">Menu_Code</span> <input type="text"
					class="form-control" aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" id=menu_code
					name=menu_code readonly placeholder='메뉴를 선택 해주세요'>
			</div>
			<select class="form-select" aria-label="Default select example"
				id=menu_type name=menu_type size=1
				style="margin-bottom: 15px; padding: 5px 5px 5px 12px;">
				<c:forEach items="${alType}" var="Type">
					<option value="${Type.mtype_code}">${Type.mtype_name}</option>
				</c:forEach>
			</select>
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default"
					style="width: 120px;">IMG</span> <input type="text"
					class="form-control" aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" id=img name=img
					placeholder='이미지 URL을 입력해주세요'>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default"
					style="width: 120px;">MenuName</span> <input type="text"
					class="form-control" aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" id=menu_name
					name=menu_name placeholder='메뉴명을 입력해주세요'>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default"
					style="width: 120px;">Price</span> <input type="text"
					class="form-control" aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" id=menu_price
					name=menu_price placeholder='가격을 입력해주세요'>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default"
					style="width: 120px;">Comment</span> 
<!-- 								<input type="text" -->
<!-- 									class="form-control" aria-label="Sizing example input" -->
<!-- 									aria-describedby="inputGroup-sizing-default" id=comment -->
<!-- 									name=comment placeholder='설명을 입력해주세요'> -->
				<textarea class="form-control" aria-label="Sizing example input" id="comment" name="comment" placeholder='설명을 입력해주세요' spellcheck="false"></textarea>
			</div>
			<div style="float: right; margin-bottom: 15px;">
				<input type="submit" class="btn btn-secondary" value="Add">
				<button type="button" class="btn btn-secondary" id=btnDelete>Delete</button>
				<button type="reset" class="btn btn-secondary">Reset</button>
			</div>
			<div class="selectfont">
				<select class="form-select" multiple
					aria-label="multiple select example" id=getMenu size=15
					style="margin-bottom: 15px; padding: 5px 5px 5px 5px;">
					<c:forEach items="${alMenu}" var="Menu">
						<option value="${Menu.menu_code}">${Menu.menu_type},${Menu.menu_name},${Menu.menu_price}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		
	</form>
		</div>
		</div>
	</main>
</body>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document).ready(
   function() {

})
.on('submit','#frmAdmMenu',function() {
            if ($('input[name=menu_name]').val() == ''
                  || $('input[name=menu_type]').val() == ''
                  || $('input[name=img]').val() == ''
                  || $('input[name=menu_price]').val() == ''
                  || $('textarea[name=comment]').val() == '') {
               alert('모든 값이 입력 되어야 합니다.');
               return false;
            }
            return true;
         }).on('click', '#btnDelete', function() {
      let url = "/outback/adm/deleteMenu?menu_code=" + $('#menu_code').val();
      console.log(url);
      document.location = url;
      return false;
   })
   .on('click', '#getMenu option', function() {
      $('#menu_code').val($(this).val());
      let str = $(this).text();
      let ar = str.split(',');
      console.log(str);
      console.log(ar);
      
      $('input[name=menu_name]').val($.trim(ar[1]));
      $('input[name=menu_price]').val($.trim(ar[2]));
      
      $.ajax({
         url : '/outback/adm/menulist',
         data : {img:$('#menu_code').val()},
         datatype : 'json',
         method : 'post',
         success : function(txt) {
                  $('input[name=img]').val(txt[0]['img']);
                  $('textarea[name=comment]').val(txt[0]['comment']);
         }
      })

      let menu_type = $.trim(ar[0]);

      $('#menu_type').val('');
      $('#menu_type option').each(function() {
         if ($(this).val() == menu_type) {
            $(this).prop('selected', 'selected');
            return false;
         }
      });
      return false;
   })
</script>

</html>