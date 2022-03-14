package com.human.outback;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String adm_book(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		String userid = (String) session.getAttribute("userid");
		model.addAttribute("userid", userid);
		
		return "adm/adm_book";
	}
}
