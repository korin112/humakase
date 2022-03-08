<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>  - 마이 페이지 -  </title>
</head>
<style>
table {
	border-collapse:collapse;
}
tr,td,th{
	box-sizing:border-box;
	border:1px solid #ddd;
}
</style>
<body>
<form action="/outback/pwCheck" method="POST" id="deleteForm" name="deleteForm">
<%--                        <input type="hidden" id="userId" name="userId" value="${userid}"> --%>
    <div class="col-sm-8 col-sm-offset-2">
        <div class="panel panel-default panel-margin-10">
            <div class="panel-body panel-body-content text-center">
                <p class="lead">회원탈퇴를 하려면 비밀번호를 입력해주세요.</p>
                <div class="form-group">
                    <input type="password" id = "passcode" name="passcode" class="form-control form-control-inline text-center" placeholder="비밀번호" />
                </div>
                <div class="form-group">
                    <input type="password" id="passcode1" name="passcode1"  class="form-control form-control-inline text-center" placeholder="비밀번호 확인" />
                </div>
                <button type="button" id="btnDel" name="btnDel" class="btn btn-primary">회원탈퇴</button> <a href="/outback/home" class="btn btn-default">취소</a>
            </div>
        </div>
    </div>
    </form>
<!-- <table id=tbl> -->
<!-- <div> -->
<!-- 	<section> -->
<!-- 		<article> -->
<!-- 			<ul> -->
<!-- 				<li>아이디</li> -->
<!-- 				<li><input type=text name=userid id=userid></li> -->
<!-- 			</ul> -->
<!-- 			<ul> -->
<!-- 				<li>비밀번호</li> -->
<!-- 				<li><input type=text name=passcode id=passcode></li> -->
<!-- 			</ul> -->
<!-- 			<ul> -->
<!-- 				<li>이름</li> -->
<!-- 				<li><input type=text name=name id=name></li> -->
<!-- 			</ul> -->
<!-- 			<ul> -->
<!-- 				<li>모바일번호</li> -->
<!-- 				<li><input type=text name=mobile id=mobile></li> -->
<!-- 			</ul> -->
<!-- 			<ul> -->
<!-- 				<li><input type=button nama=btn id=btn value=정보수정 data-userid=${userid}></li> -->
<!-- 			</ul> -->
<!-- 		</article> -->
<!-- 	</section> -->
<!-- </div> -->
<!-- </table> -->
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript">
$(document)
.on('click','#btnDel',function(){
		if($("#passcode").val()==""){
			alert("비밀번호를 입력해주세요");
			return false;
		}
		
		if($("#passcode1").val()==""){
			alert("비밀번호 확인을 입력해주세요");
			return false;
		}
		
		if ($("#passcode").val() != $("#passcode1").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
			}
		$.ajax({
			url : "/outback/pwCheck",
			type : "POST",
			dataType : "text",
			data : {passcode:$('#passcode').val()},
			success: function(){
			}
		})
});

// $(document)
// .ready(function(){
// 	member();
// })
// function member(){
// 	$.ajax({url:'/outback/infomation',
// 			data:{},
// 			dataType:'json',
// 			method:'GET',
// 			success:function(txt){
// 				let userid = txt[0]['userid'];
// 				let passcode = txt[0]['passcode'];
// 				let name = txt[0]['name'];
// 				let mobile = txt[0]['mobile'];
				
// 				$('#userid').val(userid);
// 				$('#passcode').val(passcode);
// 				$('#name').val(name);
// 				$('#mobile').val(mobile);
				
// 			}})
// 	$.ajax({url:'/outback/infomation',
// 			method:'GET',
// 			data:{},
// 			dataType:'json',
// 			success:function(txt){
// 				let table='<thead><tr><th></th><th>아이디</th><th>패스워드</th><th>이름</th><th>모바일번호</th>'+
// 				'<th><input type=button id=btn name=btn value=회원탈퇴>'+'</th></tr></thead>';
// 					$('#tbl').append(table);
				
// 				for(i=0; i < txt.length; i++){
// 					let check='<tr><td><input type=checkbox name=check value="'+txt[i]['userid']+'"></td>'
// 					let box='<td>'+txt[i]['userid']+'</td><td>'+txt[i]['passcode']+'</td><td>'+txt[i]['name']+'</td><td>'+txt[i]['mobile']+'</td>';
// 					let btn='<td align=center><input type=button id=edit name=edit value=회원수정 data-userid='+txt[i]['userid']+'></td></tr>';
// 					$('#tbl').append(check+box+btn);
// 				}
// 			}
// 		});
// };
</script>
</html>