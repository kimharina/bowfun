 package com.care.bowfun.notice;
 
 import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

 @Controller
 public class NoticeController {
     @Autowired private NoticeService service;

     @Autowired private HttpSession session;

     @RequestMapping("NoticeForm")
     public String NoticeForm(Model model,
             @RequestParam(value="currentPage", required = false)String cp) {
         service.NoticeForm(cp, model);
         return "Notice/NoticeForm";
     }

     @RequestMapping("NoticeWrite")
     public String NoticeWrite() {
         String sessionId = (String) session.getAttribute("id");
         if(sessionId == null)
 			//return "redirect:login";
        	 sessionId = "admin";
         return "Notice/NoticeWrite";
     }
     @PostMapping("NoticeWriteProc")
     public String NoticeWriteProc(MultipartHttpServletRequest multi) {
         String sessionId = (String) session.getAttribute("id");
         if(sessionId == null)
        	 sessionId = "admin";
         	//return "redirect:login";
             String path = service.NoticeWriteProc(multi);
         return path;
     }

     @RequestMapping("NoticeContent")
     public String NoticeContent(String no, Model model) {
         NoticeDTO Notice = service.NoticeContent(no);
         if(Notice == null) {
 		return "redirect:NoticeForm";
         }

         model.addAttribute("Notice", Notice);
         return "Notice/NoticeContent";
     }

     @RequestMapping("NoticeDownload")
     public void NoticeDownload(String no, HttpServletResponse response) {
         service.NoticeDownload(no, response);
     }

     @RequestMapping("NoticeModify")
     public String NoticeModify(String no, Model model) {
         String sessionId = (String) session.getAttribute("id");
         if(sessionId == null)
        	 sessionId = "admin";
         	//return "redirect:login";
         String path = service.NoticeModify(no, model);
         return path;
     }

     @PostMapping("NoticeModifyProc")
     public String NoticeModifyProc(NoticeDTO Notice, RedirectAttributes ra) {
         String sessionId = (String) session.getAttribute("id");
         if(sessionId == null)
        	 sessionId = "admin";
         	//return "redirect:login";
         String msg = service.NoticeModifyProc(Notice);
         ra.addFlashAttribute("msg", msg);

         if(msg.equals("게시글 수정 성공"))
             return "redirect:NoticeContent?no="+Notice.getNo();

         return "redirect:NoticeModify?no="+Notice.getNo();
     }

     @RequestMapping("NoticeDeleteProc")
     public String NoticeDeleteProc(String no) {
         String sessionId = (String) session.getAttribute("id");
         if(sessionId == null)
        	 sessionId = "admin";
         	//return "redirect:login";

         String msg = service.NoticeDeleteProc(no);
			
			if(msg.equals("작성자만 삭제 할 수 있습니다.")) return "redirect:NoticeContent?no="+no;
			 

         return "redirect:NoticeForm";
     }
 }
 