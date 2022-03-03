package com.human.outback;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class BookController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/book", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String book(Model model) {
	      
		return "book";
	}
	@RequestMapping("/cart")
	public String cart(Model model) {
		iBook ibook = sqlSession.getMapper(iBook.class);
		ArrayList<Cart> cart = ibook.getCart();
		model.addAttribute("getCart", cart);
		
		return "cart";
	}
	
	@ResponseBody
	@RequestMapping(value="/updateCart", method = RequestMethod.POST)
	public String updateCart(HttpServletRequest hsr) {
		int cart_code = Integer.parseInt(hsr.getParameter("cart_code"));
		int menu_cnt = Integer.parseInt(hsr.getParameter("menu_cnt"));
		
		iBook ibook = sqlSession.getMapper(iBook.class);
		ibook.updateCart(cart_code, menu_cnt);
		
		return "redirect:/cart";
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public String deleteCart(HttpServletRequest hsr) {
		String check = hsr.getParameter("check");
		System.out.println(check);
		String[] cart_code = check.split(",");
		
		String str="";
		try {
			iBook ibook=sqlSession.getMapper(iBook.class);
			
			for(int i = 0; i < cart_code.length; i++) {
				System.out.println("[" + cart_code[i] + "]");
				System.out.println(i);
				ibook.deleteCart(cart_code[i]);
			}
			str="ok";
		} catch(Exception e) {
			str="fail";
		}
		System.out.println(str);
		return str;
	}
}
