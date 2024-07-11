<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/header" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 목록</title>
<style>
  * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
  }

  .notice-item{
    display: flex;
    align-items: center;
    height: 40px;
    border-bottom: 1px solid #ddd;

  }

  .notice-item.header>div{
     text-align: center;
}
  .notice-item .no{
  width:30px;
  }
  .notice-item .id{
   width:80px;
    text-align: center;
  }
  .notice-item .writeDate{
   width:80px;
  }
  
  .notice-item .views {
    width: 70px;
    text-align: center;
  
  }

  .notice-item .title {
 
    flex: 1;
    text-align: center;
  }

  .header-section {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
    padding: 10px;
  }

  .site-name {
    font-size: 36px;
    font-weight: 900;
    color: rgb(253, 195, 0);
    margin-right: 10px;
  }

  .page-name {
    font-size: 36px;
    font-weight: 900;

  }
  .page-name-box{
    display: flex;
  }

  .button-box button {
    background-color: #fff;
    border: 1px solid black;
    padding: 8px 12px;
  }
  
  .vi{
   display: flex; 
   justify-content: center;
  
  }
  
</style>
</head>
<body>
  <div class="header-section">
    <div class="page-name-box">
      <div class="site-name">BOWFUN | </div>
      <div class="page-name">공지사항</div>
    </div>
  
      <div class="button-box">
  <c:choose>
    <c:when test="${sessionScope.id == 'admin'}">  <!-- admin으로 로그인 했을때만 글쓰기 버튼 생성 -->
      <button type="button" onclick="location.href='NoticeWrite'">글쓰기</button>
    </c:when>
  </c:choose>
    </div>
    
  </div>
  <div class="table-section">
    <ul class="notice-list">
      <li class="notice-item header">
        <div class="no">No</div>
        <div class="id">ID</div>
        <div class="title">제목</div>
        <div class="writeDate">작성시간</div>
        <div class="views">조회수</div>
      </li>
      <c:choose>
        <c:when test="${empty Notices}">
          <li class="notice-item">
            <div class="notice-title" colspan="3">등록된 데이터가 존재하지 않습니다.</div>
          </li>
        </c:when>
        <c:otherwise>
          <c:forEach var="Notice" items="${Notices}">
            <li class="notice-item">
              <div  class="no" onclick="location.href='NoticeContent?no=${Notice.no }'">${Notice.no}</div>       
              <div class="id">${Notice.id}</div>
              <div class="title" onclick="location.href='NoticeContent?no=${Notice.no }'">${Notice.title}</div>
              <div class="writeDate">${Notice.writeDate}</div>
              <div class="views">${Notice.views}</div>
            </li>
          </c:forEach>
          <li>
            <div class=vi colspan="5">${result}</div>
          </li>
        </c:otherwise>
      </c:choose>
    </ul>
  </div>
</body>
</html>
<c:import url="/footer" />