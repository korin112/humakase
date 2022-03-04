<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 타입</title>
</head>
<body>
	<table>
		<tr>
			<td><select id=getType style='width: 300px;' size=15>

			</select></td>
			<td>
				<form id=frmType action="/outback/addType">
					<table>
						<tr>
							<td align=right>코드 :</td>
							<td><input type=text id=mtype_code name=mtype_code></td>
						</tr>
						<tr>
							<td align=right>코드명 :</td>
							<td><input type=text name=menu_name></td>
						</tr>
						<tr>
							<td colspan=2 align=center><input type=submit value='추가'>
								<input type=button id=btnDelete name=btnDelete value=삭제>
								<input type=reset value=비우기></td>
						</tr>
					</table>
				</form>
	</table>
</body>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
	$(document)
	.ready(function(){
		$.ajax({
			url:'/outback/typelist',
			data:{},
			datatype:'json',
			method:'post',
			success:function(txt){
				for(i=0; i < txt.length; i++){
		            let str='<option value="'+txt[i]['mtype_code']+'">'+txt[i]['mtype_name']+'</option>';
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
		$('input[name=mtype_code]').val(str);
		$('input[name=mtype_name]').val(str);
		return false;
	})
	.on('click', '#btnDelete', function() {
		let url = "/outback/deleteType?mtype_code=" + $('#mtype_code').val();
		console.log(url);
		document.location = url;
		return false;
	})

	.on('submit','#frmType',function() {
 				if ($('input[name=mtype_name]').val() == ''
 						) { 
 					alert('모든 값이 입력 되어야 합니다.');
 					return false;
 				}
 				return true;
 			})
</script>
</html>