<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

</style>

<meta charset="UTF-8">
<title>메뉴 관리</title>
</head>
<body>
	<table>
		<tr>
			<td><select id=getMenu style='width: 300px;' size=15>

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
					let str='<option value='+txt[i]['mtype_code']+'>'+txt[i]['mtype_name']+'</option>';
		            console.log(str);
		            $('#menu_type').append(str);
				}
			}
		})
	})
 	.on('submit','#frmMenu',function() {
 				if ($('input[name=menu_name]').val() == ''
 						|| $('input[name=menu_type]').val() == ''
 						|| $('input[name=menu_price]').val() == ''
 						) { 
 					alert('모든 값이 입력 되어야 합니다.');
 					return false;
 				}
 				return true;
 			})
 	.on('click','#btnDelete',function(){
    let url="/outback/deleteMenu?menu_code="+$('#menu_code').val();
    console.log(url);
    document.location=url;
    return false;
 }) 
 .on('click','#getMenu option',function(){ 
 	   $('#menu_code').val($(this).val());
 	   let str=$(this).text();
 	   let ar=str.split(',');
 	   console.log(str);
 	   console.log(ar);
 	   /* let menu_type=$('input[name=menu_type]').val($.trim(ar[0])); */
  	   $('input[name=menu_name]').val($.trim(ar[1]));
 	   $('input[name=menu_price]').val($.trim(ar[2]));
 	   
 	   let menu_type=$.trim(ar[0]);
 	   
 	   $('#menu_type').val('');
 	   $('#menu_type option').each(function(){
 		   if($(this).val()==menu_type){
 			   $(this).prop('selected','selected');
 			   return false;
 		   }
 	   });
    return false;
 })
 
</script>

</html>