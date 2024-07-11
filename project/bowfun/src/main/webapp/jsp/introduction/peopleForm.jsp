<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/header" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>운영진 소개</title>
<style>

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    list-style: none;
}
a {
  color: inherit;	
  text-decoration: none;	
  font-size: 3rem;
}

.top {
    /* display: flex; */
}

.top .mp {
    width: 100%;
   
}

.top .mp img {
    width: 100%;
    height: 481;
     margin-top: -1px;
}
.list.menu  {
  display: none;
 
  
 
}

/* 가운데 정렬 */
.list {
	text-align: center; 
  margin-top: -13px;
  
 }

.menu {
  display: flex; 
  background-color: white;
  color: #6c757d;
  width: 100%; 
  align-items: center;
  margin-top: 10px;
  justify-content: center;
  border-radius: 10px; /* 추가: 둥근 테두리 */
  padding: 10px; /* 추가: 내부 여백 */
  border-bottom: 1px solid #e9e9e9;
   margin-bottom: 100px; 
  
}

.menu ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  display: flex;
  
}

.menu li {
  margin: 0 10px;
  font-size: 12px; /* 추가: 글씨 크기 변경 */
}
.menu li a {
  font-size: 23px; /* 여기에 원하는 크기(px)를 입력하세요 */
}

.menu li.active {
  background-color: black;
  color: #FDC300;
  border-radius: 10px;
}
.text {
  font-size: 30px;
  margin-top: 35px;
  margin-bottom: 40px;
  text-align: center; /* 텍스트 가운데 정렬 */
  opacity: 0;
  transform: translateY(30px);
  animation: slide-up 1s forwards 0.5s;
}

@keyframes slide-up {
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
.text strong {
	font-size: 30px;
	font-weight: bold;
}
  .site-name {
    font-size: 30px;
    font-weight: 900;
    color: rgb(253, 195, 0);
    margin-right: 10px;
    
  }

  .page-name {
    font-size: 30px;
    font-weight: 900;

  }
    .page-name-box{
    display: flex;
  }

  .pt img {
  width: 415px; /* 원하는 너비로 조절하세요 */
  height: 470px; /* 원하는 높이로 조절하세요 */
  border-radius: 50%; /* 동그라미 모양 */
}

.tx{
  font-size: 18px;
 	margin-left: 155px; /* 오른쪽으로 이동할 거리를 조절합니다. */
 	display:fiex;
}

 .pt2 {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 20px; 
  margin-right: 155px;
  
  
} 
  .pt2 img {
 
  width: 415px; /* 원하는 너비로 조절하세요 */
  height: 470px; /* 원하는 높이로 조절하세요 */
  border-radius: 50%; /* 동그라미 모양 */
    /* margin-right: 155px; */
     margin-top: -1580px;
 
}
 .tx2{
  font-size: 18px;
 	margin-right: 450px; /* 오른쪽으로 이동할 거리를 조절합니다. */
 	 margin-top: -1030px;
 	 z-index:9999

}
 .pt3 {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 20px; 
  margin-right: 155px;
    
  
  
} 
  .pt3 img {
 
  width: 415px; /* 원하는 너비로 조절하세요 */
  height: 470px; /* 원하는 높이로 조절하세요 */
  border-radius: 50%; /* 동그라미 모양 */
    /* margin-right: 155px; */
     margin-top: -713px;
    
 
}
 .tx3{
  font-size: 18px;
 	margin-right: 450px; /* 오른쪽으로 이동할 거리를 조절합니다. */
 	 margin-top: -43px;
 	margin-bottom: 33px;
 	 z-index:9999

}
.pt, .tx {
  opacity: 0;
  transform: translateY(20px);
  animation: slide-up 1s forwards;
}

@keyframes slide-up {
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
.pt2, .tx2 {
  opacity: 0;
  transform: translateY(20px);
  animation: slide-up 1s forwards;
}

@keyframes slide-up {
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
.pt3, .tx3 {
  opacity: 0;
  transform: translateY(20px);
  animation: slide-up 1s forwards;
}

@keyframes slide-up {
  to {
    opacity: 1;
    transform: translateY(0);
  }
}



</style>

<body>
  <div id="peoplePage">
    <div class="top">
      <div class="mp">
        <img src="img/운영진.png"
          style="width: 903; height: 481;">
      </div>
    </div>
    
      <div class="list">
      <div class="menu">
        <ul>
          <li>
            <a href="introductionForm">CEO 인사말</a>
          </li>
          <li>
            <a href="peopleForm">BOWFUN 운영진</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
  
  <div class="text">바우라움 펫케어센터의 운영진은<br>관련 전문교육 이수 및<br>자격증 취득을 완료한<br>
  전문가들로 구성되어 있으며,<br><br>센터 운영에 있어<br><strong>항상 아이들의 안전과 행복</strong>을<br>최우선순위로 생각합니다.</div>
  
  
    	
  <div class="page-name-box">
      <div class="site-name">BOWFUN | </div>
      <div class="page-name">펫케어팀</div>
      </div>
      
      
      <div class="pt">
      <img src="img/yj.jpg" >
      <div class="tx">연지 대표</div>
     </div>
          <div class="pt">
      <img src="img/dw.jpg" >
      <div class="tx">동운 대리</div>
     </div>
    
     	<div class="pt2">
      <img src="img/jh.jpg" style="transform: translate(160%, 60px);" >
      <div class="tx2">지현 총무</div>
     </div>
          <div class="pt3">
      <img src="img/cb.jpg" style="transform: translate(160%, 60px);" >
      <div class="tx3">찬범 팀장</div>
     </div>
    
    
  
  
  
  
	 <script>
	 document.addEventListener('DOMContentLoaded', function() {
		  var menuItems = document.querySelectorAll('.menu li');

		  menuItems.forEach(function(item) {
		    item.addEventListener('click', function() {
		      menuItems.forEach(function(item) {
		        item.classList.remove('active');
		      });

		      this.classList.add('active');
		    });
		  });

		  var animatedElements = document.querySelectorAll('.text2, .text3, .text4, .text5');

		  function checkScroll() {
		    animatedElements.forEach(function(element) {
		      if (isElementInViewport(element)) {
		        element.style.opacity = '1';
		        element.style.transform = 'none';
		      }
		    });
		  }

		  function isElementInViewport(el) {
		    var rect = el.getBoundingClientRect();
		    return (
		      rect.top >= 0 &&
		      rect.left >= 0 &&
		      rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
		      rect.right <= (window.innerWidth || document.documentElement.clientWidth)
		    );
		  }

		  // 처음에 한 번 체크해줍니다.
		  /* checkScroll(); */

		  // 스크롤할 때마다 체크합니다.
		  window.addEventListener('scroll');
		});
	</script>
	</body>
	</head>
	</html>
	<c:import url="/footer" />
  	