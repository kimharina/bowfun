<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/header" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>소개</title>
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
.text {
  font-size: 20px;
  margin-top: 35px;
  margin-bottom: 40px;
  position: relative; /* 이동을 위해 position을 설정합니다 */
  animation: slide-left 1s forwards; /* 1초 동안 애니메이션 진행 */
}

@keyframes slide-left {
  from {
    left: 100%; /* 오른쪽 끝에서 시작 */
  }
  to {
    left: 0; /* 원래 위치로 이동 */
  }
}

.text strong {
	font-size:23px;
    font-weight: bold;
}
.text2{
	font-size:16px;
	/* font-weight:bold; */
	margin-top: 35px;
	margin-bottom: 40px;
	color: #495057;
  opacity: 0; /* 처음에는 안 보이게 설정 */

  /* 애니메이션 설정 */
  animation: slide-up 1s forwards;
}

@keyframes slide-up {
  from {
    transform: translateY(50px); /* 50px 아래에서 시작 */
    opacity: 0; /* 처음에는 투명하게 */
  }
  to {
    transform: translateY(0); /* 원래 위치로 이동 */
    opacity: 1; /* 불투명하게 */
  }
}
.text3 {
  font-size: 16px;
  font-weight: bold; /* 글씨 두껍게 */
  margin-top: 35px;
  margin-bottom: 40px;
  color: #495057;
  opacity: 0; /* 처음에는 안 보이게 설정 */

  /* 애니메이션 설정 */
  animation: slide-up 1s forwards;
}

@keyframes slide-up {
  from {
    transform: translateY(50px); /* 50px 아래에서 시작 */
    opacity: 0; /* 처음에는 투명하게 */
  }
  to {
    transform: translateY(0); /* 원래 위치로 이동 */
    opacity: 1; /* 불투명하게 */
  }
}
.text4{
	font-size:16px;
	/* font-weight:bold; */
	margin-top: 35px;
	margin-bottom: 40px;
	color: #495057;

  opacity: 0; /* 처음에는 안 보이게 설정 */

  /* 애니메이션 설정 */
  animation: slide-up 1s forwards;
}

@keyframes slide-up {
  from {
    transform: translateY(50px); /* 50px 아래에서 시작 */
    opacity: 0; /* 처음에는 투명하게 */
  }
  to {
    transform: translateY(0); /* 원래 위치로 이동 */
    opacity: 1; /* 불투명하게 */
  }
}
.text5{
	font-size:16px;
	/* font-weight:bold; */
	margin-top: 35px;
	margin-bottom: 40px;
}
.text5 strong {
	font-size:23px;
    font-weight: bold;
}
.mp {
    width: 100%;
   
}

.mp img {
  
 margin-top: -644px;
    /*  display: flex;  */
     display: inline-block; 
   
   }

</style>


<body>
  <div id="introductionPage">
    <div class="top">
      <div class="mp">
        <img src="img/소개.png"
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
  	
  <div class="page-name-box">
      <div class="site-name">BOWFUN | </div>
      <div class="page-name">CEO 인사말</div>
      </div>
  
  	   <div class=text>'반려동물과 보호자가 함께 풍요로운 삶을<br> 살아가는 것'을 최고의 가치로 삼고 있는<br>
		<strong>(주)BOWFUN의 대표이사 최연지입니다. </strong></div>
		   
	  <div class=text2>BOWFUN은 지난 2019년 BOWFUN 서울숲캠퍼스의 성공적인 런칭을 기점으로 혁신적인 온/오프<br>라인 반려동물 라이프케어 서비스를 제공해왔으며 특히 최고의 반려동물 전문가와 함께하는 국<br>
	  내 1위 반려동물 케어 센터인 ‘BOWFUN 캠퍼스’와 반려가족의 행복한 액티비티를 지원하기 위한<br> 국내 1위 반려동반 플레이스 앱 ’반려의고수‘를 주축으로 신뢰감 있고 전문적인 서비스를 제공하<br>고자 많은 노력을 기울여 왔습니다. </div>
	    <div class=text3>저희 BOWFUN은 앞으로도 ‘BOWFUN 오프라인 캠퍼스’와 ‘반려의고수’의 성공을 기반으로<br>최고의 반려동물 라이프케어 서비스를 꾸준하게 개발해 나갈 수 있도록<br>
		끊임없는 연구와 노력을 아끼지 않을 것입니다.</div>
		<div class=text4>반려동물이라는 한 생명이 온전하고 풍요롭게 살아갈 수 있도록 최선을 다하시는 보호자님들께<br> 진심 어린 경의를 표하며, 보호자님과 반려동물의 행복한 동행에 저희 BOWFUN도 항상 함께 할<br>
		 것임을 다시 한 번 약속드립니다.</div>
		
	<div class=text5>(주)BOWFUN 대표이사 <strong>최연지</strong></div>
	
	<div id="homepage">
	  <div class="mp">
	    <img src="img/강아지 사진.png" style="width: 456px; height: 627px; transform: translate(155%, 60px);">
	    <div style="flex: 1;"></div>
	  </div>
	</div>
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