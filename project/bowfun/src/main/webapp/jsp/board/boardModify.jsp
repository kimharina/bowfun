<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <c:import url="/header" /> 

<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<title>게시글 수정 페이지</title>

<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}

* {
	box-sizing: border-box;
}

ul, li {
	list-style: none;
	padding: 0;
	margin: 0;
}

.header-section {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
}

.page-name-box {
	display: flex;
	  margin-top:20px;
}

.site-name {
	font-size: 28px;
	font-weight: 900;
	color: rgb(253, 195, 0);
	margin-right: 10px;
}

.page-name {
	font-size: 28px;
	font-weight: 900;
}

.meddle {
	margin-bottom: 10px;
}

.custom-button {
		
  background-color: #FB8E23;
    border: 1px solid #FB8E23; /* 테두리 스타일과 색상을 지정합니다. */
    border-radius: 5px; /
  }
</style>

<article>
	<div class="container" role="main">
		<div class="header-section">
			<div class="page-name-box">
				<div class="site-name">BOWFUN |</div>
				<div class="page-name">게시판</div>
			</div>
		</div>
	
		<form action="boardModifyProc" role="form" method="post"> 
			<!--   <form name="form" id="form" role="form" method="post" enctype="multipart/form-data">  -->
			<input type="hidden" name="no" value="${board.no }" />
			<div class="meddle">
				<label for="title">제목</label>
				<input type="text" class="form-control" name="title" id="title" value=${board.title }>
			</div>


			<div class="meddle">
				<label for="content">내용 수정</label>
				<textarea class="form-control" rows="5" name="content" id="content">${board.content }</textarea>
			</div>

			<div class="meddle">
				<label for="fileName">파일첨부</label> <input type="file"
					name="FileName" value="${board.fileName }">
			</div>




			<div>
				<input type="submit" class="btn btn-sm btn-primary custom-button" id="btnSave"
						value="제출">
				<button type="button" class="btn btn-sm btn-primary custom-button"
					onclick="location.href='boardForm'">목록</button>
				<button type="button" class="btn btn-sm btn-primary custom-button" id="btnbefore"
					onclick="history.back()">이전</button>

			</div>

		</form>
	</div>
</article>
</body>
</html>
<c:import url="/footer" />