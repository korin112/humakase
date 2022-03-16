package com.human.outback;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.human.outback.DTO.Pagination;

@Controller
public class MypageController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/mypage/mybook")
	public String mybook(HttpServletRequest hsr, Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		HttpSession session = hsr.getSession();
		String userid = (String) session.getAttribute("userid");
//		model.addAttribute("userid", userid);
		iMypage iMypage = sqlSession.getMapper(iMypage.class);
		// 전체 게시글 개수
		Pagination laterPagination = new Pagination();
		Pagination prevPagination = new Pagination();
		int listCnt = iMypage.getCntLaterMyBook(userid);
		int listCnt2 = iMypage.getCntPrevMyBook(userid);
		System.out.println(listCnt);
		System.out.println(listCnt2);
		// Pagination
		laterPagination.pageInfo(page, range, listCnt);
		prevPagination.pageInfo(page, range, listCnt2);
		model.addAttribute("laterPagination", laterPagination);
		model.addAttribute("prevPagination", prevPagination);
		model.addAttribute("mylaterbook", iMypage.getMylaterbook(userid, laterPagination));
		model.addAttribute("myPrevbook", iMypage.getMyPrevbook(userid, prevPagination));
		
		return "mypage/mybook";
	}

}