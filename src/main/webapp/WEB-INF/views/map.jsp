<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta charset="utf-8">
<script type="text/javascript" src = "./resources/js/jquery-3.1.1.js"></script>
   <title>다음 지도 API</title>
</head>
<body>
   
   <div id="top"><h1>최적의 주거지역 찾기</h1></div>
   
   <div id="map" style="width:1280px;height:800px;"></div>
   
   <div id="roadview" style="width:750px;height:350px;"></div>

   <script src="//apis.daum.net/maps/maps3.js?apikey=e5f9cd760a5dedf9f84cc76d41a6decd&libraries=services"></script>
   <script>
   
   function save(){
	   alert('dfasdf');
   }

   
    function call(){
    	
    	
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new daum.maps.LatLng(37.55139, 127.16689), // 지도의 중심좌표
            level: 10, // 지도의 확대 레벨
            mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
        }; 

    // 지도를 생성한다 
    var map = new daum.maps.Map(mapContainer, mapOption); 
    



    // 지도 타입 변경 컨트롤을 생성한다
    var mapTypeControl = new daum.maps.MapTypeControl();

    // 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
    map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);   

    // 지도에 확대 축소 컨트롤을 생성한다
    var zoomControl = new daum.maps.ZoomControl();

    // 지도의 우측에 확대 축소 컨트롤을 추가한다
    map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
    
 	// 주소-좌표 변환 객체를 생성합니다
    var geocoder = new daum.maps.services.Geocoder();

    // 지도 클릭 이벤트를 등록한다 (좌클릭 : click, 우클릭 : rightclick, 더블클릭 : dblclick)
    daum.maps.event.addListener(map, 'click', function (mouseEvent) {
       console.log('지도에서 클릭한 위치의 좌표는 ' + mouseEvent.latLng.toString() + ' 입니다.');
    });   
    // 지도 드래깅 이벤트를 등록한다 (드래그 시작 : dragstart, 드래그 종료 : dragend)
    daum.maps.event.addListener(map, 'drag', function () {
       var message = '지도를 드래그 하고 있습니다. ' + 
                   '지도의 중심 좌표는 ' + map.getCenter().toString() +' 입니다.';
       console.log(message);
    });


    
    	var testArray = [];
    	 var emdName = '삼성동'; 
    	 testArray.push('11680105'); 
    	
    	
    	

    	
    for(var i in testArray){
    	$.ajax({
    		url : "http://apis.vworld.kr/2ddata/ademd/data?apiKey=CCA36BB7-0DA8-3EE7-8836-D4814D529510&domain=http://localhost:8888&emdCd="+testArray[i]+"&srsName=EPSG:4326&output=json",
    		dataType : "jsonp",
    		jsonp : "callback",
    		success : function(rtndata){
    			console.log(rtndata.featureCollection.features[0].geometry.coordinates);
    			var list = rtndata.featureCollection.features[0].geometry.coordinates;
    			var newList = new Array();
    		 	var newListX = new Array(); 
    		 	var polygonPath = [];
    			newList = list[0];
    			for(var i in newList){
    				newList[i].reverse();
    			}
    			
    			
    			alert(newList);
    		/* list =rtndata.featureCollection.features[0].geometry.coordinates; */	
    		/* 	alert(newList); */
    		
    		
    			   // 다각형을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 다각형을 표시합니다
    			for(var i in newList){
    		   	polygonPath.push(new daum.maps.LatLng(newList[i][0],newList[i][1]));
    			}
    		        
    		      // 지도에 표시할 다각형을 생성합니다
    		      var polygon = new daum.maps.Polygon({
    		          path:polygonPath, // 그려질 다각형의 좌표 배열입니다
    		          strokeWeight: 3, // 선의 두께입니다
    		          strokeColor: '#39DE2A', // 선의 색깔입니다
    		          strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    		          strokeStyle: 'longdash', // 선의 스타일입니다
    		          fillColor: 'gray', // 채우기 색깔입니다
    		          fillOpacity: 0.7 // 채우기 불투명도 입니다
    		      });

    		      // 지도에 다각형을 표시합니다
    		      polygon.setMap(map);    		       		      
    		     	$.ajax({
    		    		type : "POST",   		
    		    		url : "getDoroCD",
    		    		data : {
    		    			 emdName : emdName 
    		    		},
    		    		dataType : "json",
    		    		success : function(data){
    		    			console.log(data[0].kaptAddr)
    		    			//주소로 좌표를 검색합니다
    		    			var kaptAddr = new Array();
    		    			for(var i in data){
    		    				kaptAddr.push(data[i].kaptAddr);
    		    			}
    		    			
    		    			 $.each(kaptAddr,function(index,item){
    		    				geocoder.addr2coord(item, function(status, result) {
        		    			
    		    				if (status === daum.maps.services.Status.OK) {

     		    			       var coords=new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
     		    			 
    		    			var marker = new daum.maps.Marker({
		    			           map: map,
		    			           position: coords
		    			       });
    		    
    		    				   }
    		    				
    		    				// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
    		    				var iwContent = '<div style="padding:5px;">'+item+'</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

    		    				// 인포윈도우를 생성합니다
    		    				var infowindow = new daum.maps.InfoWindow({
    		    				    content : iwContent
    		    				});

    		    				// 마커에 마우스오버 이벤트를 등록합니다
    		    				daum.maps.event.addListener(marker, 'mouseover', function() {
    		    				  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
    		    				    infowindow.open(map, marker);
    		    				});

    		    				// 마커에 마우스아웃 이벤트를 등록합니다
    		    				daum.maps.event.addListener(marker, 'mouseout', function() {
    		    				    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
    		    				    infowindow.close();
    		    				});
    		    				});
    		    		}) 
    		    			
    		    		},
    		    		error : function(e){
    		    			console.log(e)
    		    		}
    		    	});   
    		   }   
    		,
    		error : function(e){
    			console.log(e);
    		} 
    	});
    }
    }
   call();
   
   function getDoroCD(emdName){

   } 







    

   </script>
</body>

<input type="button" id="save" value = "저장하기" onclick = "save()">
</html>