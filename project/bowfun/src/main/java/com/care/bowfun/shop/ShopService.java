package com.care.bowfun.shop;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.bowfun.PageService;
import com.care.bowfun.cart.CartDTO;
import com.care.bowfun.cart.CartService;
import com.care.bowfun.cate.CateDTO;
import com.care.bowfun.s3.S3;

import jakarta.servlet.http.HttpSession;

@Service
public class ShopService {
	@Autowired 
	private S3 s3;
	@Autowired
	private ShopMapper mapper;
	@Autowired
	private HttpSession session;

	private String filePath = "/opt/tomcat/tomcat-10/webapps/bowfun/WEB-INF/classes/static/img/";

	@Autowired
	private CartService cartService;

	public void kmart(String cp, Model model) {
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(cp);
		} catch (Exception e) {
			currentPage = 1;
		}

		int pageBlock = 10; // 한 페이지에 보일 데이터의 수
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호

		List<ShopDTO> shops = mapper.kmart(begin, end);
		int totalCount = mapper.totalCount();
		if (totalCount == 0) {
			return;
		}

		String url = "kmart?currentPage=";
		String result = PageService.printPage(url, totalCount, pageBlock, currentPage);

		model.addAttribute("shops", shops);
		model.addAttribute("result", result);
	}

	public ShopDTO kdetail(String cnum) {
		int n = 1;
		try {
			n = Integer.parseInt(cnum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		ShopDTO shops = mapper.kdetail(n);

		return shops;
	}

	public String addCartProc(String sessionId, int cnum, Model model) {
		Integer quantity = cartService.getQuantity();

		if (sessionId != null) {
			CartDTO cart = new CartDTO();
			cart.setMemId(sessionId);
			cart.setItemCode(cnum);
			cart.setQuantity(quantity);

			mapper.addCartProc(cart);
			model.addAttribute("cart", cart);

			return "등록 성공";
		} else {
			return "등록 실패";
		}
	}

	public void insert(Model model) {
		// 카테고리 리스트 불러오기
		List<CateDTO> clist = mapper.cateList();
		model.addAttribute("clist", clist);
	}

	// Window - Preferences - Workspace - Refresh using native hooks or polling 체크해야
	// 사진 출력됨
	public String shopWriteProc(MultipartHttpServletRequest multi, String code) {
		String sessionId = (String) session.getAttribute("id");
		if (sessionId == null)
			return "redirect:index";

		String cname = multi.getParameter("cname");
		if (cname == null || cname.trim().isEmpty()) {
			return "redirect:shopWrite";
		}

		ShopDTO shop = new ShopDTO();
		shop.setCnum(Integer.parseInt(multi.getParameter("cnum")));
		shop.setCode(code);
		shop.setCname(multi.getParameter("cname"));
		shop.setCprice(Integer.parseInt(multi.getParameter("cprice")));

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		MultipartFile file = multi.getFile("cimage");
		if (file.getSize() != 0) { // 클라이언트가 파일을 업로드 했다면
			// if (file != null && !file.isEmpty()) {
			// 파일의 이름
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			String fileTime = sdf.format(new Date());
			String fileName = file.getOriginalFilename();

			String suffix = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
			System.out.println("ShopService-shopWriteProc-suffix : " + suffix);

			// 파일의 저장 경로
			String fileSaveDirectory = filePath + "cimage";
			File f = new File(fileSaveDirectory);
			if (f.exists() == false) {
				f.mkdir();
			}

			String fullPath = fileSaveDirectory + "/" + fileTime + fileName;
			shop.setCimage(fileTime + fileName);
			f = new File(fullPath);
			try {
				file.transferTo(f);
				s3.uploadToS3(fullPath);
			} catch (Exception e) {
				e.printStackTrace();
				shop.setCimage("");
			}

		} else
			return "shopping/shopWrite";

		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		MultipartFile file1 = multi.getFile("cimage1");
		if (file1.getSize() != 0) { // 클라이언트가 파일을 업로드 했다면
			// if (file != null && !file.isEmpty()) {
			// 파일의 이름
			sdf1 = new SimpleDateFormat("yyyyMMddHHmmss-");
			String fileTime1 = sdf1.format(new Date());
			String fileName1 = file1.getOriginalFilename();

			String suffix1 = fileName1.substring(fileName1.lastIndexOf(".") + 1, fileName1.length());
			System.out.println("ShopService-shopWriteProc-suffix : " + suffix1);

			// 파일의 저장 경로
			String fileSaveDirectory1 = filePath + "cimage1";
			File f1 = new File(fileSaveDirectory1);
			if (f1.exists() == false) {
				f1.mkdir();
			}

			String fullPath1 = fileSaveDirectory1 + "/" + fileTime1 + fileName1;
			shop.setCimage1(fileTime1 + fileName1);
			f1 = new File(fullPath1);
			try {
				file1.transferTo(f1);
				s3.uploadToS3(fullPath1);
			} catch (Exception e) {
				e.printStackTrace();
				shop.setCimage1("");
			}

		} else
			return "shopping/shopWrite";

		mapper.shopWriteProc(shop);

		return "등록 완료";
	}
	
	public String shopUpdateProc(MultipartHttpServletRequest multi, String cnum, String code) {
		int n = 0;
		try {
			n = Integer.parseInt(cnum);
		} catch (Exception e) {
			return "다시 시도하세요";
		}

		ShopDTO shop = mapper.kdetail(n);
		if (shop == null)
			return "다시 시도하세요";

		if (shop.getCname() == null || shop.getCname().trim().isEmpty()) {
			return "상품명을 입력하세요";
		}
		
		shop.setCnum(Integer.parseInt(multi.getParameter("cnum")));
		shop.setCode(code);
		shop.setCname(multi.getParameter("cname"));
		shop.setCprice(Integer.parseInt(multi.getParameter("cprice")));
		
		String deletePath = shop.getCimage()
				.replace("img", "/opt/tomcat/tomcat-10/webapps/bowfun/WEB-INF/classes/static/img").replace("/", "\\");
		System.out.println(deletePath);
		if (deletePath != null) {
			File df = new File(deletePath);
			if (df.exists() == true)
				df.delete();
		}
		
		String deletePath1 = shop.getCimage1()
				.replace("img", "/opt/tomcat/tomcat-10/webapps/bowfun/WEB-INF/classes/static/img").replace("/", "\\");
		System.out.println(deletePath1);
		if (deletePath1 != null) {
			File df1 = new File(deletePath1);
			if (df1.exists() == true)
				df1.delete();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		MultipartFile file = multi.getFile("cimage");
		if (file.getSize() != 0) { // 클라이언트가 파일을 업로드 했다면
			// if (file != null && !file.isEmpty()) {
			// 파일의 이름
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			String fileTime = sdf.format(new Date());
			String fileName = file.getOriginalFilename();

			String suffix = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
			System.out.println("ShopService-shopUpdateProc-suffix : " + suffix);

			// 파일의 저장 경로
			String fileSaveDirectory = filePath + "cimage";
			File f = new File(fileSaveDirectory);
			if (f.exists() == false) {
				f.mkdir();
			}

			String fullPath = fileSaveDirectory + "\\" + fileTime + fileName;
			shop.setCimage(fileTime + fileName);
			f = new File(fullPath);
			try {
				file.transferTo(f);
				s3.uploadToS3(fullPath);
			} catch (Exception e) {
				e.printStackTrace();
				shop.setCimage("");
			}
		} else
			return "redirect:shopUpdate?cnum=" + n;
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		MultipartFile file1 = multi.getFile("cimage1");
		if (file1.getSize() != 0) { // 클라이언트가 파일을 업로드 했다면
			// if (file != null && !file.isEmpty()) {
			// 파일의 이름
			sdf1 = new SimpleDateFormat("yyyyMMddHHmmss-");
			String fileTime1 = sdf1.format(new Date());
			String fileName1 = file1.getOriginalFilename();

			String suffix1 = fileName1.substring(fileName1.lastIndexOf(".") + 1, fileName1.length());
			System.out.println("ShopService-shopUpdateProc-suffix : " + suffix1);

			// 파일의 저장 경로
			String fileSaveDirectory1 = filePath + "cimage1";
			File f1 = new File(fileSaveDirectory1);
			if (f1.exists() == false) {
				f1.mkdir();
			}

			String fullPath1 = fileSaveDirectory1 + "\\" + fileTime1 + fileName1;
			shop.setCimage1(fileTime1 + fileName1);
			f1 = new File(fullPath1);
			try {
				file1.transferTo(f1);
				s3.uploadToS3(fullPath1);
			} catch (Exception e) {
				e.printStackTrace();
				shop.setCimage1("");
			}
		} else
			return "redirect:shopUpdate?cnum=" + n;
		
		int result = mapper.shopUpdateProc(shop);
		if (result <= 0)
			return "상품 수정에 실패했습니다. 다시 시도하세요";
		
		return "상품 수정 성공";
	}

	public String shopDeleteProc(String cnum) {
		int n = 0;
		try {
			n = Integer.parseInt(cnum);
		} catch (Exception e) {
			return "다시 시도하세요";
		}

		ShopDTO shop = mapper.kdetail(n);
		if (shop == null)
			return "다시 시도하세요";

		String deletePath = shop.getCimage()
				.replace("img", "/opt/tomcat/tomcat-10/webapps/bowfun/WEB-INF/classes/static/img").replace("/", "\\");
		System.out.println(deletePath);
		if (deletePath != null) {
			File f = new File(deletePath);
			if (f.exists() == true)
				f.delete();
		}
		String deletePath1 = shop.getCimage1()
				.replace("img", "/opt/tomcat/tomcat-10/webapps/bowfun/WEB-INF/classes/static/img").replace("/", "\\");
		System.out.println(deletePath1);
		if (deletePath1 != null) {
			File f1 = new File(deletePath1);
			if (f1.exists() == true)
				f1.delete();
		}

		mapper.shopDeleteProc(n);
		return "삭제 완료";
	}
	
	
	@Autowired
    private ShopMapper shopMapper;
	
	public List<CombinedDTO> getShopItems(String memId) {
		return shopMapper.getCombinedItems(memId); // ShopMapper를 사용하여 DB에서 상품 목록을 가져옴
	}
	
	

}
