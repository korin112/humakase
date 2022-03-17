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
		if(where.equals("prev") || where.equals("later") || userid != null) {
			if(where.equals("prev")) {
				// 전체 게시글 개수
				// Pagination
				int listCnt = iMypage.getCntPrevMyBook(userid);
				System.out.println(listCnt);
				pagination.pageInfo(page, range, listCnt);
				model.addAttribute("mybook", iMypage.getMyPrevbook(userid, pagination));
				return "mypage/mybook";
			} else if(where.equals("later")) {
				int listCnt = iMypage.getCntLaterMyBook(userid);
				System.out.println(listCnt);
				pagination.pageInfo(page, range, listCnt);
				model.addAttribute("mybook", iMypage.getMylaterbook(userid, pagination));
			}
			model.addAttribute("pagination", pagination);
			return "mypage/mybook";
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
}