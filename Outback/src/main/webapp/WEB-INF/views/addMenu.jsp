<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
h1{text-align:center;
   font-color:white;
   font-size: 30px;
   font-family: Segoe Print;}
</style>
<meta charset="UTF-8">
<title>메뉴 관</title>
</head>
<body>
	<table>
		<tr>
			<td><select id=getMenu style='width: 200px;' size=10>
			</select></td>
			<td>
				<form id=frmMenu action="/outback/addMenu">
					<table>
					<tr><td align=right>코드 : </td>
						<td><input type=text id=menu_code name=menu_code></td></tr>
						<tr>
							<td align=right>메뉴 타입 : </td>
								<td><select id=menu_type name=menu_type>									
								</select>
							</td>
						</tr>
						<tr>
							<td align=right>메뉴명 :</td>
							<td><input type=text name=menu_name></td>
						</tr>
						<tr>
							<td align=right>가격 :</td>
							<td><input type=number name=menu_price></td>
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
			url:'/outback/menulist',
			data:{},
			datatype:'json',
			method:'post',
			success:function(txt){
				for(i=0; i < txt.length; i++){
		            let str='<option value='+txt[i]['menu_code']+'>'+txt[i]['menu_type']+', '+
		            txt[i]['menu_name']+','+txt[i]['menu_price']+'</option>' ;
		            console.log(str);
		            $('#getMenu').append(str);
				}
			}
		});
		$.ajax({
			url:'/outback/typelist',
			data:{},
			datatype:'json',
			method:'post',
			success:function(txt){
				for(i=0; i < txt.length; i++){
					let str='<option>'+txt[i]['mtype_name']+'</option>';
		            console.log(str);
		            $('#menutype').append(str);
				}
			}
		});
	})

</script>

</html>