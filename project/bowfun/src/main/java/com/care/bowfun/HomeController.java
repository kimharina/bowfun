package com.care.bowfun;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("index")
	public String index() {
		return "index";
	}

	@RequestMapping("header")
	public String header() {
		return "default/header";
	}

	@RequestMapping("main")
	public String main() {
		return "default/main";
	}
	@RequestMapping("aside")
	public String aside() {
		return "default/aside";
	}

	@RequestMapping("footer")
	public String footer() {
		return "default/footer";
	}
	
	@RequestMapping("kakaomap")
	public String kakaomap() {
		return "map/kakaomap";
	}
	
	@RequestMapping("kakaomap2")
	public String kakaomap2() {
		return "map/kakaomap2";
	}
	
	@RequestMapping("shop_header")
	public String shop_header() {
		return "shop.default/shop_header";
	}
}
