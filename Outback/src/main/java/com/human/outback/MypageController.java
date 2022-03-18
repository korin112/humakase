package com.human.outback;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.outback.DTO.Pagination;

@Controller
public class MypageController {

	@Autowired
	private SqlSession sqlSession;
	
//	@RequestMapping("/mypage/mybook")
//	public String mybook(HttpServletRequest hsr, Model model
//			, @RequestParam(required = false, defaultValue = "1") int page
//			, @RequestParam(required = false, defaultValue = "1") int range) {
//		HttpSession session = hsr.getSession();
//		String userid = (String) session.getAttribute("userid");
//		iMypage iMypage = sqlSession.getMapper(iMypage.class);
//		// 전체 게시글 개수
//		Pagination laterPagination = new Pagination();
//		Pagination prevPagination = new Pagination();
//		int listCnt = iMypage.getCntLaterMyBook(userid);
//		int listCnt2 = iMypage.getCntPrevMyBook(userid);
//		// Pagination
//		laterPagination.pageInfo(page, range, listCnt);
//		prevPagination.pageInfo(page, range, listCnt2);
//		model.addAttribute("laterPagination", laterPagination);
//		model.addAttribute("prevPagination", prevPagination);
//		model.addAttribute("mylaterbook", iMypage.getMylaterbook(userid, laterPagination));
//		model.addAttribute("myPrevbook", iMypage.getMyPrevbook(userid, prevPagination));
//		
//		return "mypage/mybook";
//	}
	
	@RequestMapping("/mypage/mybook/{where}")
	public String mybook(@PathVariable("where") String where, HttpServletRequest hsr 
			, Model model, Pagination pagination
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		HttpSession session = hsr.getSession();
		String userid = (String) session.getAttribute("userid");
		iMypage iMypage = sqlSession.getMapper(iMypage.class);
		if(userid != null) {
			if(where.equals("prev") || where.equals("later")) {
				if(where.equals("prev")) {
					// 전체 게시글 개수
					// Pagination
					int listCnt = iMypage.getCntPrevMyBook(userid);
					pagination.pageInfo(page, range, listCnt);
					model.addAttribute("mybook", iMypage.getMyPrevbook(userid, pagination));
					return "mypage/mybook";
				} else if(where.equals("later")) {
					int listCnt = iMypage.getCntLaterMyBook(userid);
					pagination.pageInfo(page, range, listCnt);
					model.addAttribute("mybook", iMypage.getMylaterbook(userid, pagination));
				}
				model.addAttribute("pagination", pagination);
				return "mypage/mybook";
			}
		}
		return "redirect:/home";
	}
	@ResponseBody
	@RequestMapping(value="/mypage/mybook/deleteMybook", method = RequestMethod.POST)
	public String deleteMybook(HttpServletRequest hsr) {
		int book_id = Integer.parseInt(hsr.getParameter("mybook_id"));
		String str="";
		iMypage iMypage = sqlSession.getMapper(iMypage.class);
		iMypage.deleteMybook(book_id);
		try {
			str="ok";
		} catch(Exception e) {
			str="fail";
		}
		System.out.println(str);
		return str;
	}
	
	// MyPage 게시판
	@RequestMapping(value="/mypage/myboard")
	public String listMyBoard(Model m, Page page, HttpSession session, HttpServletRequest hsr) {
		iBoard board = sqlSession.getMapper(iBoard.class);
		int skip = (page.getPageNum() - 1) * page.getAmount();
		
		String userid = (String) session.getAttribute("userid");
		m.addAttribute("m", board.getSession(userid));
		
		String keyword=hsr.getParameter("keyword");
		if(keyword==null) {
			m.addAttribute("b_list", board.mp_boardList(skip, page.getAmount(),userid));

			int total = board.mp_getTotal(userid);
			PageMaker p = new PageMaker(page, total);
			m.addAttribute("p", p);
		} else {
			m.addAttribute("b_list", board.mp_findKeyword(keyword, skip, page.getAmount(),userid));

			int total = board.mp_getKeyTotal(keyword,userid);
			PageMaker p = new PageMaker(page,total);
			m.addAttribute("p",p);
		}
		return "/mypage/myboard";
	}
	
	@ResponseBody
	@RequestMapping(value="/mypage/myboard/deleteMyBoard", method = RequestMethod.POST)
	public String deleteMyBoard(HttpServletRequest hsr) {
		int book_id = Integer.parseInt(hsr.getParameter("mybook_id"));
		String str="";
		iMypage iMypage = sqlSession.getMapper(iMypage.class);
		iMypage.deleteMybook(book_id);
		try {
			str="ok";
		} catch(Exception e) {
			str="fail";
		}
		System.out.println(str);
		return str;
	}
	
}