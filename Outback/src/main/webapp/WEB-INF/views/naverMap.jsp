<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>지점위치</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=bo4mz65ku1"></script>
</head>
<body>
<input type=text id=spotName name=spotName><br>
주소<input type=text id=spotAddress name=spotAddress><br>
예약 및 이용 문의<input type=text id=spotPhoneNum name=spotPhoneNum><br>
영업시간<input type=text id=spotOpenHour name=spotOpenHour><br>
<div id="map" style="width:50%;height:400px;"></div>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(function () {
	spot();
});

function spot() {
	var spotArr = new Array();
	spotArr.push(
		{location : '강남' , lat : '37.4959854' , lng : '127.0664091'},  // 강남구 중심좌표
		{location : '강동' , lat : '37.5492077' , lng : '127.1464824'},  // 강동구 중심좌표
		{location : '강북' , lat : '37.6469954' , lng : '127.0147158'},  // 강북구 중심좌표
		{location : '강서' , lat : '37.5657617' , lng : '126.8226561'},  // 강서구 중심좌표
	);
			
	let markers = new Array(); // 마커 정보를 담는 배열
	let infoWindows = new Array(); // 정보창을 담는 배열

	//지도
	var mapOptions = {
	    center: new naver.maps.LatLng(37.541, 126.986),
	    zoom: 10
	};

	var map = new naver.maps.Map('map', mapOptions);
		
	for (var i = 0; i < spotArr.length; i++) {
		// 지역을 담은 배열의 길이만큼 for문으로 마커와 정보창을 채워주자 !

	    var marker = new naver.maps.Marker({
	        map: map,
	        title: spotArr[i].location, // 지역구 이름 
	        position: new naver.maps.LatLng(spotArr[i].lat , spotArr[i].lng) // 지역구의 위도 경도 넣기 
	    });
	    
		// 정보창
		 var infoWindow = new naver.maps.InfoWindow({
		     content: '<div style="width:200px;text-align:center;padding:10px;"><b>' + spotArr[i].location + '</b><br> - 네이버 지도 - </div>'
		 }); // 클릭했을 때 띄워줄 정보 HTML 작성
	    
		 markers.push(marker); // 생성한 마커를 배열에 담는다.
		 infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다.
	}
}
</script>
</body>
</html>