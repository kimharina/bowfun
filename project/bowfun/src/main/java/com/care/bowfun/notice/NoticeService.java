package com.care.bowfun.notice;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.bowfun.PageService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
public class NoticeService {
	@Autowired
	private NoticeMapper mapper;
	private String filePath = "C:\\javas\\upload\\";

	public void NoticeForm(String cp, Model model) {
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(cp);
		} catch (Exception e) {
			currentPage = 1;
		}

		int pageBlock = 7; // 한 페이지에 보일 데이터의 수
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호

		List<NoticeDTO> Notices = mapper.NoticeForm(begin, end);
		int totalCount = mapper.totalCount();
		if (totalCount == 0) {
			return;
		}

		String url = "NoticeForm?currentPage=";
		String result = PageService.printPage(url, totalCount, pageBlock, currentPage);

		model.addAttribute("Notices", Notices);
		model.addAttribute("result", result);
	}

	@Autowired
	private HttpSession session;

	public String NoticeWriteProc(MultipartHttpServletRequest multi) {
//		System.out.println("title : " + multi.getParameter("title"));
		String sessionId = (String) session.getAttribute("id");
		if (sessionId == null)
			sessionId = "admin";

		// return "redirect:login";

		String title = multi.getParameter("title");
		if (title == null || title.trim().isEmpty()) {
			return "redirect:NoticeWrite";
		}

		NoticeDTO Notice = new NoticeDTO();
		Notice.setTitle(title);
		Notice.setContent(multi.getParameter("content"));
		Notice.setId(sessionId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Notice.setWriteDate(sdf.format(new Date()));
		Notice.setFileName("");

		MultipartFile file = multi.getFile("FileName");
		// if(file.getSize() != 0) { // 클라이언트가 파일을 업로드 했다면
		if (file != null && !file.isEmpty()) {
			// 파일의 이름
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			String fileTime = sdf.format(new Date());
			String fileName = file.getOriginalFilename();

			String suffix = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
			System.out.println("NoticeService-Notice WriteProc-suffix : " + suffix);
//			if (suffix.equalsIgnoreCase("pdf") == false)
//				return "redirect:NoticeWrite";

			// 파일의 저장 경로
			String fileSaveDirectory = filePath + sessionId;
			File f = new File(fileSaveDirectory);
			if (f.exists() == false) {
				f.mkdir();
			}

			String fullPath = fileSaveDirectory + "\\" + fileTime + fileName;
			Notice.setFileName(fullPath);
			f = new File(fullPath);
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
				Notice.setFileName("");
			}

			/*
			 * file.transferTo(); //파일을 이동시키는 기능 <input type="file" name="upfile"> 을 사용하여
			 * 서버에 파일 데이터가 전달되면 웹서버가 임시파일로 저장을 함. 임시파일로 저장된 파일을 개발자가 원하는 경로로 이동시킬 때
			 * file.transferTo()를 사용함.
			 */
		}

		// 조회수랑 게시글 번호는 INSERT 명령 시 입력
		mapper.NoticeWriteProc(Notice);
		return "redirect:NoticeForm";
	}

	public NoticeDTO NoticeContent(String no) {
		int n = 1;
		try {
			n = Integer.parseInt(no);
		} catch (Exception e) {
			return null;
		}

		NoticeDTO Notice = mapper.NoticeContent(n);
		if (Notice != null) {
			mapper.incrementViews(n);
			Notice.setViews(Notice.getViews() + 1);

			if (Notice.getFileName() != null) {
			    String[] names = Notice.getFileName().split("\\\\");
			    for (String name : names) {
			        System.out.println("NoticeService-NoticeContent name : " + name);
			    }

			    if (names.length >= 5) {
			        String[] fileNames = names[4].split("-", 2);

			        // 파일 이름이 적어도 하나 이상이어야 하므로 첫 번째 원소가 존재하는지 확인
			        if (fileNames.length >= 2) {
			            for (String fileName : fileNames) {
			                System.out.println("NoticeService-NoticeContent fileName : " + fileName);
			            }

			            // fileNames[1]은 적어도 하나 이상의 문자가 있어야 합니다.
			            Notice.setFileName(fileNames[1]);
			        } else {
			            System.out.println("NoticeService-NoticeContent: Invalid file name format");
			        }
			    } else {
			        System.out.println("NoticeService-NoticeContent: Not enough elements in the names array");
			    }
			}
		}

		return Notice;
	}

	public void NoticeDownload(String no, HttpServletResponse response) {
		int n = 1;
		try {
			n = Integer.parseInt(no);
		} catch (Exception e) {
			return;
		}

		String fullPath = mapper.NoticeDownload(n);
		if (fullPath == null)
			return;

		String[] names = fullPath.split("\\\\");
		String[] fileNames = names[4].split("-", 2);

		try {
			File file = new File(fullPath);
			if (file.exists() == false)
				return;

			response.setHeader("Content-Disposition",
					// attachment;filename=pom.xml
					"attachment;filename=" + URLEncoder.encode(fileNames[1], "UTF-8"));

			FileInputStream fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, response.getOutputStream());
			fis.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}


	public String NoticeModify(String no, Model model) {
		int n = 0;
		try {
			n = Integer.parseInt(no);
		} catch (Exception e) {
			return "redirect:NoticeForm";
		}

		NoticeDTO Notice = mapper.NoticeContent(n);

		if (Notice == null)
			// sessionId = "admin";
			return "redirect:NoticeForm";

		if (Notice.getFileName() != null) {
			String[] names = Notice.getFileName().split("\\\\");
			String[] fileNames = names[4].split("-", 2);
			Notice.setFileName(fileNames[1]);
		}

		model.addAttribute("Notice", Notice);
		return "Notice/NoticeModify";
	}

	public String NoticeModifyProc(NoticeDTO Notice) {
		// System.out.println(Notice.getNo());
		NoticeDTO check = mapper.NoticeContent(Notice.getNo());
		if (check == null)
			return "게시글 번호에 문제가 발생했습니다. 다시 시도하세요.";

		if (Notice.getTitle() == null || Notice.getTitle().trim().isEmpty()) {
			return "제목을 입력하세요.";
		}

		int result = mapper.NoticeModifyProc(Notice);
		if (result == 0)
			return "게시글 수정에 실패했습니다. 다시 시도하세요.";

		return "게시글 수정 성공";
	}

	public String NoticeDeleteProc(String no) {
		// 파일이 존재하면 삭제
		int n = 0;
		try {
			n = Integer.parseInt(no);
		} catch (Exception e) {
			return "게시글 번호에 문제가 발생했습니다. 다시 시도하세요.";
		}

		NoticeDTO Notice = mapper.NoticeContent(n);
		if (Notice == null)
			return "게시글 번호에 문제가 발생했습니다. 다시 시도하세요.";

		String fullPath = Notice.getFileName();
		if (fullPath != null) { // 테이블에 파일의 경로와 이름이 있다면
			File f = new File(fullPath);
			if (f.exists() == true) // 파일 저장소에 파일이 존재한다면
				f.delete();
		}

		// 테이블에서 게시글번호와 일치하는 행(row)삭제
		mapper.NoticeDeleteProc(n);
		return "게시글 삭제 완료";
	}

}
