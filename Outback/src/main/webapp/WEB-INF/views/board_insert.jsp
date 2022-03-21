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
	*{margin:0; padding:0; outline:0;}
	ul, li{list-style:none;}
	.fixed::after{content:''; clear:both; display:block;}
	.option .dropdown-toggle::after{margin-left:1.255rem;}
	.dropdown-menu{max-height:200px; overflow-y:auto; overflow-x:hidden;}
	.dropdown-item{cursor:pointer;}
	.book-list{overflow:hidden;}
	.book-list article{display:block; margin:2rem 11.5rem; width:70%; height:100%;}
	.booking_info_box > ul{display:table; width:100%; margin:0; padding:0; border-bottom:1px solid #ccc;}
	.booking_info_box > ul:first-child{border-top:1px solid #ddd;}	
	.booking_info_box > ul > li{width:80%; display:table-cell; padding:1.25rem 0 1.25rem 2.125rem; outline:0;}
	.booking_info_box > ul > li:first-child{width:20%; vertical-align:middle; background:#EAEAEA;}
 	.booking_info_box input{border:none;} 
	.booking_info_box li #content{width:100%; resize:none; border:1px solid #ddd; padding:0.5rem; height:300px;}
	.board_btn{text-align:right; margin-top:1.5rem; margin-right:0.5rem;}
</style>
</head>
<body>
	<%@include file ="header.jsp" %>
	<div class="container O_container">
	<section class="book-list fixed">
		<article class="booking_info_box">
			<ul class="fixed">
				<li>제목</li>
				<li><input type="text" id="title" name="title" maxlength="50" placeholder="최대 50자까지 가능합니다." 
					spellcheck=false style="width:100%; border:1px solid #ddd; padding:0.5rem;"></li>
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
						지점을 선택하세요.
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
	   		<div class="board_btn">
	   			<button type="button" id="done" class="btn btn-outline-secondary">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
  						<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
					</svg> 완료
				</button>
				<button type="button" id="cancel" class="btn btn-outline-secondary">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-left" viewBox="0 0 16 16">
  						<path fill-rule="evenodd" d="M14.5 1.5a.5.5 0 0 1 .5.5v4.8a2.5 2.5 0 0 1-2.5 2.5H2.707l3.347 3.346a.5.5 0 0 1-.708.708l-4.2-4.2a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 8.3H12.5A1.5 1.5 0 0 0 14 6.8V2a.5.5 0 0 1 .5-.5z"/>
					</svg> 취소
				</button>
	    	</div>
		</article>
	</section>
	</div>
	<%@include file ="footer.jsp" %>
	<script>
		$(document)
		.on('click','#vdate ul li',function() {
			//console.log("vdate : "+$(this).attr('data-value'));
			
			// 예약한 날짜 선택(이전 날짜만 선택 가능)
			let vdate=$(this).attr('data-value');
			$('#vdate a').text(vdate);
			
			// 예약한 날짜와 일치하는 지점 선택
			$('#spot a').text('지점을 선택하세요.');
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
			
			// 예약한 날짜, 지점과 일치하는 메뉴
			$('#menu').empty();
			$.ajax({url:'/outback/menuList',
				data:{booker:$('#writer').val(),
					  spot_code:ar[1],
					  book_id:ar[0]},
				method:'GET',
				datatype:'json',
				success:function(txt) {
					for(i=0;i<txt.length;i++) {
						let str="<li data-value='"+txt[i]['menu_code']+"'>"
								+txt[i]['menu_name']+"</li>"
						$('#menu').append(str);
					}
				}
			});
		})
		// 글쓰기 완료
		.on('click','#done',function() {
			let m_code='';
			for(i=0;i<$('#menu li').length;i++) {
				m_code+=","+$('#menu li:eq('+i+')').attr('data-value');
			}
			let menu_code=m_code.replace(',','');
			
			if($('#title').val()=='') {
				alert("제목을 입력해주세요.");
				return false;
			} else if($.trim($('#vdate a').text())=='날짜를 선택하세요.') {
				alert("날짜를 선택해주세요.");
				return false;
			} else if($.trim($('#spot a').text())=='지점을 선택하세요.') {
				alert("지점을 선택해주세요.");
				return false;
			}  else if(menu_code=='') {
				alert("메뉴를 선택해주세요.");
				return false;
			} else if($('#content').val()=='') {
				alert("내용을 입력해주세요.");
				return false;
			}
			
			let spot=$('#spot ul li').attr('data-value');
			let ar=spot.split(',');
			
			let oParam={title:$('#title').val(), writer:$('#writer').val(),
						vdate:$('#vdate a').text(), spot:ar[1],
						menu_code:menu_code, content:$('#content').val()};
			$.ajax({url:'/outback/board_insert',
				data:oParam,
				method:'POST',
				datatype:'json',
				success:function(txt) {
					if(txt=="ok") {
						alert('작성 완료했습니다.');
						findLink();
					} else {
						alert('다시 작성해주세요.');
					}
				}
			});
		})
		
		.on('click','#cancel',function() {
			if(!confirm("취소하시면 작성한 모든 내용이 사라집니다. 취소하시겠습니까?")) return false;
			findLink();
		})
			
		function findLink() {
			var link=document.location.href.split('outback/');
			console.log(link[1]);
			if(link[1]=='board_insert') {  // 리뷰게시판
				document.location='/outback/board_list';
			}
			if(link[1]=="mp_board_insert") {  // 마이페이지 리뷰 관리
				document.location='/outback/mypage/myboard';
			}
			if(link[1]=="adm_board_insert") {  // 관리자페이지 리뷰 관리
				document.location='/outback/adm/adm_board';
			}
		}
	</script>
</body>
</html>