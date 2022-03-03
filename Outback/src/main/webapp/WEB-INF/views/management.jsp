<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Management</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/style.css">

</head>
<style>
body {
	background:white;
}
table {
	border
}
.room{		
            float: left;
/*             border: 2px solid blue; */
            width: 100%;
            height: 50%;
            text-align: center;
            line-height: 30px;
            font-weight: bold;
            align: center;
 }
.type,.menucontrol{

	width:80%;
	height: 50%;
	margin:auto;
	line-height: 80px;
	border: 1px solid white;
}

</style>
<body>
<div  style="text-align:center;">
<h1 style="align:center;">메뉴 관리</h1>
</div>
<hr>
<br><br>

<br><br>
<div  id=divmenu class='menu' >
	<table class='menucontrol'  align=center>
	<tr>
		<td>
			<select id=selMenu style='width:300px;' size=25>
			</select>
		</td>
		<td>
			<form id=frmMenu action="/outback/addMenu">
			
				<table style="width:400px;" class='menucontrol'>
				<tr><td align=right>메뉴 코드 : </td><td><input placeholder="목록중 하나를 선택!" type=text id=menu_code name=menu_code></td></tr>
				<tr><td align=right>메뉴 이름 :</td>
					<td><input placeholder="목록중 하나를 선택!" type=text name=menu_name></td>
				</tr>
				<tr><td align=right>타입:</td>
					<td>
					<select id=menu_type name=menu_type>
					</select>
					</td>
				</tr>
				<tr><td align=right>가격 :</td>
					<td><input placeholder="목록중 하나를 선택!" type=number name=menu_price></td>
				</tr>
				<tr><td colspan=2 align=center>
					<input type=submit value='확인'>
					<input type=reset value='초기화'>
					<input type=button value='삭제' id=btnMenuDelete></td>
				</tr>
				</table>
			</form>
		</td>
	</tr>
	</table>
</div>


</body>

<script>
$(document)
.ready(function(){
	MenuList();
	MenuList('#menulist');
	MenuList('#MenuList');
	
})
.on('click','#selMenu option',function(){
	console.log($(this).val()+','+$(this).text());
	$('#menu_code').val($(this).val());
	let str=$(this).text();
	let ar=str.split(',');
	$('input[name=menu_name]').val(ar[0]);
	let roomtype=$.trim(ar[1]);
	$('input[name=menu_price]').val(ar[2]);
	$('#menu_type').val('');
	$('#menu_type option').each(function(){
		if($(this).text()==menu_type){
			$(this).prop('selected',true);
			return false;
		}
	})	
	
	return false;
})

.on('click','#btnMenuDelete',function(){
	let url="/outback/deleteMenu?menu_code="+$('#menu_code').val();
	console.log(url);
	document.location=url;
	return false;
})

function MenuList(){
	$('#selMenu').empty();
	$.ajax({url:"/outback/MenuList",
		data:{},
		datatype:'json',
		method:"GET",
		success:function(txt){
			for(i=0;i<txt.length;i++){
				let str='<option value='+txt[i]['menu_code']+'>'+txt[i]['menu_name']+','+txt[i]['menu_type']+','+txt[i]['menu_price']+'</option>';
				$('#selMenu').append(str);
			}
		}
		
	});
	
};

}

</script>
</html>