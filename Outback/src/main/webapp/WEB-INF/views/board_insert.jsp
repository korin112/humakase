<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<style>
	*{margin:0; padding:0;}
	ul, li{list-style:none;}
	.fixed::after{content:''; clear:both; display:block;}
	.option .dropdown-toggle::after{margin-left:1.255rem;}
	.dropdown-menu{max-height:200px; overflow-y:auto; overflow-x:hidden;}
	.dropdown-item{cursor:pointer;}
	.book-list{overflow:hidden;}
	.book-list article{display:block; margin:3.5rem 1.25rem; width:Calc(55% - 1.25rem); height:100%; float:left;}
	.booking_info_box > ul{display:table; width:100%; margin:0; padding:0; border-bottom:1px solid #ddd;}
	.booking_info_box > ul:first-child{border-top:1px solid #ddd;}	
	.booking_info_box > ul > li{width:70%; display:table-cell; padding:1.25rem 0 1.25rem 2.125rem;}
	.booking_info_box > ul > li:first-child{width:30%; vertical-align:middle; background:#f9f9f9;}
	.booking_info_box input{border:none;}
	.booking_info_box li #title{width:100%; resize:none; border:1px solid #ddd; padding:0.5rem; height:45px;}
	.booking_info_box li #content{width:100%; resize:none; border:1px solid #ddd; padding:0.5rem; height:300px;}
</style>
</head>
<body>
	<%@include file ="header.jsp" %>
	<div class="container O_container">
	<section class="book-list fixed">
		<article class="booking_info_box">
			<ul class="fixed">
				<li>제목</li>
				<li><input type="text" id="title" name="title" maxlength="30" placeholder="최대 30자까지 가능합니다." spellcheck=false></li>
			</ul>
	   		<ul class="fixed">
				<li>작성자</li>
				<li><input type="text" name="writer" id="writer" readonly=readonly value="${userid}"></li>
			</ul>
			<ul class="fixed">
				<li>날짜</li>
				<li id="vdate" class="dropdown option">
					<a href="#" class="dropdown-toggle link-dark" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						날짜를 선택하세요.
					</a>
					<ul class="dropdown-menu">
						<c:forEach items="${date}" var="d">
							<li class="dropdown-item" data-value="${d.vdate}">${d.vdate}</li>
						</c:forEach>
					</ul>
				</li>
			</ul>
			
			<ul class="fixed">
				<li>지점</li>
				<li id="spot" class="dropdown option" >
					<a href="#" class="dropdown-toggle link-dark" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						지점을 선택해주세요.
					</a>
					<ul class="dropdown-menu"></ul>
				</li>
			</ul>
			
			<ul class="fixed">
				<li>메뉴</li>
				<li id="menu"></li>
			</ul>

	   		<ul>
				<li>내용</li>
				<li><textarea id="content" name="content" maxlength="500" placeholder="최대 500자까지 가능합니다." spellcheck=false></textarea></li>
			</ul>
	   		<div>
			    <button id="done">완료</button>
			    <button id="cancel">취소</button>
	    	</div>
		</article>
	</section>
	</div>
	<%@include file ="footer.jsp" %>
	<script>
		$(document)
		.on('click','#vdate ul li',function() {
			//console.log("vdate : "+$(this).attr('data-value'));
			
			let vdate=$(this).attr('data-value');
			$('#vdate a').text(vdate);
			
			
			$('#spot a').text('지점을 선택해주세요.');
			$('#spot a').attr('data-value',null);
			$('#spot ul').empty();
			
			$.ajax({url:'/outback/spotList',
				data:{booker:$('#writer').val(), vdate:vdate},
				method:'GET',
				datatype:'json',
				success:function(txt) {
					//console.log(txt);
					for(i=0;i<txt.length;i++) {
						let str="<li class='dropdown-item' data-value='"+txt[i]['book_id']+','
								+txt[i]['spot_code']+"'>"+txt[i]['spot_name']+"</li>"
						$('#spot ul').append(str);
					}
				}
			});	
		})
		.on('click','#spot ul li',function() {
			//console.log("spot : "+$(this).attr('data-value'));
			let spot=$(this).attr('data-value');
			$('#spot > a').text($(this).text());
			let ar=spot.split(',');
			
			$('#menu').empty();
			$.ajax({url:'/outback/menuList',
				data:{booker:$('#writer').val(),
					  spot_code:ar[1],
					  book_id:ar[0]},
				method:'GET',
				datatype:'json',
				success:function(txt) {
					//console.log(txt);
					for(i=0;i<txt.length;i++) {
						let str="<li data-value='"+txt[i]['menu_code']+"'>"
								+txt[i]['menu_name']+"</li>"
						$('#menu').append(str);
					}
				}
			});
		})
		.on('click','#done',function() {
			if($('#title').val()==null) {
				alert("제목을 입력해주세요.");
			} else if($('#content').val()==null) {
				alert("내용을 입력해주세요.");
			}
			console.log("spot : "+$('#spot ul li').attr('data-value'));		
			console.log("vdate : "+$('#vdate a').text());			
			
			let spot=$('#spot ul li').attr('data-value');
			let ar=spot.split(',');
			
			let m_code='';
			for(i=0;i<$('#menu li').length;i++) {
				m_code+=","+$('#menu li:eq('+i+')').attr('data-value');
			}
			let menu_code=m_code.replace(',','');
			console.log(menu_code);
	
			let oParam = {title:$('#title').val(), writer:$('#writer').val(),
						  vdate:$('#vdate a').text(), spot:ar[1],
						  menu_code:menu_code, content:$('#content').val()};
			$.ajax({url:'/outback/board_insert',
				data:oParam,
				method:'POST',
				datatype:'json',
				success:function(txt) {
					if(txt=="ok") {
						alert('작성 완료했습니다.');
						document.location='/outback/board_list';
					} else {
						alert('다시 작성해주세요.');
					}
				}
			});
		})
		
		.on('click','#cancel',function() {
			if(!confirm("취소하시면 작성한 모든 내용이 사라집니다. 취소하시겠습니까?")) return false;
			document.location="/outback/board_list";
		})
		
		function optionList(option) {
// 			let vdate=$('#vdate').val();
// 			let ar=vdate.split(',');
			
			$('#'+option).empty();
			$.ajax({url:'/outback/'+option+'List',
				data:{booker:$('#writer').val(),
					  vdate:ar[1],
					  book_id:ar[0]},
				method:'GET',
				datatype:'json',
				success:function(txt) {
					console.log(txt);
					for(i=0;i<txt.length;i++) {
						let str='<option value='+txt[i][option+'_code']+'>'
									+txt[i][option+'_name']+'</option>';
						$('#'+option).append(str);
					}
				}
			});
		}
	</script>
</body>
</html>