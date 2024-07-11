package com.care.bowfun.Introduction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
public class IntroductionController {
    @Autowired private IntroductionService service;

    @RequestMapping("introductionForm")
    public String introductionForm(Model model,
            @RequestParam(value="currentPage", required = false)String cp) {
        service.introductionForm(cp, model);
        return "introduction/introductionForm";
    }


	@RequestMapping("peopleForm")
	public String peopleForm(Model model,
	        @RequestParam(value="currentPage", required = false)String cp) {
	    service.peopleForm(cp, model);
	    return "introduction/peopleForm";
	}
	}
