<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/header" />

<section>
	<!-- 슬라이더 영역 -->
	<br>
	<section class="slider">
		<ul>
			<li><a href="#"><img
					src="https://puppydog.co.kr/web/upload/appfiles/0zdpAngaKBFnlCcCqpCU4A/ff643a9b4816f7173f45188aba4c8707.jpg"
					alt="item1" /></a></li>
			<li><a href="#"><img
					src="https://puppydog.co.kr/web/upload/appfiles/0zdpAngaKBFnlCcCqpCU4A/c4f80a5d10178e13cb76c6b9dcf3fdb2.jpg"
					alt="item2" /></a></li>
			<li><a href="#"><img
					src="https://puppydog.co.kr/web/upload/appfiles/0zdpAngaKBFnlCcCqpCU4A/ab7711ce5651a8440d005cf62293ff12.jpg"
					alt="item3" /></a></li>
			<li><a href="#"><img
					src="https://puppydog09.openhost.cafe24.com/web/upload/appfiles/0zdpAngaKBFnlCcCqpCU4A/db4f9bfbcc7182cdd172831929f8b60d.png"
					alt="item4" /></a></li>
		</ul>
	</section>


	<!-- 히트상품 영역 -->
	<!-- cnum추가해야함!!! -->
	<section class="hit">
		<h3>
			<span>판매상품</span>
		</h3>
		<c:forEach var="shops" items="${ shops}">

			<article>
				<a href="kdetail?cnum=${shops.cnum}">
					<div class="thumb">
						<img src="https://bowfun-bucket.s3.ap-northeast-2.amazonaws.com/opt/tomcat/tomcat-10/webapps/bowfun/WEB-INF/classes/static/img/cimage/${shops.cimage}" alt="S3 Image" width="230" height="230">
					</div>
					<h2>
						<c:out value="${shops.cname}" />
					</h2>
					<p>
						<c:out value="${shops.catename}" />
					</p>
					<div class="dis_price">
						<fmt:formatNumber value="${shops.cprice}" pattern="###,###,###"
							var="formattedPrice" />
						<ins>${formattedPrice}</ins>
						<span class="free">무료배송</span>
					</div>
				</a>
			</article>
		</c:forEach>
	</section>
</section>
<c:import url="/footer" />
<script>
	$(document).ready(function() {
		$(".slider > ul").bxSlider({
			easing : "linear",
			pager : true
		// 페이지 버튼 활성화
		});
	});

	$(function() {
		var best = $("aside > .best");

		$(window).scroll(function() {
			var t = $(this).scrollTop();

			if (t > 620) {
				best.css({
					position : "fixed",
					top : "0",
				});
			} else {
				best.css({
					position : "static"
				});
			}
		});
	});
</script>
<style>
main>section>section {
	overflow: hidden;
	width: 100%;
	height: auto;
	box-sizing: border-box;
}

main>section>section>article {
	float: left;
	width: 25%;
	height: 345px;
	box-sizing: border-box;
}

h3 {
	display: block;
	font-size: 1.17em;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

main>section>.slider {
	overflow: hidden;
	width: 100%;
	height: 550px;
}

main>section>.slider>.bx-wrapper {
	height: 500px;
}

main>section>.slider>.bx-wrapper.bx-pager {
	display: block !important;
}

main>section>.hit {
	
}

main>section>.recommend {
	
}

main>section>.new {
	
}

main>section>.discount {
	
}

/*** main::베스트상품 ***/
main>aside>.best {
	width: 215px;
	height: auto;
	border: 1px solid #dbdbdb;
	box-sizing: border-box;
	box-shadow: 0 0 5px rgb(55 55 5/ 20%);
	position: sticky;
}

main>aside>.best>h1 {
	font-size: 14px;
	font-weight: bold;
	color: #111;
	margin: 6px;
}

main>aside>.best>ol {
	width: 100%;
}

main>aside>.best>ol>li>a {
	display: block;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

main>aside>.best>ol>li:first-child>a>.thumb {
	position: relative;
	float: none;
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0 auto;
}

main>aside>.best>ol>li:first-child>a>.thumb>i {
	width: 35px;
	height: 26px;
}

main>aside>.best>ol>li>a>.thumb>i {
	position: absolute;
	left: 0;
	top: 0;
	display: inline-block;
	font-size: 14px;
	padding: 0;
	color: #ef3e42;
	border-bottom: 1px solid #ef3e42;
	font-weight: bold;
	font-style: italic;
	text-align: center;
	line-height: 18px;
}

main>aside>.best>ol>li>a>.thumb>img {
	width: 100%;
}

main>aside>.best>ol>li>a h2 {
	margin-top: 4px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

main>aside>.best>ol>li>a h2:hover {
	text-decoration: underline;
}

main>aside>.best>ol>li>a .org_price {
	
}

main>aside>.best>ol>li>a .org_price>del {
	font-size: 10px;
	color: #aaa;
}

main>aside>.best>ol>li>a .org_price>del::after {
	content: "원";
}

main>aside>.best>ol>li>a .org_price>span {
	color: #eb000a;
	font-size: 10px;
}

main>aside>.best>ol>li>a .org_price>span::after {
	content: "↓";
}

main>aside>.best>ol>li>a .dis_price {
	
}

main>aside>.best>ol>li>a .dis_price>ins {
	font-size: 14px;
	text-decoration: none;
}

main>aside>.best>ol>li>a .dis_price>ins::after {
	content: "원";
}

main>aside>.best>ol>li {
	width: 100%;
	height: 100%;
	padding: 0 6px;
	box-sizing: border-box;
	margin-bottom: 16px;
}

main>aside>.best>ol>li>a>.thumb {
	float: left;
	position: relative;
	width: 50px;
	height: 50px;
	overflow: hidden;
	margin: 0 auto;
	box-sizing: border-box;
}

main>aside>.best>ol>li>a>article {
	float: left;
	width: 148px;
	padding-left: 6px;
	box-sizing: border-box;
}

/*** main::slider ***/
main>section>.slider {
	
}

/*** main::hit ***/
main>section>.hit {
	
}

main>section>section {
	width: 100%;
	height: auto;
	overflow: hidden;
}

main>section>section>h3>span {
	display: inline-block;
	margin: 10px;
	border-bottom: 2px solid #111;
	font-weight: bold;
	font-size: 16px;
}

main>section>section>article {
	float: left;
	width: 25%;
	height: 345px;
}

main>section>section>article>a {
	display: block;
	width: 100%;
	height: 100%;
	padding: 10px;
	box-sizing: border-box;
}

main>section>section>article h2 {
	font-size: 15px;
	font-weight: bold;
	margin-top: 4px;
	text-align: center;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

main>section>section>article p {
	color: #222;
	font-size: 12px;
	line-height: 16px;
	margin: 4px 0;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

main>section>section>article p:hover {
	text-decoration: underline;
}

main>section>section>article .org_price>del {
	color: #aaa;
}

main>section>section>article del::after {
	content: "원";
}

main>section>section>article .org_price>span {
	color: #eb000a;
	font-size: 10px;
}

main>section>section>article .org_price>span::after {
	content: "↓";
}

main>section>section>article .dis_price {
	
}

main>section>section>article .dis_price>ins {
	font-size: 14px;
	text-decoration: none;
}

main>section>section>article ins::after {
	content: "원";
}

main>section>section>article .dis_price>.free {
	display: inline-block;
	font-size: 0;
	vertical-align: text-bottom;
	width: 55px;
	height: 13px;
	background-image: url(./img/ico_freeshipping.gif);
}

/* branch test */
</style>