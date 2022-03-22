<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Covid</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<style>
</style>
<body>
<%@include file ="header.jsp" %>
<div class="submenu_title_wrap">
   <div class="container submenu_title">
      <h1>COVID CHECK</h1>
      <p>La Campanella - COVID CHECK</p>
   </div>
</div>
<div class="container O_container">
      <div style="text-align:center;">
            <input type="date" id=coviddt name=coviddt>
         <input type="button" id=btnSearch name=btnSearch value="Search">
      </div>
      <br>
      <table id=tbl class="covid_table">
         <thead>
            <tr>
               <th>등록일시</th>
               <th>사망자 수</th>
               <th>지역명</th> 
               <th>전일대비 증감수</th>
               <th>확진자 수</th>
               <th>지역발생 수</th>
            </tr>
         </thead>
         <tbody id=ctbody>
         	<tr><td colspan="6">원하는 날짜를 클릭 후 검색해주세요.</td></tr>
         </tbody>
      </table>
</div>
<br>
<%@include file ="footer.jsp" %>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
let vdate= document.getElementById('coviddt');
let todayData = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().substring(0, 10);
vdate.value = todayData;
// 체크인 최소값 : 오늘 날짜
vdate.setAttribute('max', todayData);
$(document)
.on('click','#btnSearch',function(){
   $('#ctbody').empty();
   $.ajax({
      url:"/outback/covidcheck",
      data:{coviddt:$("#coviddt").val()},
      method:"GET",
      dataType:"json",
      success:function(txt){
         console.log(txt);
         for(i=0; i<txt.length; i++){
            let str='<tr><td>'+txt[i]['creatdt']+'</td><td>'+
                   txt[i]['deathcnt']+'</td><td>'+
                   txt[i]['gubun']+'</td><td>'+
                   txt[i]['incdec']+'</td><td>'+
                   txt[i]['defcnt']+'</td><td>'+
                   txt[i]['localocccnt']+'</td></tr>'
            $('#ctbody').append(str);
         }
      }
   })
})
</script>
</html>