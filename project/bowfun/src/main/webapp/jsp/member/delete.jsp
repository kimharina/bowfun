<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<link rel="stylesheet" href="css/deletestyle.css">

<div class="center">
	<div class="container">
	    <h1 class="title">회원 탈퇴</h1>
	    <h4 class="error-msg">${msg}</h4>
	    <table class="form-container">
	        <tr>
	            <td>
	                <form action="deleteProc" method="post">
	                    <input class="input-field" type="text" value="${sessionScope.id}" readonly="readonly"><br>
	                    <input class="input-field" type="password" placeholder="비밀번호" name="pw"><br>
	                    <input class="input-field" type="password" placeholder="비밀번호 확인" name="confirm"><br>
	                    <input class="deleteBtn" type="submit" value="회원 탈퇴">
	                    <input class="cancel-deleteBtn" type="button" value="취소" onclick="history.back()">
	                </form>
	            </td>
	        </tr>
	    </table>
	</div>
</div>

<c:import url="/footer" />