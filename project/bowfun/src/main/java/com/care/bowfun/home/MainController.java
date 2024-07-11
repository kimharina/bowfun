package com.care.bowfun.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
public class MainController {
	 @Autowired private MainService service;

	    @RequestMapping("mainForm")
	    public String mainForm(Model model,
	            @RequestParam(value="currentPage", required = false)String cp) {
	        service.mainForm(cp, model);
	        return "main2/mainForm";
	    }


}
