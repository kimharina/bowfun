<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Kmarket::main layout</title>
    <script src="member.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<link rel="stylesheet" href="../css/kstyle.css">
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<div id="wrapper">
		<header>
			<div class="top">
				<div>
					<c:choose>
						<c:when test="${empty sessionScope.id }">
							<a href="${context }login">로그인</a> 
						</c:when>
						<c:otherwise>
							<a href="${context }logout">로그아웃</a>
						</c:otherwise>
					</c:choose>
					<a href="${context }regist">회원가입</a> 
					<a href="">마이페이지</a> 
					<a href="kcart"> 
						<i class="fa fa-shopping-cart" aria-hidden="true">
						</i>
						장바구니
					</a>
				</div>
			</div>
			<div class="logo">
				<div>
					<a href=""> <img
						src="https://cdn.imweb.me/thumbnail/20230421/55cbee998640a.png"
						style="width: 150px; height: 90px;"></a>
					<form action="#">
						<input type="text" name="search">
						<button>
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
					</form>
				</div>
			</div>
            <br>
			<div class="text-table " style="text-align: center;">
				<div>
					<ul>
						<li><span style="color: rgb(253, 195, 0);">BOWRAUM ❘
								&nbsp;</span> <span style="color: rgb(17, 17, 17);">목록
								
<%-- 									<c:if test="${param.jsp == 'kmart'}">
									    상품보기
									</c:if> --%>
								
								</span></li>
					</ul>
				</div>
			</div>
	</div>