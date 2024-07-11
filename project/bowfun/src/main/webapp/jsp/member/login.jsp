<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<link rel="stylesheet" href="css/style.css" />

<div align="center">
	<div class="logContainer">
	<body>
	    <div class="login-wrapper">
	        <h2>Login</h2>
	        <h4 class="error-msg">${msg}</h4>
	        <form action="loginProc" method="post" id="login-form">
	            <input type="text" name="id" placeholder="Id">
	            <input type="password" name="pw" placeholder="Password">
	            <input type="submit" class="grabtn" value="Login" onclick="loginCheck()">
	        </form>
	    </div>
	</body>
			<!-- 카카오 이미지 링크
			https://developers.kakao.com/tool/demo/login/login?method=dynamic -->
			<a href="https://kauth.kakao.com/oauth/authorize?response_type=code
				&client_id=113e820074436ad9b27e92971e902e57
				&redirect_uri=http://localhost/kakaoLogin">
				<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" />
			</a>
	</div>
</div>
<c:import url="/footer" />