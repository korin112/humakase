package com.human.outback;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class BookController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/book", method = RequestMethod.GET)
	public String home(Model model) {
	      
		return "book";
	}
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(Model model) {
	      
		return "cart";
	}
}