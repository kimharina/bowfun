<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:import url="/header" />
    <br><br><br>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>카테고리별 장소 검색하기</title>
<link rel="stylesheet" href="css/mapstyle.css"/>
</head>
<body>
<p style="margin-top:-12px">
<!--     <em class="link"> -->
<!--         <a href="/web/documentation/#CategoryCode" target="_blank">카테고리 코드목록을 보시려면 여기를 클릭하세요!</a> -->
<!--     </em> -->
</p>
<div class="map_wrap">
    <div id="map" style="width:70%;height:100%;position:relative;overflow:hidden;"></div>
    <ul id="category">
               
            <li id="AD5" data-order="5"><span class="category_bg store"></span>
				호텔</li>
			<li id="HP8" data-order="2"><span class="category_bg pharmacy"></span>
				병원</li>
			<li id="CE7" data-order="4"><span class="category_bg cafe"></span>
				카페</li>
		    <li id="PM9" data-order="5"><span class="category_bg store"></span>
			   	펜션 </li>					  
			           
			       

		</ul>
	</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2a8f70700456ca6e9b3d01471268d1d3&libraries=services"></script>
<script>
// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
  //임의의 마커를 생성하고 지도에 추가
var specialMarkers = [];    
 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.570923, 126.992468), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(map); 

// 지도에 idle 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

// 각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
    if (!currCategory) {
        return;
    }
    
    // 커스텀 오버레이를 숨깁니다 
    placeOverlay.setMap(null);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        displayPlaces(data);
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

    } else if (status === kakao.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
        
    }
}

// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {

    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');
    var category = document.getElementById('category').value; // 현재 선택된 카테고리를 가져옴


    

    for ( var i=0; i<places.length; i++ ) {
    	

            // 마커를 생성하고 지도에 표시합니다
            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);
            
            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function(marker, place) {
                kakao.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]); 
    }
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기 72 208
            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

    if (place.road_address_name) {
        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
    }  else {
        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
    }                
   
    content += '    <span class="tel">' + place.phone + '</span>' + 
                '</div>' + 
                '<div class="after"></div>';

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map);  
}




function displaySpecialPlaceInfo(specialPlaces) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" href="' + specialPlaces.place_url + '" target="_blank" title="' + specialPlaces.place_name + '">' + specialPlaces.place_name + '</a>';   

    if (specialPlaces.road_address_name) {
        content += '    <span title="' + specialPlaces.road_address_name + '">' + specialPlaces.road_address_name + '</span>' +
                    '  <span class="jibun" title="' + specialPlaces.address_name + '">(지번 : ' + specialPlaces.address_name + ')</span>';
    }  else {
        content += '    <span title="' + specialPlaces.address_name + '">' + specialPlaces.address_name + '</span>';
    }                
   
    content += '    <span class="tel">' + specialPlaces.phone + '</span>' + 
                '</div>' + 
                '<div class="after"></div>';

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(specialPlaces.y, specialPlaces.x));
    placeOverlay.setMap(map);
    // 'place_url' 클릭 이벤트 추가
    var placeLink = document.querySelector('.placeinfo .title');

    placeLink.addEventListener('click', function() {
        window.location.href = specialPlaces.place_url;
    });
}

//클릭한 카테고리에 대한 특정 마커 정보
var specialPlacesByCategory = {
    'AD5': {
        place_name: "바우펀 호텔",
        place_url: "kakaomap",
        road_address_name: "서울 종로구 종로18길 9-6",
        address_name: "서울 종로구 관수동 54-2",
        phone: "02-2223-6500",
        y: 37.5713171, // 카테고리 1 장소의 위도
        x: 126.991153, // 카테고리 1 장소의 경도
        data_order: 5 // 카테고리 1의 data-order
    },
    'HP8': {
        place_name: "바우펀 병원",
        place_url: "kakaomap",
        road_address_name: "서울 종로구 종로 132",
        address_name: "서울 종로구 종로3가 138-1",
        phone: "02-2271-0020",
        y: 37.570923, // 카테고리 2 장소의 위도
        x: 126.992468, // 카테고리 2 장소의 경도
        data_order: 2 // 
    },
    'CE7': {
        place_name: "바우펀 카페",
        place_url: "kakaomap",
        road_address_name: "서울 종로구 돈화문로4길 37",
        address_name: "서울 종로구 종로3가 166-2",
        phone: "02-733-3264",
        y: 37.570055, // 카테고리 3 장소의 위도
        x: 126.9925997, // 카테고리 3 장소의 경도
        data_order: 4 // 
    },
    'PM9': {
        place_name: "바우펀 펜션",
        place_url: "kakaomap",
        road_address_name: "서울 종로구 수표로20길 43",
        address_name: "서울 종로구 종로3가 132-1",
        phone: "02-2274-6228",
        y: 37.56990896570583, // 카테고리 3 장소의 위도
        x: 126.991302085534, // 카테고리 3 장소의 경도
        data_order: 5
    }
};



// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}
//전역 범위에서 openInfowindow 변수 정의.인포윈도우를 열고 닫을 때 사용하는 역할
var openInfowindow = null; 
//클릭한 카테고리에 대한 특정 마커 정보를 표시하는 함수입니다

function addSpecialMarker(category) {
    var specialPlaces = specialPlacesByCategory[category];
    if (specialPlaces) {
        // 해당 카테고리의 마커를 표시
        var order = document.getElementById(category).getAttribute('data-order');
        var specialMarker = addMarker(new kakao.maps.LatLng(specialPlaces.y, specialPlaces.x), order);
        var category = document.getElementById('category').value; // 현재 선택된 카테고리를 가져옴

        // 마커 클릭 이벤트를 등록합니다
        kakao.maps.event.addListener(specialMarker, 'click', function() {
            displaySpecialPlaceInfo(specialPlaces);
        });
        
        // 특별한 마커를 지도에 표시
        specialMarker.setMap(map);
        specialMarkers.push(specialMarker);

        // 인포윈도우를 생성하고 마커 아래에 위치하도록 조정
        var winContent = '<div class="infowindow-content">' + specialPlaces.place_name + '</div>';
        var infowindow = new kakao.maps.InfoWindow({
            content: winContent,
            position: specialMarker.getPosition(), // 마커 위치에 표시
            zIndex: 1
        });
        infowindow.open(map, specialMarker);
        openInfowindow = infowindow; // openInfowindow 변수 초기화
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);
    // 이미 열린 인포윈도우가 있다면 닫기
    if (openInfowindow) {
        openInfowindow.close();
    }

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
        removeSpecialMarkers(); // 특별한 마커들도 제거
       
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();

        //클릭한 카테고리에 해당하는 모든 마커를 표시
       addSpecialMarker(currCategory);
    }
}
// 지도 위에 dragend 이벤트를 등록합니다
// kakao.maps.event.addListener(map, 'dragend', function() {
//     // 카테고리가 선택되어 있을 경우, 해당 카테고리의 특별한 마커를 다시 표시
//     if (currCategory) {
//         addSpecialMarker(currCategory);
//     }
//     searchPlaces();
// });

// kakao.maps.event.addListener(map, 'zoom_changed', function() {
//     if (currCategory) {
//         addSpecialMarker(currCategory);
//     }
//     searchPlaces();
// });

//지도 위에 표시되고 있는 모든 특별한 마커를 제거하는 함수
function removeSpecialMarkers() {
    for (var i = 0; i < specialMarkers.length; i++) {
        specialMarkers[i].setMap(null);
    }
    specialMarkers = [];
}
    



// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
     children = category.children,
     i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 
</script>
</body>
</html>
 <c:import url="/footer" />
