<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/header" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>홈</title>
<style>
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}


.top {
    display: flex;
}

.top .mp {
    width: 100%;
   
}

.top .mp img {
    width: 100%;
    height: auto;
     margin-top: -94px;
}

.art {
	margin-bottom: 20px;
}

.text{
	color:#FDC300;
	font-weight:bold;
	font-size:51px;
	margin-top: 65px;


}
.text2{
	font-size:20px;
	/* font-weight:bold; */
	margin-top: 10px;
	margin-bottom: 40px;

}
.text2 strong {
	font-size:23px;
    font-weight: bold;
}

.puppy{
	display: flex;
	justify-content: space-between;
	padding: 0 410px;
	


}

</style>
<body>
	<div id="homepage">
		<div class="top">
			<div class="mp">
				<img src="img/main.png"
					style="width: 903; height: 481;">
			</div>

		</div>
	</div>
	<div class="art">
		<img
			src="https://cdn.imweb.me/upload/S20220413f4fb06ac7c349/08096ce238ede.png"
			style="width: 288px; margin-top: -25px;">
			
	</div>
	<div class="text">Better Care, Better Life</div>
	
	
	<div class="text2"><strong>BOWFUN은</strong><br>보호자가 반려견과 함께<br>더 나은 삶을 가꾸어 나가는 것을 <strong>최선의 가치</strong>로 삼고 있습니다. </div>
	
	<div class="puppy">
	<img src="img/강아지.jpg">
		</div>


</body>
</head>
</html>
<c:import url="/footer" />

