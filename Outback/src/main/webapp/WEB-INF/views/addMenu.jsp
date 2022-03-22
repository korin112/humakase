<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메뉴 관리</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<form id=frmMenu action="/outback/addMenu">
		<div
			style="width: 470px; position: relative; margin: auto; margin-top: 40px; margin-bottom: 100px;">
			<h1
				style="text-align: center; font-weight: bold; font-size: 40px; letter-spacing: 6px;">메뉴
				관리</h1>
			<h2
				style="text-align: center; font-weight: bold; color: #ccc; margin-bottom: 30px; font-size: 22px; letter-spacing: 4px;">Menu
				Control</h2>
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
					<input type="text"
					class="form-control" aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" id=comment
					name=comment placeholder='설명을 입력해주세요'>
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
	<%@include file="footer.jsp"%>
</body>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document).ready(
   function() {
      
//       $.ajax({
//          url : '/outback/menulist',
//          data : {},
//          datatype : 'json',
//          method : 'post',
//          success : function(txt) {
//             for (i = 0; i < txt.length; i++) {
//                let str = '<option value='+txt[i]['menu_code']+'>'
//                      + txt[i]['menu_type'] + ', '
//                      + txt[i]['img'] + ','
//                      + txt[i]['menu_name'] + ','
//                      + txt[i]['menu_price'] + ','
//                      + txt[i]['comment']+'</option>';
//                console.log(str);
//                $('#getMenu').append(str);
//             }
//          }
//       });
//       $.ajax({
//          url : '/outback/typelist',
//          data : {},
//          datatype : 'json',
//          method : 'post',
//          success : function(txt) {
//             for (i = 0; i < txt.length; i++) {
//                let str = '<option value='+txt[i]['mtype_code']+'>'
//                      + txt[i]['mtype_name'] + '</option>';
//                console.log(str);
//                $('#menu_type').append(str);
//             }
//          }
//       })
})
.on('submit','#frmMenu',function() { // 클릭시 메뉴 추가 및 업데이트
            if ($('input[name=menu_name]').val() == ''
                  || $('input[name=menu_type]').val() == ''
                  || $('input[name=img]').val() == ''
                  || $('input[name=menu_price]').val() == ''
                  || $('input[name=comment]').val() == '') {
               alert('모든 값이 입력 되어야 합니다.');
               return false;
            }
            return true;
         }).on('click', '#btnDelete', function() { // 메뉴 삭제
      let url = "/outback/deleteMenu?menu_code=" + $('#menu_code').val();
      console.log(url);
      document.location = url;
      return false;
   })
   .on('click', '#getMenu option', function() { // 메뉴 클릭시 옵션 출
      $('#menu_code').val($(this).val());
      let str = $(this).text();
      let ar = str.split(',');
      console.log(str);
      console.log(ar);
      /* let menu_type=$('input[name=menu_type]').val($.trim(ar[0])); */
      $('input[name=menu_name]').val($.trim(ar[1]));
      $('input[name=menu_price]').val($.trim(ar[2]));
      
      $.ajax({ // 메뉴 이미지 및 설명 출력
         url : '/outback/menulist',
         data : {img:$('#menu_code').val()},
         datatype : 'json',
         method : 'post',
         success : function(txt) {
                  $('input[name=img]').val(txt[0]['img']);
                  $('input[name=comment]').val(txt[0]['comment']);
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