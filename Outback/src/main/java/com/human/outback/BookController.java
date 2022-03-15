package com.human.outback;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;




@Controller
public class BookController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/submenu/{mtype_name}")
	public String submenu(@PathVariable("mtype_name") String mtype_name, Model model) {
		iBook ibook = sqlSession.getMapper(iBook.class);
		ArrayList<Allmenu> getMenutype = ibook.getMenutype();
		for(int i = 0; i < getMenutype.size(); i++) {
			if(mtype_name.equals(getMenutype.get(i).getMtype_name().toLowerCase())) {
				int menu_type = getMenutype.get(i).getMenu_code();
				ArrayList<Allmenu> getAllmenu = ibook.getAllmenu(menu_type);
				model.addAttribute("menu", getAllmenu);
				model.addAttribute("menucode", getMenutype.get(i).getMenu_code());
				model.addAttribute("mtypename", getMenutype.get(i).getMtype_name().toUpperCase());
				return "submenu";
			}
		}
		return "redirect:/home";
	}
	
	@ResponseBody
	@RequestMapping(value="/insertCart", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String insertCart(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		String userid = (String) session.getAttribute("userid");
		model.addAttribute("userid", userid);
		int menu_code = Integer.parseInt(hsr.getParameter("menu_code"));
		String menu_name = hsr.getParameter("menu_name");
		int menu_price = Integer.parseInt(hsr.getParameter("menu_price"));
		System.out.println(userid + "," + menu_code + "," + menu_name + "," + menu_price);
		String str="";
		iBook ibook = sqlSession.getMapper(iBook.class);
		
		Cart checkCart = ibook.checkCart(userid, menu_code);
		System.out.println("checkCart"+ checkCart);
		if(checkCart != null) {
			int cart_code = checkCart.getCart_code();
			int menu_cnt = checkCart.getMenu_cnt() + 1;
			ibook.updateCart(cart_code, menu_cnt);
			str = "updateCart";
		} else {
			try {
				ibook.insertCart(userid, menu_code, menu_name, menu_price);
				str="addCart";
			} catch(Exception e) {
				str="fail";
			}
		}
		System.out.println(str);
		return str;
	}
	
	@RequestMapping(value="/book", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String bookPageGET(HttpServletRequest hsr, CartList cartlist, Model model) {
		HttpSession session = hsr.getSession();
		String userid = (String) session.getAttribute("userid");
		iBook ibook = sqlSession.getMapper(iBook.class);
		String menu_code = hsr.getParameter("menu_code");
		Member userSession = ibook.getUserSession(userid);
		model.addAttribute("userSession",userSession);
		ArrayList<Spot> getSpot = ibook.getSpot();
		model.addAttribute("spot", getSpot);
		if(menu_code == null) {
			List<Cart> arCart = cartlist.getCart();
			
			ArrayList<Cart> getCartlist = ibook.getBooklist(userid, arCart);
			model.addAttribute("getCartlist", getCartlist);
		} else {
			System.out.println(menu_code);
			Allmenu getMenu = ibook.getMenu(menu_code);
			model.addAttribute("getMenu", getMenu);
		}
		
		return "book";
	}
	
	@RequestMapping(value="/InsertBook", method = RequestMethod.POST)
	public String InsertBook(HttpServletRequest hsr, CartList cartlist) {
		HttpSession session = hsr.getSession();
		List<Cart> cart = cartlist.getCart();
		iBook ibook = sqlSession.getMapper(iBook.class);
		int spot_code = Integer.parseInt(hsr.getParameter("spot_code"));
		String booker = (String) session.getAttribute("userid");
		int howmany = Integer.parseInt(hsr.getParameter("howmany"));
		int m_qty = Integer.parseInt(hsr.getParameter("m_qty"));
		int total = Integer.parseInt(hsr.getParameter("total"));
		String vdate = hsr.getParameter("vdate");
		int vtime = Integer.parseInt(hsr.getParameter("vtime"));
		String msg = hsr.getParameter("msg");
		ibook.insertBook(spot_code, booker, howmany, m_qty, total, vdate, vtime, msg);
		System.out.println(spot_code +", "+ booker +", "+ howmany+", "+m_qty+", "+total+", "+vdate+", "+vtime+", "+msg);
		if(cart == null) {
			System.out.println("null check");
			int menu_code = Integer.parseInt(hsr.getParameter("menu_code"));
			ibook.insertBookDetail2(booker, menu_code);
		} else {
			ibook.insertBookDetail(booker, cart);
			ibook.deleteBookCart(cart);
		}
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
		if(userid != null) {
			iBook ibook = sqlSession.getMapper(iBook.class);
			ArrayList<Cart> cart = ibook.getCart(userid);
			model.addAttribute("getCart", cart);
			return "cart";
		} else {
			return "redirect:/home";
		}
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
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
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
