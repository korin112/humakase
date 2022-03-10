package com.human.outback;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;




@Controller
public class BookController {
	
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value="/book", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String bookPageGET(HttpServletRequest hsr, CartList cartlist, Model model) {
		HttpSession session = hsr.getSession();
		String userid = (String) session.getAttribute("userid");
		iBook ibook = sqlSession.getMapper(iBook.class);
//		System.out.println("controller : " + cartlist.getCart());
//		System.out.println("뭐나오지? : " + cartlist);
		List<Cart> arCart = cartlist.getCart();
//		System.out.println(arCart);
		ArrayList<Cart> getCartlist = ibook.getBooklist(userid, arCart);
		model.addAttribute("getCartlist", getCartlist);
		Member userSession = ibook.getUserSession(userid);
		model.addAttribute("userSession",userSession);
		ArrayList<Spot> getSpot = ibook.getSpot();
		
//		ArrayList<Vtime> getVtime = ibook.getVtime(spot_code);
		model.addAttribute("spot", getSpot);
//		model.addAttribute("vtime", getVtime);
		
		return "book";
	}
	
	@RequestMapping(value="/InsertBook", method = RequestMethod.POST)
	public String InsertBook(HttpServletRequest hsr, CartList cartlist) {
		HttpSession session = hsr.getSession();
		
		int spot_code = Integer.parseInt(hsr.getParameter("spot_code"));
		String booker = (String) session.getAttribute("userid");
		int howmany = Integer.parseInt(hsr.getParameter("howmany"));
		int m_qty = Integer.parseInt(hsr.getParameter("m_qty"));
		int total = Integer.parseInt(hsr.getParameter("total"));
		String vdate = hsr.getParameter("vdate");
		int vtime = Integer.parseInt(hsr.getParameter("vtime"));
		String msg = hsr.getParameter("msg");
		
		System.out.println(spot_code +", "+ booker +", "+ howmany+", "+m_qty+", "+total+", "+vdate+", "+vtime+", "+msg);
		
		iBook ibook = sqlSession.getMapper(iBook.class);
		ibook.insertBook(spot_code, booker, howmany, m_qty, total, vdate, vtime, msg);
//		int cart_code = Integer.parseInt(hsr.getParameter("cart_code"));
//		int menu_cnt = Integer.parseInt(hsr.getParameter("menu_cnt"));
//		
//		iBook ibook = sqlSession.getMapper(iBook.class);
//		ibook.updateCart(cart_code, menu_cnt);
		
		return "redirect:/home";
	}
	
	@ResponseBody
	@RequestMapping(value="/getVtime", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String getVtime(HttpServletRequest hsr) {
		int spot_code = Integer.parseInt(hsr.getParameter("spot_code"));
		String vdate = hsr.getParameter("vdate");
		iBook ibook = sqlSession.getMapper(iBook.class);
		ArrayList<Vtime> getVtime = ibook.getVtime(spot_code, vdate);
		JSONArray ja = new JSONArray();
		for(int i = 0; i < getVtime.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("time_code", getVtime.get(i).getTime_code());
			jo.put("time_name", getVtime.get(i).getTime_name());
			jo.put("remain", getVtime.get(i).getRemain());
			ja.add(jo);
		}
		return ja.toString();
	}
	
	@RequestMapping("/cart")
	public String cart(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		String userid = (String) session.getAttribute("userid");
		
		iBook ibook = sqlSession.getMapper(iBook.class);
		ArrayList<Cart> cart = ibook.getCart(userid);
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
