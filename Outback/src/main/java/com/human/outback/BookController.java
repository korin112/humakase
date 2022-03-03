package com.human.outback;

import java.util.ArrayList;

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
	@RequestMapping("/cart")
	public String cart(Model model) {
		iBook ibook = sqlSession.getMapper(iBook.class);
		ArrayList<Cart> cart = ibook.getCart();
		model.addAttribute("getCart", cart);
		
		return "cart";
	}
}
