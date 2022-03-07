package com.human.outback;

import java.util.ArrayList;
import java.util.List;

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
	public String bookPageGET(HttpServletRequest hsr, CartList cartlist, Model model) {
 
//		System.out.println("memberId : " + memberId);
		iBook ibook = sqlSession.getMapper(iBook.class);
		System.out.println("controller : " + cartlist.getCart());
		System.out.println("뭐나오지? : " + cartlist);
		List<Cart> arCart = cartlist.getCart();
		System.out.println(arCart);
		ArrayList<Cart> getCartlist = ibook.getBooklist(arCart);
		model.addAttribute("getCartlist", getCartlist);
//		for(int i = 0; i < arCart.size(); i++) {
//			System.out.println(arCart.get(i));
//			
//			ArrayList<Cart> getCartlist = ibook.getBooklist(arCart.get(i));
//			System.out.println("테스트" + getCartlist);
//			model.addAttribute("getCartlist", getCartlist);
//		}
			
			
//		iBook ibook = sqlSession.getMapper(iBook.class);
//		List<Cart> cart = ibook.getBooklist(List<Cart> cart);
//		public List<Cart> getBooklist(List<Cart> cart);
//		public List<OrderPageItemDTO> getGoodsInfo(List<OrderPageItemDTO> orders)
//		List<Cart> getCart = new ArrayList<Cart>();
//		System.out.println(getCart);
//		for(Cart ct : cart) {
//			OrderPageItemDTO goodsInfo = orderMapper.getGoodsInfo(ord.getBookId());
//			goodsInfo.setBookCount(ord.getBookCount());	
//			goodsInfo.initSaleTotal();
//			getCart.add(goodsInfo);
//		}		
//		
//		return result;
			
//			return "/order";
//		}

		return "book";
	}
	
//	@RequestMapping(value="/book", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
//	public String book(HttpServletRequest hsr, Model model) {
//		iBook ibook = sqlSession.getMapper(iBook.class);
//		ArrayList<Cart> cart = ibook.getCart();
//		String booktest = "booktest" + "0";
//		int cart_code = Integer.parseInt(hsr.getParameter(booktest));
//		ArrayList<Cart> cart2 = ibook.getBooklist(cart_code);
//		model.addAttribute("cart2", cart2);
//		System.out.println(model);
//		System.out.println(cart_code);
//		
//		return "book";
//	}
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
