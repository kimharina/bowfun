<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/header" />
<br><br>

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

<title>shop</title>

<script>
	$(document).on(
			'click',
			'#btnSave',
			function(e) {
				e.preventDefault();
				$("#form").attr('action',
						"${pageContext.request.contextPath}/shopWriteProc");
				$("#form").submit();
			});

	$(document).on('click', '#btnList', function(e) {
		e.preventDefault();
		location.href = "${pageContext.request.contextPath}/kmart";
	});
</script>

<style>
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

.meddle {
	margin-bottom: 10px;
}

.custom-button {
	background-color: #FDC300;
	border: 1px solid #FDC300;
	border-radius: 6px;
	margin-top: 10px;
}

/* 추가한 파일 업로드 입력란 스타일링 */
.file-input label {
	font-weight: bold;
	display: block;
	margin-top: 10px;
	margin-bottom: 5px;
}

.file-input input[type="file"] {
	width: 100%;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 3px;
	background-color: #f9f9f9;
	transition: border-color 0.3s ease;
}

.file-input input[type="file"]:focus {
	border-color: #007bff;
	outline: none;
}

.file-input select {
  width: 100%;
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  line-height: 1.5;
  border: 1px solid #ced4da;
  border-radius: 0.25rem;
  background-color: #fff;
  background-clip: padding-box;
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
</style>
</head>

<body>
	<article>
		<div class="container" role="main">
			<div class="header-section">
				<div class="page-name-box">
					<div class="site-name">BOWFUN |</div>
					<div class="page-name">상품 등록</div>
				</div>
			</div>
			<form name="form" id="form" role="form" method="post"
				enctype="multipart/form-data">

				<div class="file-input">
					<label for="cnum">상품번호</label> <input type="text"
						class="form-control" name="cnum" id="cnum"
						placeholder="번호를 입력해 주세요">
				</div>

				<div class="file-input">
					<label for="category">카테고리</label>
					<select class="category" id="code" name="code">
						<c:forEach var="cate" items="${clist}">
							<option value="${cate.code}">${cate.catename}</option>
						</c:forEach>
					</select>
				</div>


				<div class="file-input">
					<label for="cname">상품이름</label> <input type="text"
						class="form-control" name="cname" id="cname"
						placeholder="상품이름을 입력해 주세요">
				</div>

				<div class="file-input">
					<label for="cimage">상품이미지</label> <input type="file" 
						name="cimage" id="cimage">
				</div>

				<div class="file-input">
					<label for="cimage1">상세이미지</label> <input type="file"
						name="cimage1" id="cimage1">
				</div>

				<div class="file-input">
					<label for="cprice">상품가격</label> <input type="text"
						class="form-control" name="cprice" id="cprice"
						placeholder="상품가격을 입력해 주세요">
				</div>
				<div style="text-align: right;">
					<input type="submit" class="btn btn-sm btn-primary custom-button"
						id="btnSave" value="등록">
					<input type="button" class="btn btn-sm btn-primary custom-button" 
						id="btnList" value="목록">
				</div>
			</form>
		</div>
	</article>
</body>
</html>
<c:import url="/footer" />