<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/header" />

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
function requestSelectPay() {
    IMP.init("imp40638066");
    var totalOrderAmount = $('#totalOrderAmountCell').text();
    var amount = parseInt(totalOrderAmount.replace(/[^0-9]/g, ''));
    var selectedCheckbox = $(".individual_cart_checkbox:checked");
    var scname = selectedCheckbox.closest("tr").find("#scname").val();
    IMP.request_pay({
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: document.getElementById("suserName").value + new Date().getTime(),
        name: scname,
        amount: amount,
        buyer_email: document.getElementById("semail").value,
        buyer_name: document.getElementById("suserName").value,
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
    function requestPay() {
        IMP.init("imp40638066");
        var totalOrderAmount = $('#totalOrderAmountCell').text();
        var amount = parseInt(totalOrderAmount.replace(/[^0-9]/g, ''));
        IMP.request_pay({
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid: document.getElementById("userName").value + new Date().getTime(),
            name: document.getElementById("cname").value,
            amount: amount,
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
</script>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
            <section class="cart">
               <form action="#">
                    <table border="0">
                        <tr>
                            <th><input type="checkbox" class="all_check_input"></th>
                            <th style="font-weight: bold;">상품명</th>
                            <th style="font-weight: bold;">수량</th>
                            <th style="font-weight: bold;">판매가</th>
                            <th style="font-weight: bold;">배송비</th>
                            <th style="font-weight: bold;">합계</th>
                            <th style="font-weight: bold;">선택</th>
                        </tr>
                        <tr class="empty">
						<%-- <c:if test="${not empty sessionScope.itemCode}"> --%>
						    <%-- <c:set var="cartList" value="" scope="request" />아이템코드 --%>
						<c:forEach var="item" items="${combinedList}">
						    <tr>
                            <td><input type="checkbox" class="individual_cart_checkbox" name=""></td>
                            <td><article>
                                <a href="#">
                                    <img src="${item.cimage}" />
                                    <input type="hidden" name="email" value="${email}">
                                    <input type="hidden" name="userName" value="${userName}">
                                </a>
                                <div>
                                    <h2><a href="#"><c:out value="${item.cname}" /></a>
                                    (상품번호 : <c:out value="${item.itemCode}" />)
                                    </h2>
                                    <p><c:out value="${item.catename}" /></p>
                                </div>
                            </article></td>
                            
                            <td>
                            <span class="individual_bookCount_input">
							    <c:out value="${item.quantity}" />
							</span>
                            <td>
	                            <fmt:formatNumber value="${item.cprice}" pattern="###,###,###" var="formattedPrice" />
							    <c:out value="${formattedPrice}" />
                            </td>
<!--                             <td>5%</td>
                            <td>270</td> -->
                            <td>무료배송</td>
                            <td>
                           	<span class="individual_totalPrice_input">
                            	<fmt:formatNumber value="${item.cprice * item.quantity}" pattern="###,###,###" var="formattedPrice" />
							    <c:out value="₩${formattedPrice}" />
						    </span>
							</td>
                            
                            <td>
                            	<input type="hidden" id="scname" value="${item.cname}">
								<input type="hidden" id="semail" value="${email}">
								<input type="hidden" id="suserName" value="${userName}">
								
							    <input type="button" name="submit" value="결제" onclick="requestSelectPay()">
							    <form action="/api/deleteCart" method="post" class="delete_form">
							        <input type="hidden" name="itemCode" class="delete_itemCode">
							        <input type="hidden" name="id" value="${sessionScope.id}">
							    </form>
							    <button class="delete_btn" data-itemCode="${item.itemCode}">삭제</button>
							</td>
                        </tr>
                        </c:forEach>

 <script type="text/javascript">

 $(".delete_btn").on("click", function(e) {
	    e.preventDefault();
	    const itemCode = $(this).attr("data-itemCode");
	    console.log(itemCode);
	    $(".delete_itemCode").val(itemCode);
		$(".delete_form").submit();
	    
	
 	   
    });


</script>
                        
                    </table>

                    
                    <!-- <input type="button" name="del" value="선택삭제"> -->
                    <div class="total">
                        <h2>전체합계</h2>
                        <table>
                            <tr>
                                <td>상품수</td>
                                <td id="selectedCheckboxCount"></td>
                            </tr>
                            <tr>
                                <td>총수량</td>
                                <td id="totalItemsCell"></td>
                            </tr>
                            <tr>
                                <td>배송비</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>전체주문금액</td>
                                <td id="totalOrderAmountCell"></td>
                            </tr>
                        </table>
                        <div class="button">
                        	<input type="hidden" id="cname" value="일괄 결제">
							<input type="hidden" id="email" value="${email}">
							<input type="hidden" id="userName" value="${userName}">
							
         					<input type="button" class="cart" value="결제하기" onclick="requestPay()">
                        </div>
                    </div>
                    
					<!--email, userName가져오기 -->
					<script>
					    var emailValue = "${email}";
					    var userNameValue = "${userName}";
					    console.log("Email: " + emailValue);
					    console.log("UserName: " + userNameValue);
					</script>

					
                    <!--체크박스 전체 선택-->
                    <script>
                    /* 체크박스 전체 선택 */
                    $(".all_check_input").on("click", function(){

                    	/* 체크박스 체크/해제 */
                    	if($(".all_check_input").prop("checked")){
                    		$(".individual_cart_checkbox").attr("checked", true);
                    	} else{
                    		$(".individual_cart_checkbox").attr("checked", false);
                    	}
                    	
                    	/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
                    	updateCartSummary(selectedCheckboxes);	
                    	
                    });
                    </script>
                    
                    
                    <!-- 체크박스 선택하여 총 금액 바꾸기 -->
                    <script>
                     $(document).ready(function() {
                        // 모든 체크 박스 엘리먼트를 가져옴
                        var checkboxes = $('.individual_cart_checkbox');

                        // 각 체크 박스에 대한 이벤트 리스너 등록
                        checkboxes.on('change', function() {
                            // 체크 박스가 변경될 때마다 호출되는 함수
                            updateCartSummary();
                        });
                        
                     	// 전체 선택 체크박스에 대한 이벤트 리스너 등록
                        $(".all_check_input").on("change", function() {
                            // 전체 선택 체크박스의 상태에 따라 개별 체크박스를 체크/해제
                            checkboxes.prop("checked", $(this).prop("checked"));

                            // 업데이트된 정보를 화면에 출력
                            updateCartSummary();
                        });
                    });

                    function updateCartSummary() {
                        var selectedCheckboxes = $('.individual_cart_checkbox:checked');
                        var totalCount = selectedCheckboxes.length; // 선택된 체크박스의 개수
                        var totalItems = 0;
                        var totalPrice = 0;
                        

                        // 선택된 체크 박스들의 수량과 가격을 계산하여 업데이트
                        selectedCheckboxes.each(function() {
                            var quantity = parseInt($(this).closest('tr').find('.individual_bookCount_input').text());
                            var price = parseInt($(this).closest('tr').find('.individual_totalPrice_input').text().replace(/[^0-9]/g, '')); // 숫자만 추출

                            totalItems += quantity;
                            totalPrice += price;
                        });

                        // 업데이트된 정보를 화면에 출력
                        var selectedCheckboxCountElement = $('#selectedCheckboxCount');
    					selectedCheckboxCountElement.text(totalCount + '개 선택되었습니다.');
    					
    					/* $('#selectedCheckboxCount').text(totalCount); // 선택된 체크박스의 개수를 업데이트 */
    					
    					var totalItemsText = totalItems + '개';
    					$('#totalItemsCell').text(totalItemsText);
    					
                        /* $('#totalItemsCell').text(totalItems); */
                        
                        var formattedTotalPrice = new Intl.NumberFormat('en-US').format(totalPrice); // "###,###" 형식으로 포맷팅
                        $('#totalOrderAmountCell').text(formattedTotalPrice + '원'); // 포맷팅된 숫자를 업데이트된 정보로 출력
                        
                    } 

                   

					</script>
               </form>
               
            <c:import url="/footer" />
<style>
/* 상품목록 */

#product{
	min-height: 1000px; /* 원하는 높이로 조정할 수 있음 */
}
#product > section {
    padding: 16px;
    box-sizing: border-box;
}

#product > .list {}

#product > section > nav {
    width: 100%;
    height: 15px;
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
    margin-top: -5px;
}
#product > section > form > table > tbody > tr > td:nth-child(7) > input[type=button]{
	background-color: black;
	width: 70%;
    color: white;
    border-radius: 20px; /* 둥근 테두리를 위한 값 (원하는 정도로 조절 가능) */
    border: none; /* 테두리 제거 */
    padding: 6px 12px; /* 버튼 내부 여백 설정 (원하는 크기로 조절 가능) */
    cursor: pointer; /* 커서 스타일 설정 (핸드 포인터로 변경) */
    font-weight: bold; /* 글씨 굵기 설정 (필요한 경우) */
}

#product > section > form > table > tbody > tr > td:nth-child(7) > button{
	display: block;
    width: 70%;
	background-color: #D9534F;
    color: white;
    border-radius: 20px; /* 둥근 테두리를 위한 값 (원하는 정도로 조절 가능) */
    border: none; /* 테두리 제거 */
    padding: 6px 12px; /* 버튼 내부 여백 설정 (원하는 크기로 조절 가능) */
    cursor: pointer; /* 커서 스타일 설정 (핸드 포인터로 변경) */
    font-weight: bold; /* 글씨 굵기 설정 (필요한 경우) */
    margin-top: 5px;
    margin-left: 15px;
}

#product > section > form > div{
	min-height: auto; /* 원하는 높이로 조정할 수 있음 */
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

#product>.cart>form>.total> div> input[type=button] {
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