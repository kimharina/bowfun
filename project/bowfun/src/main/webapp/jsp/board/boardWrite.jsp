<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" /> 
<html>

<head>
    <meta charset="UTF-8">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

    <title>board</title>

    <script>
	$(document).on('click', '#btnSave', function(e){
        e.preventDefault();
        $("#form").attr('action', "${pageContext.request.contextPath}/boardWriteProc");
        $("#form").submit();
    });

    $(document).on('click', '#btnList', function(e){
        e.preventDefault();
        location.href = "${pageContext.request.contextPath}/boardForm";
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
            margin-bottom:10px;
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
</head>

<body>
    <article>
        <div class="container" role="main">
            <div class="header-section">
                <div class="page-name-box">
                    <div class="site-name">BOWFUN | </div>
                    <div class="page-name">게시판</div>
                </div>
            </div>
             <form name="form" id="form" role="form" method="post" enctype="multipart/form-data"> 
            
          <div class="meddle">
                    <label for="title">제목</label>
                    <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
                </div>

                <div class="meddle">
                    <label for="id">작성자</label>
                    <input type="text" class="form-control" value="${sessionScope.id}">
                </div>

                <div class="meddle">
                    <label for="content">내용</label>
                    <textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요"></textarea>
                </div>

                <div class="meddle">
                    <label for="fileName">파일첨부</label>
                    <input type="file" name="FileName">
                </div>
                
                <div>
              <!--   <button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button> -->
                <input type="submit" class="btn btn-sm btn-primary custom-button"  id="btnSave"value="저장"	 >
                <input type="button" class="btn btn-sm btn-primary custom-button" id="btnList" value="목록"	 >
            </div>
            </form>

            
        </div>
    </article>
</body>
<c:import url="/footer" />
</html>

