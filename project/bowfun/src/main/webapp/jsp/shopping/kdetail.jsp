<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/header" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
function requestSelectPay() {
	if (${sessionScope.id == null}) {
        window.location.href = 'login';
    } else {
	    IMP.init("imp40638066");
	    IMP.request_pay({
	        pg: "html5_inicis",
	        pay_method: "card",
	        merchant_uid: document.getElementById("userName").value + new Date().getTime(),
	        name: document.getElementById("cname").value,
	        amount: document.getElementById("cprice").value,
	        buyer_email: document.getElementById("email").value,
	        buyer_name: document.getElementById("userName").value,
	    }, function (rsp) { // callback
	        if (rsp.success) {
	            window.location.href = 'http://localhost/korder_ok';
	        } else {
	            alert("결제 실패");
	            alert(rsp.error_msg);
	            console.log(rsp);
	        }
	    });
    }
}
</script>
<section class="view">
	
	<!-- 상품 시작 -->
	<article class="info">
		<div class="image">
			<img src="https://bowfun-bucket.s3.ap-northeast-2.amazonaws.com/opt/tomcat/tomcat-10/webapps/bowfun/WEB-INF/classes/static/img/cimage/${shops.cimage}" alt="S3 Image"  style="width: 460px; height: 460px;">
		</div>
		<div class="summary">
			<nav>
				<h2>
					상품번호 : <span><c:out value="${shops.cnum}" /></span>
				</h2>
			</nav>
			<nav>
				<h3>
					<c:out value="${shops.cname}" />
				</h3>
				<p>
					<c:out value="${shops.catename}" />
				</p>
				<!--<h5 class="rating star4">
                                <a href="#">상품평보기</a>
                            </h5> -->
			</nav>
			<nav>
				<div class="dis_price">
					<fmt:formatNumber value="${shops.cprice}" pattern="###,###,###"
						var="formattedPrice" />
					<ins>${formattedPrice}</ins>
				</div>
			</nav>
			<nav>
				<span class="delivery">무료배송</span> <span class="arrival">모레(금)
					7/8 도착예정</span> <span class="desc">본 상품은 국내배송만 가능합니다.</span>
			</nav>
			<nav>
				<span class="card cardfree"> <i>아이콘</i>무이자할부
				</span> <span class="card cardadd"> <i>아이콘</i>&nbsp&nbsp카드추가혜택
				</span>
			</nav>
			<nav>
				<span class="origin">정보-상세설명 참조</span>
			</nav>

			<div class="count">
				주문수량<br>
				<div class="button_quantity">

					<button class="minus_btn">-</button>
					<input type="number" id="cntInput" name="quantity_input" value="0"
						readonly>
					<button class="plus_btn">+</button>
				</div>
			</div>
			<div class="total">
				<span>${totalPrice}</span> <em>총 상품금액</em>
			</div>
			<script type="text/javascript">

     // 페이지 로딩 시에 실행
	$(document).ready(function() {
	    // 초기 수량과 가격 설정
	    var quantity = parseInt($("#cntInput").val());
	    var pricePerUnit = ${shops.cprice}; // 상품 1개당 가격 (예시로 35000원으로 설정)
	    
	    // 총 금액 업데이트 함수
	    function updateTotalPrice() {
	        var totalPrice = quantity * pricePerUnit;
	        $(".total span").text(totalPrice.toLocaleString()); // 총 상품 금액 업데이트
	        $("#cprice").val(totalPrice);
	    }
	
	    $(".plus_btn").on("click", function() {
	        quantity++;
	        $("#cntInput").val(quantity);
	        updateTotalPrice();
	        saveQuantityToDB(quantity);
	    });
	
	    $(".minus_btn").on("click", function() {
	        if (quantity > 1) {
	            quantity--;
	            $("#cntInput").val(quantity);
	            updateTotalPrice();
	            saveQuantityToDB(quantity);
	        } else {
	            $("#cntInput").val(1);
	        }
	    });
	
	    function saveQuantityToDB(quantity) {
	        $.ajax({
	            type: "POST",
	            url: "/api/updateQuantity", // 서버의 엔드포인트 URL (수량을 업데이트하는 컨트롤러 메서드 주소)
	            data: { quantity: quantity }, // 서버로 보낼 데이터, 추가 cnum
	            success: function(response) {
	            	console.log(quantity);

           		/* alert(response); */ 
	                console.log("수량이 성공적으로 업데이트되었습니다.");
	            },
	            error: function(error) {
	                console.error("수량 업데이트 중 오류 발생: ", error);
	            }
	        });
	    console.log("현재 수량: " + ${shops.quantity});
	    }

});
     
	var plusButton = document.querySelector(".plus_btn");
	var minusButton = document.querySelector(".minus_btn");
	var cntInput = document.getElementById("cntInput");
	
	cntInput.style.width = "40px"; // 너비를 30px로 설정
	cntInput.style.height = "30px"; // 높이를 30px로 설정
	cntInput.style.border = "none"; // 테두리를 없애려면 border 속성을 설정합니다.
	cntInput.style.backgroundColor = "#F0F0F0";
	cntInput.style.textAlign = "center"; // 텍스트를 가운데 정렬하려면 textAlign 속성을 설정합니다.
	cntInput.style.fontSize = "16px"; // 글자 크기를 조절할 수도 있습니다.
	cntInput.style.borderTop = "1px solid black"; // 위 테두리
	cntInput.style.borderBottom = "1px solid black"; // 아래 테두리

	plusButton.style.width = "15px"; // 너비를 30px로 설정
	plusButton.style.height = "32px"; // 높이를 30px로 설정
	plusButton.style.backgroundColor = "#FFFFFF";
	plusButton.style.border = "1px solid black"; // 테두리를 검정색으로 설정

	
	minusButton.style.width = "15px"; // 너비를 30px로 설정
	minusButton.style.height = "32px"; // 높이를 30px로 설정
	minusButton.style.backgroundColor = "#FFFFFF";
	minusButton.style.border = "1px solid black"; // 테두리를 검정색으로 설정

</script>
			<script>
	var emailValue = "${email}";
	var userNameValue = "${userName}";
	console.log("Email: " + emailValue);
	console.log("UserName: " + userNameValue);
</script>

			<div class="button">
				<form action="addCartProc" method="POST">
					<input type="hidden" name="sessionId" value="${sessionScope.id}">
					<input type="hidden" name="cnum" value="${shops.cnum}"> <input
						type="hidden" id="quantity" name="quantity"
						value="${cart.quantity}"> <input type="submit"
						class="cart" style="height: 40px;" value="장바구니">
				</form>
				<form action="#">
					<input type="hidden" id="cname" value="${shops.cname}"> <input
						type="hidden" id="cprice" value="${shops.cprice}"> <input
						type="hidden" id="email" value="${email}"> <input
						type="hidden" id="userName" value="${userName}"> <input
						type="button" class="order" style="height: 40px;" value="구매하기"
						onclick="requestSelectPay()">
				</form>
			</div>
			<c:choose>
				<c:when test="${sessionScope.id == 'admin'}">
					<div class="button">
						<form>
							<input type="button" class="cartEditBtn" style="height: 40px;"
								onclick="location.href='shopUpdate?cnum=${shops.cnum}'"
								value="수정">
						</form>
						<form>
							<input type="button" class="cartDeleteBtn" style="height: 40px;"
								id="btnDelete" onclick="deleteCheck()" value="삭제">
						</form>
					</div>
				</c:when>
			</c:choose>
		</div>
	</article>
	<script>
	function deleteCheck() {
	    var confirmation = confirm("정말로 삭제하시겠습니까?");

	    if (confirmation) {
	        // shops.cnum의 값을 가져와서 shopDeleteProc으로 리다이렉트
	        var shopId = "${shops.cnum}";
	        location.href = "shopDeleteProc?cnum=" + shopId;
	    }
	}
	</script>

	<article class="detail">
		<nav>
			<h1>상품정보</h1>
		</nav>
		<img src="https://bowfun-bucket.s3.ap-northeast-2.amazonaws.com/opt/tomcat/tomcat-10/webapps/bowfun/WEB-INF/classes/static/img/cimage1/${shops.cimage1}" alt="S3 Image" style="width: 850px; height: 8000px;">
	</article>

	<!-- 본문 끝 -->
	<article class="notice">
		<p class="notice">소비자가 전자상거래등에서 소비자 보호에 관한 법률 제 17조 제1항 또는 제3항에 따라
			청약철회를 하고 동법 제 18조 제1항 에 따라 청약철회한 물품을 판매자에게 반환하였음에도 불구 하고 결제 대금의 환급이
			3영업일을 넘게 지연된 경우, 소비자 는 전자상거래등에서 소비자보호에 관한 법률 제18조 제2항 및 동법 시행령 제21조
			2에 따라 지연일수에 대하여 전상법 시행령으로 정하는 이율을 곱하여 산정한 지연이자(“지연배상금”)를 신청할 수 있습니다.
			아울러, 교환∙반품∙보증 및 결제대금의 환급신청은 [나의쇼핑정보]에서 하실 수 있으며, 자세한 문의는 개별 판매자에게
			연락하여 주시기 바랍니다.</p>
	</article>

	<c:import url="/footer" />

	<style>
/* 상품목록 */
#product>section {
	padding: 16px;
	box-sizing: border-box;
}

#product>.list {
	
}

#product>section>article.info>div.image>img {
	margin-left: 20px;
	margin-right: -20px;
}

#product>section>nav {
	width: 100%;
	height: 20px;
	margin-bottom: 20px;
	border-bottom: 1px solid #000;
	box-sizing: border-box;
}

#product>section>nav>h1 {
	display: inline-block;
	font-weight: bold;
	font-size: 1.5em;
	padding: 0 0 7px;
	line-height: 1em;
}

#product>section>nav>p {
	float: right;
	margin-top: 0px;
}

#product>section>article.detail {
	text-align: center; /* 이미지를 수평으로 가운데로 정렬 */
}

#product>.list>.sort {
	margin: 0 0 20px 0;
	border-top: 2px solid #111;
	border-bottom: 1px solid #dfdfdf;
	overflow: hidden;
}

#product>.list>.sort>li {
	float: left;
	position: relative;
	padding: 15px 0;
	line-height: 15px;
}

#product>.list>.sort>li>a.on {
	font-weight: bold;
}

#product>.list>.sort>li>a {
	display: block;
	padding: 0 10px;
	border-right: 1px solid #ddd;
}

#product>.list>table {
	width: 100%;
	height: auto;
	border-collapse: collapse;
}

#product>.list>table tr {
	border-bottom: 1px solid #ececec;
}

#product>.list>table tr>td {
	vertical-align: top;
	padding-top: 20px;
	padding-left: 16px;
	box-sizing: border-box;
}

#product>.list>table tr>td:nth-child(1) {
	width: 20%;
	padding: 0;
}

#product>.list>table tr>td:nth-child(2) {
	width: 40%;
}

#product>.list>table tr>td:nth-child(3) {
	width: 20%;
}

#product>.list>table tr>td:nth-child(4) {
	width: 20%;
}

#product>.list>table .thumb {
	display: block;
	width: 100%;
	height: 100%;
}

#product>.list>table .name {
	font-size: 16px;
	font-weight: bold;
	color: #111;
	margin-bottom: 6px;
}

#product>.list>table .desc {
	font-size: 12px;
	color: #333;
}

#product>.list>table .thumb>img {
	width: 120px;
}

#product>.list>table .dis-price {
	font-size: 16px;
	text-decoration: none;
}

#product>.list>table .dis-price::after {
	content: "원";
}

#product>.list>table .org-price {
	font-size: 12px;
	color: #aaa;
}

#product>.list>table .org-price::after {
	content: "원";
}

#product>.list>table .discount {
	font-size: 10px;
	color: #eb000a;
}

#product>.list>table .discount::after {
	content: "↓";
}

#product>.list>table .free-delivery {
	display: inline-block;
	font-size: 0;
	vertical-align: text-bottom;
	width: 55px;
	height: 13px;
	background: url(../img/ico_free_delivery.gif) no-repeat;
	margin-top: 4px;
}

#product>.list>table .seller {
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

#product>.list>table .rating {
	margin-top: 12px;
}

#product h6.rating {
	font-size: 11px;
	background-image: url(../img/rating_star.png);
	background-repeat: no-repeat;
	background-position: 36px 0px;
	background-size: auto 100%;
}

#product h5.rating.star1 {
	width: 55px;
}

#product h5.rating.star1 {
	width: 55px;
}

#product h5.rating.star1 {
	width: 55px;
}

#product h5.rating.star4 {
	background-position: 0 -160px;
}

#product h6.rating.star1 {
	width: 51px;
}

#product h6.rating.star2 {
	width: 67px;
}

#product h6.rating.star3 {
	width: 81px;
}

#product h6.rating.star4 {
	width: 96px;
}

#product h6.rating.star5 {
	width: 120px;
}

#product>.list>.paging {
	width: 100%;
	padding: 30px 0;
	text-align: center;
}

#product>.list>.paging>span>a {
	color: #777;
	font-size: 11px;
	letter-spacing: -1px;
}

#product>.list>.paging>.num>a {
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
#product>.view>article {
	width: 100%;
	height: auto;
	overflow: hidden;
}

#product>.view>.info>div {
	float: left;
	width: 50%;
	height: 100%;
	padding: 10px;
	box-sizing: border-box;
}

#product>.view>.info>.image>img {
	width: 100%;
}

#product>.view>.info>.summary>nav {
	border-bottom: 1px solid #eaeaea;
	padding-bottom: 10px;
	margin-bottom: 12px;
	overflow: hidden;
}

#product>.view>.info>.summary>nav>h1 {
	float: left;
	color: #0231a6;
	font-weight: bold;
	font-size: 1.5em;
}

#product>.view>.info>.summary>nav>h2 {
	float: right;
	color: #777;
	margin-top: 8px;
}

#product>.view>.info>.summary>nav>h3 {
	font-size: 18px;
	font-weight: bold;
	color: #1e2732;
}

#product>.view>.info>.summary>nav>p {
	font-size: 14px;
	color: #474747;
	line-height: 36px;
	letter-spacing: -1px;
}

#product>.view>.info>.summary>nav:nth-child(2)>.rating>a {
	color: #346aff;
	text-decoration: underline;
}

#product>.view>.info>.summary .org_price>del {
	font-size: 18px;
	color: #aaa;
}

#product>.view>.info>.summary .org_price>del::after {
	content: "원";
}

#product>.view>.info>.summary .org_price>span {
	color: #eb000a;
	font-size: 16px;
	margin-left: 6px;
}

#product>.view>.info>.summary .org_price>span::after {
	content: "↓";
}

#product>.view>.info>.summary .dis_price>ins {
	font-size: 26px;
	font-weight: bold;
	text-decoration: none;
}

#product>.view>.info>.summary .dis_price>ins::after {
	content: "원";
}

#product>.view>.info>.summary .delivery {
	font-size: 16px;
	color: #2e8de5;
}

#product>.view>.info>.summary .origin {
	font-size: 16px;
}

#product>.view>.info>.summary .arrival {
	font-size: 14px;
	margin-left: 10px;
}

#product>.view>.info>.summary .desc {
	display: block;
	color: #aaa;
}

#product>.view>.info>.summary .card>i {
	display: inline-block;
	width: 30px;
	height: 18px;
	top: 4px;
	font-size: 0;
	vertical-align: text-top;
	margin-right: 2px;
}

#product>.view>.info>.summary .cardfree>i {
	background-position: -126px 0;
}

#product>.view>.info>.summary .cardadd>i {
	background-position: -51px -21px;
}

#product>.view>.info>.summary .banner {
	width: 100%;
}

#product>.view>.info>.summary .count {
	position: relative;
	width: 100px;
	height: 40px;
}

#product>.view>.info>.summary .count>button {
	position: absolute;
	width: 21px;
	height: 21px;
	background-image: url(../img/ico_sprites.png);
	font-size: 0;
	background-color: transparent;
	border: none;
}

/* #product>.view>.info>.summary .count>input[name=quantity_input] {
	position: absolute;
	left: 30px;
	top: 0;
	width: 30px;
	height: 30px;
	border: 1px solid #ececec;
	font-size: 14px;
	text-align: center;
	background-color: #FDC300;

} */
#product>.view>.info>.summary .count>.button_quantity {
	display: flex; /* Flexbox를 사용하여 자식 요소를 가로로 나란히 배치합니다. */
	align-items: center;
}

/*  #product>.view>.info>.summary .count>.button_quantity>.minus_btn {
 	left: 0;
	top: 0;
	background-position: 0px -74px; 
	margin-right: 10px;
}

#product>.view>.info>.summary .count>.button_quantity>.plus_btn {
 	left: 70px;
	top: 0;
	background-position: -48px -74px; 
	margin-left: 10px;
}  */
#product>.view>.info>.summary .total {
	overflow: hidden;
	margin-top: 16px;
}

#product>.view>.info>.summary .total>span {
	float: right;
	display: inline-block;
	line-height: 38px;
	font-size: 24px;
	font-weight: bold;
	color: #000;
	text-align: right;
	letter-spacing: -0.5px;
}

#product>.view>.info>.summary .total>span::after {
	content: "원";
}

#product>.view>.info>.summary .total>em {
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

#product>.view>.info>.summary .button {
	overflow: hidden;
	margin-top: 16px;
}

#product>.view>.info>.summary .button form {
	float: left;
	width: 49%;
	height: 50px;
	margin: 2px;
	font-size: 20px;
	font-weight: bold;
	border-radius: 2px;
	cursor: pointer;
	text-align: center; /* 텍스트 중앙 정렬 */
	line-height: 50px; /*텍스트 수직 중앙 정렬  */
}

#product>section>article.info>div.summary>div.button form {
	float: left;
	width: 49%;
	height: 50px;
	margin: 2px;
	font-size: 20px;
	font-weight: bold;
	border-radius: 2px;
	cursor: pointer;
}

#product>section>article.info>div.summary>div.button>form:nth-child(1)>input.cart
	{
	background: #fff;
	border: 1px solid #d9d9d9;
	color: #233594;
	width: 80%;
	border-radius: 6px;
}

#product>section>article.info>div.summary>div.button>form:nth-child(2)>input.order
	{
	background: #2e8de5;
	border: 1px solid #217fd7;
	color: #fff;
	width: 80%;
	border-radius: 6px;
}

#product>section>article.info>div.summary>div.button>form:nth-child(1)>input.cartEditBtn
	{
	background: #2e8de5;
	border: 1px solid #217fd7;
	color: #fff;
	width: 80%;
	border-radius: 6px;
}

#product>section>article.info>div.summary>div.button>form:nth-child(2)>input.cartDeleteBtn
	{
	background: #fff;
	border: 1px solid #d9d9d9;
	color: #233594;
	width: 80%;
	border-radius: 6px;
}

/* #product>.view>.info>.summary .submit>.cart {	
	background: #fff;
	border: 1px solid #d9d9d9;
	color: #233594;
}

#product>.view>.info>.summary .submit>.order {
	background: #2e8de5;
	border: 1px solid #217fd7;
	color: #fff;
} */
#product>.view>.review>.paging>.num>a.on {
	color: #fe434c;
	font-weight: bold;
}

#product>.view>article>nav {
	border-bottom: 1px solid #a4a9b0;
	padding: 6px 0;
	margin-bottom: 12px;
	overflow: hidden;
}

#product>.view>article>nav>p {
	float: left;
	color: #777;
	margin-top: 6px;
	margin-left: 6px;
}

#product>.view>article>nav>h1 {
	float: left;
	color: #1e2732;
	font-weight: bold;
	font-size: 1.5em;
}

#product>.view>.notice>table {
	width: 100%;
}

#product>.view>.notice>table:nth-of-type(2) {
	border-top: 1px solid #ececec;
}

#product>.view>.notice>table tr>td {
	padding: 5px 0 6px 21px;
	font-size: 14px;
	color: #777;
}

#product>.view>.notice>table tr>td:nth-child(1) {
	width: 20%;
	color: #222;
}

#product>.view>.review>ul {
	padding: 10px;
	box-sizing: border-box;
}

#product>.view>.review>ul>li {
	padding-top: 16px;
	border-bottom: 1px solid #ececec;
	box-sizing: border-box;
}

#product>.view>.review>ul>li>div {
	overflow: hidden;
}

#product>.view>.review>ul>li>div>span {
	float: right;
	color: #555;
}

#product>.view>.review>ul>li>div>h5 {
	float: left;
}

#product h5.rating {
	width: 150px;
	height: 20px;
	font-size: 0px;
	background-image: url(../img/ico_rating_star.png);
	background-repeat: no-repeat;
	background-position: 36px 0px;
	text-indent: 86px;
}

#product>.view>.review>ul>li>h3 {
	color: #555;
	margin-top: 6px;
}

#product>.view>.review>ul>li>p {
	width: 100%;
	height: 60px;
	color: #555;
	font-size: 14px;
	line-height: 19px;
	word-break: break-all;
	word-wrap: break-word;
	margin-top: 10px;
}

#product>.view>.review>.paging {
	width: 100%;
	padding: 30px 0;
	text-align: center;
}

#product>.view>.notice>.notice {
	margin: 20px 0;
	padding: 21px 26px 20px 19px;
	line-height: 20px;
	font-size: 14px;
	color: #757c8a;
	background: #fafafa;
	border-radius: 2px;
	white-space: normal;
}

#product>.view>.review>.paging>span>a {
	color: #777;
	font-size: 11px;
	letter-spacing: -1px;
}

#product>.view>.review>.paging>.num>a {
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

#product>.view>.review>.paging>.num>a.on {
	color: #fe434c;
	font-weight: bold;
}

/* 장바구니 */
#product>.cart>form {
	
}

#product>.cart>form>table {
	width: 100%;
	border-bottom: 1px solid #d3d3d3;
	border-collapse: collapse;
	border-spacing: 0;
}

#product>.cart>form>table tr {
	border-bottom: 1px solid #d3d3d3;
}

#product>.cart>form>table th:first-child {
	width: 60px;
}

#product>.cart>form>table th {
	padding: 12px 0;
	border-top: 2px solid #000;
	border-bottom: 1px solid #d3d3d3;
	background: #fff;
	color: #383838;
	font-size: 0.95em;
	text-align: center;
	letter-spacing: -0.1em;
}

#product>.cart>form>table .empty {
	display: none;
}

#product>.cart>form>table td {
	text-align: center;
}

#product>.cart>form>table td:last-child {
	color: #ff006c;
	font-weight: bold;
}

#product>.cart>form>table th>input {
	
}

#product>.cart>form>table tr>td>input {
	
}

#product>.cart>form>table td>article {
	padding: 6px;
	overflow: hidden;
}

#product>.cart>form>table td>article>a {
	float: left;
	display: inline-block;
}

#product>.cart>form>table td>article>a>img {
	width: 80px;
}

#product>.cart>form>table td>article>div {
	float: left;
	margin-left: 10px;
}

#product>.cart>form>table td>article>div>h2 {
	text-align: left;
}

#product>.cart>form>table td>article>div>p {
	text-align: left;
	color: #777;
	margin-top: 4px;
}

#product>.cart>form>input[name=del] {
	border-color: #bdbdbd;
	border-bottom-color: #828282;
	background: #fafafa;
	color: #4d4d4d;
	padding: 6px 11px;
	border-width: 1px;
	margin-top: 6px;
}

#product>.cart>form>.total {
	float: right;
	width: 360px;
	height: 412px;
	padding: 20px;
	margin-top: 12px;
	background: #fff;
	border: 1px solid #d3d3d3;
	box-sizing: border-box;
}

#product>.cart>form>.total>h2 {
	width: 100%;
	font-weight: bold;
	font-size: 16px;
	border-bottom: 1px solid #111;
	margin-bottom: 10px;
	padding-bottom: 10px;
	box-sizing: border-box;
	color: #1e1e1e;
}

#product>.cart>form>.total>table {
	width: 100%;
}

#product>.cart>form>.total>table tr:nth-last-child(1) td {
	font-size: 20px;
}

#product>.cart>form>.total>table tr:nth-last-child(1) td:last-child {
	color: #ff006c;
	font-size: 20px;
	font-weight: bold;
}

#product>.cart>form>.total>table td {
	padding: 10px 0;
	font-size: 14px;
	color: #555;
}

#product>.cart>form>.total>table td:last-child {
	text-align: right;
}

#product>.cart>form>.total>input[type=submit] {
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