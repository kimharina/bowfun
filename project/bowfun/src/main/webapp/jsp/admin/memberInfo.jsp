<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:import url="/header" />
<link rel="stylesheet" href="css/infostyle.css">
<style>
.header-section {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
}

.page-name-box {
	display: flex;
}

.site-name {
	font-size: 32px;
	font-weight: 900;
	color: rgb(253, 195, 0);
	margin-right: 10px;
}

.page-name {
	font-size: 32px;
	font-weight: 900;
}
</style>

	<div class="info-wrapper" align="center">
	<div class="header-section">
		<div class="page-name-box">
			<div class="site-name">BOWFUN |</div>
			<div class="page-name">회원 관리</div>
		</div>
	</div>
		<h4 class="error-msg">${msg}</h4>
		<c:choose>
			<c:when test="${empty members}">
				<h1> 등록된 데이터가 존재하지 않습니다 </h1>
			</c:when>
			<c:otherwise>
				<table class="tableLine">
					<thead>
						<tr>
							<th class="th">아이디</th>
							<th class="th">이름</th>
							<th class="th">이메일</th>
							<th class="th">우편번호</th>
							<th class="th">주소</th>
							<th class="th">전화번호</th>
							<th class="th">회원 삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="member" items="${members}">
							<tr>
								<td class="td">${member.id}</td>
								<td class="td">${member.userName}</td>
								<td class="td">${member.email}</td>
								<td class="td">${fn:split(member.address, ',')[0]}</td>
								<td class="td">${fn:split(member.address, ',')[1]},${fn:split(member.address, ',')[2]}</td>
								<td class="td">${member.mobile}</td>
								<td class="td">
									<a href="adminDelete?id=${member.id}">삭제</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<div>
				<div class="page">${result}</div>
				<form class="search-form" action="memberInfo">
					<select class="search-select" name="select">
						<c:choose>
							<c:when test="${select == 'id' }">
								<option value="">전체</option>
								<option value="id" selected="selected">아이디</option>
								<option value="mobile">전화번호</option>
							</c:when>
							<c:when test="${select == 'mobile' }">
								<option value="">전체</option>
								<option value="id" >아이디</option>
								<option value="mobile" selected="selected">전화번호</option>
							</c:when>
							<c:otherwise>
								<option value="" selected="selected">전체</option>
								<option value="id">아이디</option>
								<option value="mobile">전화번호</option>
							</c:otherwise>
						</c:choose>
					</select>
					<c:choose>
						<c:when test="${empty search or search == 'null'}">
							<input class="search-input" type="text" name="search" placeholder="검색"/>
						</c:when>
						<c:otherwise>
							<input class="search-input" type="text" name="search" value="${search}" placeholder="검색"/>
						</c:otherwise>
					</c:choose>
					<input class="realSearchBtn" type="submit" value="검색" />
				</form>
				</div>
		</c:otherwise>
	</c:choose>
	</div>
<c:import url="/footer" />