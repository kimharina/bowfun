var KAKAO_PIXEL = function(){
	var key = '';
	var _API = {};
	var call = false;
	this.order = {};

	var init = function(id){
		key = id;
		_API = kakaoPixel(key);
		checkAPI();
	};
	var checkAPI = function(){
		if(key == '') return false;
		if(Object.keys(_API).length == 0) return false;
		if(!call){
			_API.pageView();
			call = true;
		}
		return true;
	};

	var CompleteJoin = function(){
		if(!checkAPI()) return false;
		_API.completeRegistration();
	};

	var Search = function(keyword){
		if(!checkAPI()) return false;
		_API.search({"keyword": keyword});
	};

	var ViewContent = function(id){
		if(!checkAPI()) return false;
		_API.viewContent({"id": String(id)});
	};

	var ViewCart = function(){
		if(!checkAPI()) return false;
		_API.viewCart();
	};

	var AddorderInfo 	= function(name,qty,price){
		if(!checkAPI()) return false;
		if(this.order['products'] == undefined){
			this.order = {
				"total_quantity":0,
				"products":[]
			};
		}
		this.order['products'].push({"name": name, "quantity": qty, "price": price});
		this.order['total_quantity']++;
	};
	var CompletePayment = function(price,currency){
		if(!checkAPI()) return false;
		this.order['total_price'] 	= String(price);
		this.order['currency'] 		= currency;
		_API.purchase(this.order);
	};

	var addNpayOrder = function(order_data){
		if(typeof order_data == 'undefined') return false;
		if(typeof order_data['list'] == 'undefined') return false;
		// 네이버 페이도 구매전환에 포함하게끔 옵션을 사용할 경우에는 구매완료를 바로 보낸다
		// ( 카카오는 아직 해당 옵션이 없음 그냥 메소드만 추가해둠 - 나중에 옵션화되거나 하면 이거 호출하면 됨 )

		var npay_order_total_price = 0;
		var npay_order_item = {};
		for(var i = 0; i < order_data['list'].length; i++){
			npay_order_item = order_data['list'][i];
			AddorderInfo( npay_order_item['prod_name'], npay_order_item['count'], npay_order_item['price']);
			npay_order_total_price += npay_order_item['price'];
		}

		CompletePayment(npay_order_total_price, 'KRW');
	};


	var AddPurchase = function(d){
		if(!checkAPI()) return false;
		_API.purchase(d);
	};

	return {
		"init": function(id){
			init(id);
		},
		"CompleteJoin": function(){
			CompleteJoin();
		},
		"Search": function(keyword){
			Search(keyword);
		},
		"ViewContent": function(id){
			ViewContent(id);
		},
		"AddorderInfo": function(name,qty,price){
			AddorderInfo(name,qty,price);
		},
		"CompletePayment": function(price,currency){
			CompletePayment(price,currency);
		},
		"addNpayOrder": function(npay_order_data){
			return addNpayOrder(npay_order_data);
		},
		"AddPurchase": function(d){
			AddPurchase(d);
		},
		"ViewCart": function(){
			ViewCart();
		}
	};
}();
