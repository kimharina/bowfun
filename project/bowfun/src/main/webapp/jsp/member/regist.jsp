<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/header" />
<link rel="stylesheet" href="css/style.css" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
        var expectedCode = "<%=request.getAttribute("code")%>";

        function validateCode() {
            var enteredCode = document.getElementById("code").value;

            if (enteredCode === expectedCode) {
                // 인증 코드가 일치하는 경우
                document.getElementById("result").innerHTML = "인증 성공!";

                // 숨겨진 필드를 나타내기
                document.getElementById("hiddenFields").style.display = "block";

                return true; // 폼 제출 허용
            } else {
                // 인증 코드가 일치하지 않는 경우
                document.getElementById("result").innerHTML = "인증 실패. 올바른 코드를 입력하세요.";
                return false; // 폼 제출 차단
            }
        }

	function checkCode() {
		var enteredCode = document.getElementById("code").value;

		if (enteredCode === expectedCode) {
			alert("인증 성공");
			// 숨겨진 필드를 나타내기
			document.getElementById("hiddenFields").style.display = "block";
		} else {
			alert("인증 실패. 올바른 코드를 입력하세요.");
		}
	}
	
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>
<div align="center">
	<body>
	<div class="outer-container">
	<div class="regContainer">
		<h2>회 원 가 입</h2>
		<div class="regist-wrapper">
			<h4 class="error-msg">${msg}</h4>
			<form class="regist-form" action="mailConfirm" method="post">
	       		<label for="email"></label>
	        	<input type="email" id="email" name="email" placeholder="이메일" value="${sessionScope.email}" required>
	        	<input type="submit" class="grabtn" value="전송">
			</form>
	
			<form class="regist-form" onsubmit="return validateCode();">
	        	<label for="code"></label>
	        	<input type="text" id="code" name="code" placeholder="인증번호" required>
	        	<input type="button" class="grabtn" onclick="checkCode()" value="확인">
			</form>
		</div>
		<div class="regiHidden-wrapper" id="hiddenFields" style="display: none;">
			<form class="regist-form" action="registProc" method="post" id="f">
				<input type="text" name="id" placeholder="아이디 - 영문, 숫자 6~20자 이내" id="id"><br>
				<input type="password" name="pw" placeholder="비밀번호 - 8~20자 이내" id="pw"><br>
				<input type="password" name="confirm" placeholder="비밀번호 확인 "
					id="confirm" onchange="pwCheck()"> <label id="label"></label><br>
				<input type="text" name="userName" id="userName" placeholder="이름"><br>
				<input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" readonly="readonly">
				<input type="button" class="grabtn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" name="address" id="sample6_address" placeholder="주소"><br> 
				<input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소"><br>
				<input type="text" name="mobile" placeholder="전화번호" id="mobile"><br>
				<input type="hidden" name="email" id="email" value="${sessionScope.email}">
				<input type="button" class="grabtn" value="가입하기" onclick="allCheck()">
				<input type="button" class="grabtn" value="취소" onclick="location.href='index'"><br>
			</form>
		</div>
	</div>
	</div>
	</body>
</div>
</html>
<c:import url="/footer" />