<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<link rel="stylesheet" href="css/infostyle.css">

<div class="center">
	<div class="container">
	    <h1 class="title">회원 수정</h1>
	    <h4 class="error-msg">${msg}</h4>
	    <table>
	        <tr>
	            <td>
	                <form action="updateProc" method="post" id="f">
	                    <input class="input-field" type="text" value="${sessionScope.id}" id="id" readonly="readonly"><br>
	                    <c:choose>
	                    	<c:when test="${sessionScope.id != 'admin'}">
	                    		<input class="input-field" type="password" name="pw" placeholder="비밀번호" id="pw"><br>
	                    		<input class="input-field" type="password" name="confirm" placeholder="비밀번호 확인" id="confirm" onchange="pwCheck()"><br>
	                    	</c:when>
	                    </c:choose>
	                    <input class="input-field" type="text" name="email" value="${sessionScope.email}" readonly="readonly"><br>
	                    <input class="input-field" type="text" name="userName" id="userName" value="${sessionScope.userName}"><br>
	                    <input class="input-field" type="text" name="mobile" value="${sessionScope.mobile}"><br>
	                    <input class="input-field" type="text" name="address" value="${sessionScope.address}"><br><br>
	                    <input class="updateBtn" type="button" value="회원 수정" onclick="allCheck()">
	                    <input class="cancel-updateBtn" type="button" value="취소" onclick="history.back()"><br>
	                </form>
	            </td>
	        </tr>
	    </table>
	</div>
</div>

<c:import url="/footer" />