<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:import url="/header" />
<link rel="stylesheet" href="css/infostyle.css">

<div class="center">
	<div class="container">
		<h1 class="title">개인 정보</h1>
		<div class="info">
			<p class="info-item">아이디 : ${sessionScope.id}</p>
			<p class="info-item">비밀번호 : ********</p>
			<p class="info-item">이름 : ${sessionScope.userName}</p>
			<p class="info-item">이메일 : ${sessionScope.email}</p>
			<p class="info-item">우편번호 : ${fn:split(sessionScope.address, ',')[0]}</p>
			<p class="info-item">주소 : ${fn:split(sessionScope.address, ',')[1]}</p>
			<p class="info-item">상세주소 : ${fn:split(sessionScope.address, ',')[2]}</p>
			<p class="info-item">전화번호 : ${sessionScope.mobile}</p>
		</div>
		<div class="button-group">
			<c:choose>
				<c:when test="${sessionScope.id != 'admin'}">
					<button class="searchBtn" type="button" 
						onclick="location.href='update'">회원 수정</button>
					<button class="cancel-searchBtn" type="button" 
						onclick="location.href='delete'">회원 삭제</button>
				</c:when>
			</c:choose>
		</div>
	</div>
</div>

<c:import url="/footer" />