<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Kmarket::main layout</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="./css/product.css">
</head>
<body>
    <div id="wrapper">
        <header>
            <div class="top">
                <div>
                    <a href="">로그인</a>
                    <a href="">회원가입</a>
                    <a href="">마이페이지</a>
                    <a href="">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        장바구니
                    </a>
                </div>
            </div>
            <div class="logo">
                <div>
                    <a href="#">
                        <img src="../img/header_logo.png" alt="헤더로고">
                    </a>
                    <form action="#">
                        <input type="text" name="search">
                        <button>
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </form>
                </div>
            </div>
            <div class="menu">
                <div>
                    <ul>
                        <li><a href="#">히트상품</a></li>
                        <li><a href="#">추천상품</a></li>
                        <li><a href="#">최신상품</a></li>
                        <li><a href="#">인기상품</a></li>
                        <li><a href="#">할인상품</a></li>
                    </ul>
                    <ul>
                        <li><a href="#">쿠폰존</a></li>
                        <li><a href="#">사용후기</a></li>
                        <li><a href="#">개인결제</a></li>
                        <li><a href="#">고객센터</a></li>
                        <li><a href="#">FAQ</a></li>
                    </ul>
                </div>
            </div>
        </header>
        <main id="product">
            <aside>
                <ul class="category">
                    <li>
                        <i class="fa fa-bars" aria-hidden="true"></i>카테고리
                    </li>
                        <li>
                        <a href="#">
                            <i class="fas fa-tshirt" aria-hidden="true"></i>패션·의류·뷰티
                            </i>
                        </a>
                        <ol>
                            <li>
                                <a href="#">남성의류</a>
                            </li>
                            <li>
                                <a href="#">여성의류</a>
                            </li>
                            <li>
                                <a href="#">잡화</a>
                            </li>
                            <li>
                                <a href="#">뷰티</a>
                            </li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-laptop" aria-hidden="true"></i>가전·디지털
                            </i>
                        </a>
                        <ol>
                            <li>
                                <a href="#">노트북/PC</a>
                            </li>
                            <li>
                                <a href="#">가전</a>
                            </li>
                            <li>
                                <a href="#">휴대폰</a>
                            </li>
                            <li>
                                <a href="#">기타</a>
                            </li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-utensils" aria-hidden="true"></i>식품·생필품
                            </i>
                        </a>
                        <ol>
                            <li>
                                <a href="#">신선식품</a>
                            </li>
                            <li>
                                <a href="#">가공식품</a>
                            </li>
                            <li>
                                <a href="#">건강식품</a>
                            </li>
                            <li>
                                <a href="#">생필품</a>
                            </li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-home" aria-hidden="true"></i>홈·문구·취미
                            </i>
                        </a>
                        <ol>
                            <li>
                                <a href="#">가구/DIY</a>
                            </li>
                            <li>
                                <a href="#">침구·커튼</a>
                            </li>
                            <li>
                                <a href="#">생활용품</a>
                            </li>
                            <li>
                                <a href="#">사무용품</a>
                            </li>
                        </ol>
                    </li>
                </ul>
            </aside>
            <section class="list">
                <nav>
                    <h1>상품목록</h1>
                    <p>
                        HOME > 
                        <span>패션·의류·뷰티</span>
                        > 
                        <strong>남성의류</strong>
                    </p>
                </nav>
                <ul class="sort">
                    <li>
                        <a href="#" class="on">판매많은순</a>
                    </li>
                    <li>
                        <a href="#">낮은가격순</a>
                    </li>
                    <li>
                        <a href="#">높은가격순</a>
                    </li>
                    <li>
                        <a href="#">평점높은순</a>
                    </li>
                    <li>
                        <a href="#">후기많은순</a>
                    </li>
                    <li>
                        <a href="#">최근등록순</a>
                    </li>
                </ul>
                <table>
                    <tr>
                        <td><a href="#" class="thumb">
                            <img src="	https://via.placeholder.com/120x120" alt="상품이미지">
                        </a></td>
                        <td>
                            <h3 class="name">상품명</h3>
                            <a href="#" class="desc">상품설명</a>
                        </td>
                        <td>
                            <ul>
                                <li><ins class="dis-price">27,000</ins></li>
                                <li>
                                    <del class="org-price">30,000</del>
                                    <span class="discount">10%</span>
                                </li>
                                <li><span class="free-delivery">무료배송</span></li>
                            </ul>
                        </td>
                        <td>
                            <h4 class="seller"><i class="fas fa-home" aria-hidden="true"></i> 판매자
                            </h4>
                            <h5 class="badge power">판매자등급</h5>
                            <h6 class="rating star1">상품평</h6>
                        </td>
                    </tr>
                    <tr>
                        <td><a href="#" class="thumb">
                            <img src="	https://via.placeholder.com/120x120" alt="상품이미지">
                        </a></td>
                        <td>
                            <h3 class="name">상품명</h3>
                            <a href="#" class="desc">상품설명</a>
                        </td>
                        <td>
                            <ul>
                                <li><ins class="dis-price">27,000</ins></li>
                                <li>
                                    <del class="org-price">30,000</del>
                                    <span class="discount">10%</span>
                                </li>
                                <li><span class="free-delivery">무료배송</span></li>
                            </ul>
                        </td>
                        <td>
                            <h4 class="seller"><i class="fas fa-home" aria-hidden="true"></i> 판매자
                            </h4>
                            <h5 class="badge power">판매자등급</h5>
                            <h6 class="rating star2">상품평</h6>
                        </td>
                    </tr>
                    <tr>
                        <td><a href="#" class="thumb">
                            <img src="	https://via.placeholder.com/120x120" alt="상품이미지">
                        </a></td>
                        <td>
                            <h3 class="name">상품명</h3>
                            <a href="#" class="desc">상품설명</a>
                        </td>
                        <td>
                            <ul>
                                <li><ins class="dis-price">27,000</ins></li>
                                <li>
                                    <del class="org-price">30,000</del>
                                    <span class="discount">10%</span>
                                </li>
                                <li><span class="free-delivery">무료배송</span></li>
                            </ul>
                        </td>
                        <td>
                            <h4 class="seller"><i class="fas fa-home" aria-hidden="true"></i> 판매자
                            </h4>
                            <h5 class="badge power">판매자등급</h5>
                            <h6 class="rating star3">상품평</h6>
                        </td>
                    </tr>
                    <tr>
                        <td><a href="#" class="thumb">
                            <img src="	https://via.placeholder.com/120x120" alt="상품이미지">
                        </a></td>
                        <td>
                            <h3 class="name">상품명</h3>
                            <a href="#" class="desc">상품설명</a>
                        </td>
                        <td>
                            <ul>
                                <li><ins class="dis-price">27,000</ins></li>
                                <li>
                                    <del class="org-price">30,000</del>
                                    <span class="discount">10%</span>
                                </li>
                                <li><span class="free-delivery">무료배송</span></li>
                            </ul>
                        </td>
                        <td>
                            <h4 class="seller"><i class="fas fa-home" aria-hidden="true"></i> 판매자
                            </h4>
                            <h5 class="badge power">판매자등급</h5>
                            <h6 class="rating star4">상품평</h6>
                        </td>
                    </tr>
                    <tr>
                        <td><a href="#" class="thumb">
                            <img src="	https://via.placeholder.com/120x120" alt="상품이미지">
                        </a></td>
                        <td>
                            <h3 class="name">상품명</h3>
                            <a href="#" class="desc">상품설명</a>
                        </td>
                        <td>
                            <ul>
                                <li><ins class="dis-price">27,000</ins></li>
                                <li>
                                    <del class="org-price">30,000</del>
                                    <span class="discount">10%</span>
                                </li>
                                <li><span>배송비 2500</span></li>
                            </ul>
                        </td>
                        <td>
                            <h4 class="seller"><i class="fas fa-home" aria-hidden="true"></i> 판매자
                            </h4>
                            <h5 class="badge power">판매자등급</h5>
                            <h6 class="rating star5">상품평</h6>
                        </td>
                    </tr>
                </table>
                <div class="paging">
                    <span class="prev">
                        <a href="#">< 이전</a>
                    </span>
                    <span class="num">
                        <a href="#" class="on">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#">6</a>
                        <a href="#">7</a>
                    </span>
                    <span class="next">
                        <a href="#">다음 ></a>
                    </span>
                </div>
            </section>
        </main>
        <footer>
            <ul>
                <li><a href="#">회사소개</a></li>
                <li><a href="#">서비스이용약관</a></li>
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">전자금융거래약관</a></li>
            </ul>
            <div>
                <p><img src="../img/footer_logo.png" alt="푸터로고"></p>
                <p>
                    <strong>(주)KMARKET</strong>
                    <br>
                    부산시 강남구 테헤란로 152 (역삼동 강남파이낸스센터)
                    <br>
                    대표이사 : 홍길통
                    <br>
                    사업자등록번호 : 220-81-83676 사업자정보확인
                    <br>
                    통신판매업신고 : 강남 10630호 Fax : 02-589-8842
                </p>
                <p>
                    <strong>고객센터</strong>
                    <br>
                    Tel : 1234-5678 (평일 09:00~18:00)
                    <br>
                    스마일클럽/SVIP 전용 : 1522-5700 (365일 09:00~18:00)
                    <br>
                    경기도 부천시 원미구 부일로 223(상동) 투나빌딩 6층
                    <br>
                    Fax : 051-123-4567 | Mail : kmarket@kmarket.co.kr
                    <br>
                </p>
            </div>
        </footer>
        <button type="button" id="top">상단이동</button>
    </div>
</body>
</html>
<style>
	/* 공통 */

* {
    margin: 0px;
    padding: 0px;
    font: 12px 고딕;
}

ul, ol { list-style: none; }

a {
    text-decoration: none;
    color: #111;
}

input, textarea { outline: none; }

#wrapper { width: 100%; }

/* 헤더 */

header {
    width: 100%;
    height: 197px;
}

header > div {
    width: 100%;
    box-sizing: border-box;
}

header > .top {
    height: 35px;
    border-bottom: 1px solid #e9e9e9;
}

header > .top > div {
    width: 1200px;
    height: 100%;
    margin: 0 auto;
    text-align: right;
}

header > .top > div > a {
    display: inline-block;
    height: 100%;
    line-height: 35px;
    border-left: 1px solid #e9e9e9;
    padding: 0 10px;
    color: #646464;
}

header > .top > div > a:hover {
    color: #333;
    border-bottom: 1px solid #444;
}

header > .top > div > a:last-child {
    border-right: 1px solid #e9e9e9;
}

header > .logo {
    height: 115px;
    border-bottom: 1px solid #e9e9e9;
}

header > .logo > div {
    position: relative;
    width: 1200px;
    height: 100%;
    margin: 0 auto;
}

header > .logo > div > a {
    display: inline-block;
    margin-top: 30px;
}

header > .logo > div > form {
    position: absolute;
    left: 50%;
    top: 50%;
    margin-left: -185px;
    margin-top: -22px;
    display: inline-block;
    width: 370px;
    height: 45px;
}

header > .logo > div > form > input {
    position: absolute;
    width: 100%;
    height: 100%;
    border: 1px solid #e9e9e9;
    border-radius: 5px;
    font-size: 20px;
    padding-left: 10px;
    padding-right: 30px;
    box-sizing: border-box;
}

header > .logo > div > form > button {
    position: absolute;
    right: 6px;
    top: 10px;
    background: #fff;
    border: none;
    font-size: 20px;
    color: #333;
    outline: none;
}

header > .menu {
    height: 46px;
    background: #f2f2f2;
    border-bottom: 1px solid #ddd;
    box-sizing: border-box;
}

header > .menu > div {
    width: 1200px;
    height: 100%;
    margin: 0 auto;
}

header > .menu > div > ul {
    display: inline-block;
    margin-top: 16px;
}

header > .menu > div > ul:nth-child(1) { float: left; }

header > .menu > div > ul:nth-child(2) { float: right; }

header > .menu > div > ul > li:last-child { border-right: 1px solid #e9e9e9; }

header > .menu > div > ul > li { float: left;}

header > .menu > div > ul > li > a {
    border-left: 1px solid #e9e9e9;
    padding: 0 10px;
}

/* 메인 */

main {
    width: 1200px;
    height: auto;
    margin: 0 auto;
    overflow: hidden;
}

main > aside {
    float: left;
    width: 215px;
    height: 100%;
}

main > aside > .category {
    position: relative;
    width: 100%;
    height: 425px;
    background: #333949;
}

main > aside > .category > li {
    width: 100%;
    height: 40px;
    line-height: 40px;
    color: #ccc;
    font-size: 13px;
    font-weight: bold;
    border-bottom: 1px solid #2b313f;
    box-sizing: border-box;
}

main > aside > .category > li:nth-child(1){
    padding: 0 20px;
    color: #fff;
    line-height: 40px;
}

main > aside > .category > li > a {
    display: block;
    padding: 0 20px;
    line-height: 40px;
    color: #ccc;
    font-weight: bold;
    text-decoration: none;
    font-size: 1em;
}

main > aside > .category > li > a:hover {
    background: #2b313f;
    color: #fff;
}

main > aside > .category > li > a:hover + ol {
    display: block;
}

main > aside > .category ol:hover {
    display: block;
}   

main > aside > .category i {
    width: 22px;
    font-size: 16px;
    margin-right: 12px;
}

main > aside > .category > li i.fa-angle-right{
    float: right;
    width: auto;
    margin-top: 10px;
    margin-right: 0;
}

main > aside > .category ol {
    position: absolute;
    left: 215px;
    top: 0;
    display: none;
    width: 215px;
    height: 100%;
    border: 1px solid #787f89;
    background: #fff;
    box-sizing: border-box;
    z-index: 10000;
}

main > aside > .category ol > li {
    width: 100%;
    height: 24px;
    padding: 10px;
    box-sizing: border-box;
}

main > aside > .category ol > li > a:hover {
    color: #41ab47;
    text-decoration: underline;
}

main > section {
    float: right;
    width: 985px;
    height: auto;
    box-sizing: border-box;
}

/* 푸터 */

footer {
    width: 100%;
    height: 192px;
    background: #f8f8f8;
    border-top: 1px solid #e9e9e9;
    box-sizing: border-box;
}

footer > ul {
    width: 1200px;
    height: 39px;
    margin: 0 auto;
    padding: 15px 0;
    border-bottom: 1px solid #e9e9e9;
    box-sizing: border-box;
    text-align: center;
}

footer > ul > li {
    display: inline-block;
    font-weight: bold;
    border-right: 1px solid #d7d7d7;
    padding: 0 10px;
}

footer > ul > li:nth-child(1) { border-left: 1px solid #d7d7d7; }

footer > ul > li > a {}

footer > div {
    width: 1200px;
    height: auto;
    padding-top: 20px;
    box-sizing: border-box;
    margin: 0 auto;
}

footer > div > p {
    float: left;
    height: 100%;
    font-size: 11px;
    line-height: 15px;
    color: #676767;
}

footer > div > p:nth-of-type(2) {
    width: 300px;
    margin-left: 30px;
    margin-right: 30px;
}

footer > div > p > img {}

footer > div > p > strong {
    display: inline-block;
    padding: 6px 15px 7px 0;
    font-size: 12px;
    font-weight: bold;
}

/* 하단 버튼 */

#top {
    position: fixed;
    left: 50%;
    bottom: 10px;
    margin-left: 600px;
    width: 42px;
    height: 42px;
    background-image: url(../img/top.png);
    border: none;
    font-size: 0;
    cursor: pointer;
}



/* 상품목록 */

#product > section {
    padding: 16px;
    box-sizing: border-box;
}

#product > .list {}

#product > section > nav {
    width: 100%;
    height: 36px;
    margin-bottom: 20px;
    border-bottom: 1px solid #000;
    box-sizing: border-box;
}

#product > section > nav > h1 {
    display: inline-block;
    font-weight: bold;
    font-size: 1.5em;
    padding: 0 0 7px;
    line-height: 1em;
}

#product > section > nav > p {
    float: right;
    margin-top: 10px;
}

#product > .list > .sort {
    margin: 0 0 20px 0;
    border-top: 2px solid #111;
    border-bottom: 1px solid #dfdfdf;
    overflow: hidden;
}

#product > .list > .sort > li {
    float: left;
    position: relative;
    padding: 15px 0;
    line-height: 15px;
}

#product > .list > .sort > li > a.on {
    font-weight: bold;
}

#product > .list > .sort > li > a {
    display: block;
    padding: 0 10px;
    border-right: 1px solid #ddd;
}

#product > .list > table {
    width: 100%;
    height: auto;
    border-collapse: collapse;
}

#product > .list > table tr {
    border-bottom: 1px solid #ececec;
}

#product > .list > table tr > td {
    vertical-align: top;
    padding-top: 20px;
    padding-left: 16px;
    box-sizing: border-box;
}

#product > .list > table tr > td:nth-child(1) { width: 20%; padding: 0; }
#product > .list > table tr > td:nth-child(2) { width: 40%; }
#product > .list > table tr > td:nth-child(3) { width: 20%; }
#product > .list > table tr > td:nth-child(4) { width: 20%; }

#product > .list > table .thumb {
    display: block;
    width: 100%;
    height: 100%;
}

#product > .list > table .name {
    font-size: 16px;
    font-weight: bold;
    color: #111;
    margin-bottom: 6px;
}

#product > .list > table .desc {
    font-size: 12px;
    color: #333;
}

#product > .list > table .thumb > img { width: 120px; }

#product > .list > table .dis-price {
    font-size: 16px;
    text-decoration: none;
}

#product > .list > table .dis-price::after {
    content: "원";
}

#product > .list > table .org-price {
    font-size: 12px;
    color: #aaa;
}

#product > .list > table .org-price::after {
    content: "원";
}

#product > .list > table .discount {
    font-size: 10px;
    color: #eb000a;
}

#product > .list > table .discount::after {
    content: "↓";
}

#product > .list > table .free-delivery {
    display: inline-block;
    font-size: 0;
    vertical-align: text-bottom;
    width: 55px;
    height: 13px;
    background: url(../img/ico_free_delivery.gif) no-repeat;
    margin-top: 4px;
}

#product > .list > table .seller {
    font-size: 12px;
    margin-bottom: 6px;
}

#product .badge {
    font-size: 0;
    width: 80px;
    height: 19px;
    background-repeat: no-repeat;
}

#product .badge.power {
    background-image: url(../img/ico_power_dealer.gif);
}

#product > .list > table .rating {
    margin-top: 12px;
}

#product h6.rating {
    font-size: 11px;
    background-image: url(../img/rating_star.png);
    background-repeat: no-repeat;
    background-position: 36px 0px;
    background-size: auto 100%;
}

#product h5.rating.star1 { width: 55px; }
#product h5.rating.star1 { width: 55px; }
#product h5.rating.star1 { width: 55px; }
#product h5.rating.star4 { background-position: 0 -160px; }

#product h6.rating.star1 { width: 51px; }
#product h6.rating.star2 { width: 67px; }
#product h6.rating.star3 { width: 81px; }
#product h6.rating.star4 { width: 96px; }
#product h6.rating.star5 { width: 120px; }

#product > .list > .paging {
    width: 100%;
    padding: 30px 0;
    text-align: center;
}

#product > .list > .paging > span > a { 
    color: #777;
    font-size: 11px;
    letter-spacing: -1px;
}

#product > .list > .paging > .num > a {
    display: inline-block;
    min-width: 14px;
    margin: 0 2px;
    padding: 8px 9px;
    border: 1px solid #c4c4c4;
    color: #000;
    font-size: 12px;
    text-align: center;
    text-decoration: none;
}

/* 상품상세 */
#product > .view > article {
    width: 100%;
    height: auto;
    overflow: hidden;
}        

#product > .view > .info > div {
    float: left;
    width: 50%;
    height: 100%;
    padding: 10px;
    box-sizing: border-box;
}

#product > .view > .info > .image > img { width: 100%; }

#product > .view > .info > .summary > nav {
    border-bottom: 1px solid #eaeaea;
    padding-bottom: 10px;
    margin-bottom: 12px;
    overflow: hidden;
}

#product > .view > .info > .summary > nav > h1 {
    float: left;
    color: #0231a6;
    font-weight: bold;
    font-size: 1.5em;
}

#product > .view > .info > .summary > nav > h2 {
    float: right;
    color: #777;
    margin-top: 8px;
}

#product > .view > .info > .summary > nav > h3 {
    font-size: 18px;
    font-weight: bold;
    color: #1e2732;
}

#product > .view > .info > .summary > nav > p {
    font-size: 14px;
    color: #474747;
    line-height: 36px;
    letter-spacing: -1px;
}

#product > .view > .info > .summary > nav:nth-child(2) > .rating > a {
    color: #346aff;
    text-decoration: underline;
}

#product > .view > .info > .summary .org_price > del {
    font-size: 18px;
    color: #aaa;
}

#product > .view > .info > .summary .org_price > del::after { content: "원"; }

#product > .view > .info > .summary .org_price > span {
    color: #eb000a;
    font-size: 16px;
    margin-left: 6px;
}

#product > .view > .info > .summary .org_price > span::after { content: "↓"; }

#product > .view > .info > .summary .dis_price > ins {
    font-size: 26px;
    font-weight: bold;
    text-decoration: none;
}

#product > .view > .info > .summary .dis_price > ins::after { content: "원"; }
#product > .view > .info > .summary .delivery {
    font-size: 16px;
    color: #2e8de5;
}

#product > .view > .info > .summary .origin {
    font-size: 16px;
}

#product > .view > .info > .summary .arrival {
    font-size: 14px;
    margin-left: 10px;
}
#product > .view > .info > .summary .desc {
    display: block;
    color: #aaa;
}

#product > .view > .info > .summary .card > i {
    display: inline-block;
    width: 30px;
    height: 18px;
    top: 4px;
    font-size: 0;
    vertical-align: text-top;
    margin-right: 2px;
}

#product > .view > .info > .summary .cardfree > i { background-position: -126px 0; }

#product > .view > .info > .summary .cardadd > i { background-position: -51px -21px; }

#product > .view > .info > .summary .banner { width: 100%; }

#product > .view > .info > .summary .count {
    position: relative;
    width: 100px;
    height: 40px;
}

#product > .view > .info > .summary .count > button {
    position: absolute;
    width: 21px;
    height: 21px;
    background-image: url(../img/ico_sprites.png);
    font-size: 0;
    background-color: transparent;
    border: none;
}

#product > .view > .info > .summary .count > input[name=num] {
    position: absolute;
    left: 30px;
    top: 0;
    width: 30px;
    height: 21px;
    border: 1px solid #ececec;
    font-size: 14px;
    text-align: center;
}

#product > .view > .info > .summary .count > .decrease {
    left: 0;
    top: 0;
    background-position: 0px -74px;
}

#product > .view > .info > .summary .count > .increase {
    left: 70px;
    top: 0;
    background-position: -48px -74px;
}


#product > .view > .info > .summary .total {
    overflow: hidden;
    margin-top: 16px;
}

#product > .view > .info > .summary .total > span {
    float: right;
    display: inline-block;
    line-height: 38px;
    font-size: 24px;
    font-weight: bold;
    color: #000;
    text-align: right;
    letter-spacing: -0.5px;
}

#product > .view > .info > .summary .total > span::after { content: "원";}

#product > .view > .info > .summary .total > em {
    float: right;
    display: block;
    width: 100px;
    height: 22px;
    padding: 10px 0 0;
    font-size: 16px;
    line-height: 22px;
    color: #5e636d;
    letter-spacing: -1px;
}

#product > .view > .info > .summary .button {
    overflow: hidden;
    margin-top: 16px;
}

#product > .view > .info > .summary .button > input {
    float: left;
    width: 49%;
    height: 50px;
    margin: 2px;
    font-size: 20px;
    font-weight: bold;
    border-radius: 2px;
    cursor: pointer;
}

#product > .view > .info > .summary .button > .cart {
    background: #fff;
    border: 1px solid #d9d9d9;
    color: #233594;
}

#product > .view > .info > .summary .button > .order {
    background: #2e8de5;
    border: 1px solid #217fd7;
    color: #fff;
}

#product > .view > .review > .paging > .num > a.on {
    color: #fe434c;
    font-weight: bold;
}

#product > .view > article > nav {
    border-bottom: 1px solid #a4a9b0;
    padding: 6px 0;
    margin-bottom: 12px;
    overflow: hidden;
}

#product > .view > article > nav > p {
    float: left;
    color: #777;
    margin-top: 6px;
    margin-left: 6px;
}

#product > .view > article > nav > h1 {
    float: left;
    color: #1e2732;
    font-weight: bold;
    font-size: 1.5em;
}

#product > .view > .notice > table { width: 100%; }

#product > .view > .notice > table:nth-of-type(2) { border-top: 1px solid #ececec; }

#product > .view > .notice > table tr > td {
     padding: 5px 0 6px 21px;
     font-size: 14px;
     color: #777;
}

#product > .view > .notice > table tr > td:nth-child(1) { width: 20%; color: #222; }

#product > .view > .review > ul {
    padding: 10px;
    box-sizing: border-box;
}

#product > .view > .review > ul > li {
    padding-top: 16px;
    border-bottom: 1px solid #ececec;
    box-sizing: border-box;
}

#product > .view > .review > ul > li > div { overflow: hidden; }

#product > .view > .review > ul > li > div > span {
    float: right;
    color: #555;
}

#product > .view > .review > ul > li > div >  h5 { float: left; }

#product h5.rating {
    width: 150px;
    height: 20px;
    font-size: 0px;
    background-image: url(../img/ico_rating_star.png);
    background-repeat: no-repeat;
    background-position: 36px 0px;
    text-indent: 86px;
}

#product > .view > .review > ul > li > h3 {
    color: #555;
    margin-top: 6px;
}

#product > .view > .review > ul > li > p {
    width: 100%;
    height: 60px;
    color: #555;
    font-size: 14px;
    line-height: 19px;
    word-break: break-all;
    word-wrap: break-word;
    margin-top: 10px;
}

#product > .view > .review > .paging {
    width: 100%;
    padding: 30px 0;
    text-align: center;
}

#product > .view > .notice > .notice {
    margin: 20px 0;
    padding: 21px 26px 20px 19px;
    line-height: 20px;
    font-size: 14px;
    color: #757c8a;
    background: #fafafa;
    border-radius: 2px;
    white-space: normal;
}

#product > .view > .review >.paging > span > a { 
    color: #777;
    font-size: 11px;
    letter-spacing: -1px;
}

#product > .view > .review > .paging > .num > a {
    display: inline-block;
    min-width: 14px;
    margin: 0 2px;
    padding: 8px 9px;
    border: 1px solid #c4c4c4;
    color: #000;
    font-size: 12px;
    text-align: center;
    text-decoration: none;
}
#product > .view > .review > .paging > .num > a.on {
    color: #fe434c;
    font-weight: bold;
}


/* 장바구니 */

#product > .cart > form {}

#product > .cart > form > table {
    width: 100%;
    border-bottom: 1px solid #d3d3d3;
    border-collapse: collapse;
    border-spacing: 0;
}

#product > .cart > form > table tr { border-bottom: 1px solid #d3d3d3 ;}

#product > .cart > form > table th:first-child {width: 60px;}

#product > .cart > form > table th {
    padding: 12px 0;
    border-top: 2px solid #000;
    border-bottom: 1px solid #d3d3d3;
    background: #fff;
    color: #383838;
    font-size: 0.95em;
    text-align: center;
    letter-spacing: -0.1em;
}

#product > .cart > form > table .empty { display: none ;}

#product > .cart > form > table td { text-align: center;}

#product > .cart > form > table td:last-child {
    color: #ff006c;
    font-weight: bold;
}

#product > .cart > form > table th > input {}



#product > .cart > form > table tr > td > input {}

#product > .cart > form > table td > article {
    padding: 6px;
    overflow: hidden;
}

#product > .cart > form > table td > article > a {
    float: left;
    display: inline-block;
}

#product > .cart > form > table td > article > a > img { width: 80px;}

#product > .cart > form > table td > article > div {
    float: left;
    margin-left: 10px;
}

#product > .cart > form > table td > article > div > h2 { text-align: left; }

#product > .cart > form > table td > article > div > p {
    text-align: left;
    color: #777;
    margin-top: 4px;
}

#product > .cart > form > input[name=del] {
    border-color: #bdbdbd;
    border-bottom-color: #828282;
    background: #fafafa;
    color: #4d4d4d;
    padding: 6px 11px;
    border-width: 1px;
    margin-top: 6px;
}

#product > .cart > form > .total {
    float: right;
    width: 360px;
    height: 412px;
    padding: 20px;
    margin-top: 12px;
    background: #fff;
    border: 1px solid #d3d3d3;
    box-sizing: border-box;
}

#product > .cart > form > .total > h2 {
    width: 100%;
    font-weight: bold;
    font-size: 16px;
    border-bottom: 1px solid #111;
    margin-bottom: 10px;
    padding-bottom: 10px;
    box-sizing: border-box;
    color: #1e1e1e;
}

#product > .cart > form > .total > table { width: 100%; }

#product > .cart > form > .total > table tr:nth-last-child(1) td {
    font-size: 20px;
}

#product > .cart > form > .total > table tr:nth-last-child(1) td:last-child {
    color: #ff006c;
    font-size: 20px;
    font-weight: bold;
}

#product > .cart > form > .total > table td {
    padding: 10px 0;
    font-size: 14px;
    color: #555;
}

#product > .cart > form > .total > table td:last-child { text-align: right; }

#product > .cart > form > .total > input[type=submit] {
    width: 100%;
    height: 56px;
    font-size: 26px;
    border-width: 1px;
    border-color: #d81818;
    border-bottom-color: #9e1212;
    background: #ed2f2f;
    background-image: -webkit-linear-gradient(#ed2f2f, #dd0e0e);
    color: #fff;
    box-sizing: border-box;
    margin-top: 10px;
}
</style>