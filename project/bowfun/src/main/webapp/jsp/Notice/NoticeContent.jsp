<NoticeContent>                                                            <%@ page language="java" contentType="text/html; charset=UTF-8"
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

<title>게시글 상세 페이지</title>

<script>
   function deleteCheck() {
      result = confirm('진짜로 삭제하겠습니까?');
      if (result == true) {
         location.href = 'NoticeDeleteProc?no=${Notice.no}'
      }
   }
</script>
<script>
   $(document).on('click', '#btnModify', function(e) {
      e.preventDefault();
      $("#form").attr('action', "/NoticeModify");
      $("#form").submit();
   });
   $(document).on('click', '#btnDelete', function(e) {
      e.preventDefault();
      $("#form").attr('action', "/ NoticeDeleteProc");
      // $("#form").submit();
   });

   $(document).on('click', '#btnList', function(e) {
      e.preventDefault();
      location.href = "/NoticeForm";
   });
</script>

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
   background-color: #FB8E23;
   border: 1px solid #FB8E23; /* 테두리 스타일과 색상을 지정합니다. */
   border-radius: 5px;
   /
}
</style>
</head>

<body>
   <article>
      <div class="container" role="main">
         <div class="header-section">
            <div class="page-name-box">
               <div class="site-name">BOWFUN |</div>
               <div class="page-name">공지사항</div>
            </div>
         </div>
         <form name="form" id="form" role="form" method="post"
            enctype="multipart/form-data">

            <div class="meddle">
               <label for="title">작성일</label>
               <div class="form-control" name="writeDate" id="writeDate">${Notice.writeDate }</div>
            </div>

            <div class="meddle">
               <label for="id">작성자</label>
               <div class="form-control" name="id" id="id">${Notice.id }</div>
            </div>


            <div class="meddle">
               <label for="title">제목</label>
               <div class="form-control" name="title" id="title">${Notice.title}</div>
            </div>


            <div class="meddle">
               <label for="content">내용</label>
               <div class="form-control" rows="5" name="content" id="content">${Notice.content }</div>
            </div>



            <div test="${not empty Notice.fileName}"></div>


            <div class="meddle">
               <label for="fileName">파일 이름</label>
               <div class="form-control" id="FileName">${Notice.fileName}</div>
            </div>


            <a href="NoticeDownload?no=${Notice.no}">파일 다운로드</a>




            <div>
               <!--   <button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button> -->
 <c:choose>
  <c:when test="${sessionScope.id == 'admin'}"> 
               <button type="button" class="btn btn-sm btn-primary custom-button"
                  onclick="location.href='NoticeForm'">목록</button>
               <button type="button" class="btn btn-sm btn-primary custom-button"
                  onclick="location.href='NoticeModify?no=${Notice.no }'">수정</button>
               <button type="button" class="btn btn-sm btn-primary custom-button"
                  id="btnDelete" onclick="deleteCheck()">삭제</button>
                    </c:when>
  </c:choose>

 
            </div>
         </form>

 
      </div>
   </article>
</body>
</html>
<c:import url="/footer" />


