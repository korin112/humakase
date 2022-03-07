<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<style type="text/css">
.menu{width:100%;}
.menu tfoot{font-weight:500;}
.menu thead tr, .cart tfoot tr{border-top:2px solid #ccc; border-bottom: 2px solid #ccc;}
.menu thead tr th, .cart tbody tr td, .cart tfoot tr td{padding:1.25rem 0; text-align:center;}
.menu thead tr th:first-child{width:10%;}
.menu tbody tr td > div {position:relative; display:inline-block; vertical-align:top;}
/* .menu tbody input[type=number]{width:50px; position:relative;}
.menu tbody input[type=button]{display:inline-block; position:absolute; left:0; top:0;} */
.ct_btn_wrap {text-align:right; margin-top:1.25rem;}
input {
  width:200px;
  height:50px;
  font-size:15px;
}
</style>

<meta charset="UTF-8">
<title>메뉴 관리</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="container O_container">
		<table class="menu">
		<thead><tr><th>메뉴 관리</th></tr> </thead>
		<tbody>
			<tr>
				<td><select id=getMenu style='width: 300px;' size=15>

				</select></td>
				<td>
					<form id=frmMenu action="/outback/addMenu">
						<table>
							<tr>
								<td align=right>코드 :</td>
								<td><input placeholder="목록중 하나를 선택해주세요." type=text id=menu_code name=menu_code></td>
							</tr>
							<tr>
								<td align=right>메뉴 타입 :</td>
								<td><select id=menu_type name=menu_type>
								</select></td>
							</tr>
							<tr>
								<td align=right>메뉴명 :</td>
								<td><input placeholder="메뉴명을 입력해주세요." type=text name=menu_name></td>
							</tr>
							<tr>
								<td align=right>가격 :</td>
								<td><input placeholder="가격을 입력해주세요." type=number name=menu_price></td>
							</tr>
							<tr>
								<td colspan=2 align=center><input type=submit value='추가'>
									<input type=button id=btnDelete name=btnDelete value='삭제'>
									<input type=reset value='비우기'></td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
			</tbody>
	</table>
	</div>
	<%@include file="footer.jsp"%>
</body>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
	$(document).ready(
			function() {
				$.ajax({
					url : '/outback/menulist',
					data : {},
					datatype : 'json',
					method : 'post',
					success : function(txt) {
						for (i = 0; i < txt.length; i++) {
							let str = '<option value='+txt[i]['menu_code']+'>'
									+ txt[i]['menu_type'] + ', '
									+ txt[i]['menu_name'] + ','
									+ txt[i]['menu_price'] + '</option>';
							console.log(str);
							$('#getMenu').append(str);
						}
					}
				});
				$.ajax({
					url : '/outback/typelist',
					data : {},
					datatype : 'json',
					method : 'post',
					success : function(txt) {
						for (i = 0; i < txt.length; i++) {
							let str = '<option value='+txt[i]['mtype_code']+'>'
									+ txt[i]['mtype_name'] + '</option>';
							console.log(str);
							$('#menu_type').append(str);
						}
					}
				})
			}).on(
			'submit',
			'#frmMenu',
			function() {
				if ($('input[name=menu_name]').val() == ''
						|| $('input[name=menu_type]').val() == ''
						|| $('input[name=menu_price]').val() == '') {
					alert('모든 값이 입력 되어야 합니다.');
					return false;
				}
				return true;
			}).on('click', '#btnDelete', function() {
		let url = "/outback/deleteMenu?menu_code=" + $('#menu_code').val();
		console.log(url);
		document.location = url;
		return false;
	}).on('click', '#getMenu option', function() {
		$('#menu_code').val($(this).val());
		let str = $(this).text();
		let ar = str.split(',');
		console.log(str);
		console.log(ar);
		/* let menu_type=$('input[name=menu_type]').val($.trim(ar[0])); */
		$('input[name=menu_name]').val($.trim(ar[1]));
		$('input[name=menu_price]').val($.trim(ar[2]));

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