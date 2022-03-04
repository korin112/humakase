<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 타입</title>
</head>
<body>
<form id=frmType action="/outback/addType">
메뉴코드 : <input type=text name=typecode><br>
메뉴타입 : <input type=text name=typename><br>

<input type=submit value='추가'>
</form>
</body>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('submit','#frmType',function(){
	if($('input[name=mtype_code]').val()=='' ||
	   $('input[name=mtype_name]').val()==''||
		alert('모든 값이 입력 되어야 합니다.');
		return false;
	}
	return true;
})
</script>

</html>