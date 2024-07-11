<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>BOWFUN</title>
<script src="member.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://kit.fontawesome.com/20962f3e4b.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css" />
<link rel="stylesheet" href="css/kstyle.css" />
<link rel="stylesheet" href="css/style.css"/>
<style>

.sub-item a {
  font-size: 16px; /* 원하는 크기(px)를 입력하세요 */

}


</style>


</head>
<body>
	<div id="wrapper">
		<header>
			<div class="top">
				<div class="logo">
					<a href="mainForm"> <img src="img/bowfun.png"
						style="width: 120px; height: 82px;"></a>
				</div>



				<div class="nav">
					
					
					<div class="menu-list">
						<c:choose>
							<c:when test="${sessionScope.id == 'admin'}">
								<div class="menu-item">
							<div class="label">관리자 페이지</div></a>
								<div class="sub-list">
									<div class="sub-item">
										<a href="memberInfo">회원 관리</a>
									</div>
									<div class="sub-item">
										<a href="shopWrite">판매상품 관리</a>
									</div>
								</div>
							</div>
							</c:when>
						</c:choose>
						
						<div class="menu-item">
						<a href="mainForm">
							<div class="label">홈</div>
						</a>
						</div>
						
					<div class="menu-item">
					<a href="introductionForm">
						<div class="label">BOWFUN 소개</div>
					</a>
						<div class="sub-list">
							<div class="sub-item">
								<a href="introductionForm">CEO 인사말</a>
							</div>
						<div class="sub-item">
							<a href="peopleForm">운영진 소개</a>
						</div>
						</div>
					</div>
							
							
					<div class="menu-item">
					<a href="kakaomap">
						<div class="label">지도 안내</div>
					</a> 
					</div>

					<div class="menu-item">
					<a href="kmart">
						<div class="label">판매 상품</div>
					</a> 
					</div>
							
					<div class="menu-item">
					<a href="boardForm">
						<div class="label">공지 및 게시판</div>
					</a>
						<div class="sub-list">
							<div class="sub-item">
								<a href="NoticeForm">공지사항</a>
							</div>
							<div class="sub-item">
								<a href="boardForm">게시판</a>
							</div>
						</div>
					</div>
					</div>
						
						
						<div class="action-list">
							<c:choose>
								<c:when test="${empty sessionScope.id }">
									<a href="${context }login">LOGIN</a>
								</c:when>
								<c:otherwise>
									<a href="${context }logout">LOGOUT</a>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${empty sessionScope.id}">
									<a href="${context }regist">SIGN UP</a>
								</c:when>
								<c:otherwise>
									<a href="userCheck?id=${sessionScope.id}">MY PAGE</a> 
								</c:otherwise>
							</c:choose>
							<a href="kcart">
							<i class="fa fa-shopping-cart" 
								aria-hidden="true"></i> CART
							</a>
						</div>
					</div>
				</div>
			</div>
		<main id="product">