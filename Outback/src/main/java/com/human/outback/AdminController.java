package com.human.outback;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.human.outback.DTO.Pagination;

//import com.human.outback.DTO.Book;

@Controller
public class AdminController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/adm")
	public String admin(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		String userid = (String) session.getAttribute("userid");
		model.addAttribute("userid", userid);
		
		return "adm/admin";
	}
	
	@RequestMapping("/adm/adm_book")
	public String adm_book(HttpServletRequest hsr, Pagination pagination, Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		HttpSession session = hsr.getSession();
		String userid = (String) session.getAttribute("userid");
		model.addAttribute("userid", userid);
		iAdmin iAdmin = sqlSession.getMapper(iAdmin.class);
		// 전체 게시글 개수
		int listCnt = iAdmin.getCntBooking();
		// Pagination
		pagination.pageInfo(page, range, listCnt);
		model.addAttribute("pagination", pagination);
		model.addAttribute("admBook", iAdmin.getAdminBook(pagination));

//		model.addAttribute("admBook", iAdmin.getAdminBook(skip, page.getAmount()));

		return "adm/adm_book";
	}
}
