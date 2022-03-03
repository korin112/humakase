package com.human.outback;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.outback.iMenu;
import com.human.outback.MenuList;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CYWController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model) {
	      
		return "home";
	}
	
	@RequestMapping("steak")
	public String Steak() {
		
		return "steak";
	}
	
	@RequestMapping("pasta")
	public String Pasta() {
		
		return "pasta";
	}

	@RequestMapping("sidemenu")
	public String Sidemenu() {
		
		return "sidemenu";
	}

	@RequestMapping("drink")
	public String Drink() {
		
		return "drink";
	}
	
	@RequestMapping(value = "/management", method = RequestMethod.GET)
	public String management(HttpServletRequest hsr, Model m) {
		
		return "/management";
	}
	
	@RequestMapping("/deleteMenu")
	public String doDeleteMenu(HttpServletRequest hsr) {
		int menu_code=Integer.parseInt(hsr.getParameter("menu_code"));
		
		iMenu menu=sqlSession.getMapper(iMenu.class);
		menu.deleteMenu(menu_code);
		return "redirect:/management";
		}
	
	//�߰�,������Ʈ
	@RequestMapping("/addMenu")
	public String addMenu(HttpServletRequest hsr) {
		String StrCode=hsr.getParameter("menu_code");
		int menu_type=Integer.parseInt(hsr.getParameter("menu_type"));
		String menu_name=hsr.getParameter("menu_name");
		int menu_price=Integer.parseInt(hsr.getParameter("menu_price"));
		
		iMenu menu=sqlSession.getMapper(iMenu.class);
		if(StrCode.equals("")) { //insert
		menu.addMenu(menu_type, menu_name, menu_price);
		}else {
			int menu_code=Integer.parseInt(StrCode);
			menu.updateMenu(menu_code, menu_type, menu_name, menu_price);
		}
		return "redirect:/management";
	}
	
	@ResponseBody
	@RequestMapping(value="/MenuList",method=RequestMethod.GET,
            produces="application/json;charset=utf-8")
	public String menulist() {
		iMenu jc=sqlSession.getMapper(iMenu.class);
		ArrayList<MenuList> Menu=jc.getMenu();
		JSONArray ja=new JSONArray();
		for(int i=0;i<Menu.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("menu_code", Menu.get(i).getMenu_code());
			jo.put("menu_type", Menu.get(i).getMenu_type());
			jo.put("menu_name", Menu.get(i).getMenu_name());
			jo.put("menu_price", Menu.get(i).getMenu_price());
			ja.add(jo);
		}
		return ja.toString();
		}
	
}
