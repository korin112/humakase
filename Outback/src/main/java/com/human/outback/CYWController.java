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

import com.human.outback.Menu;
import com.human.outback.Menutype;
import com.human.outback.iMenu;
import com.human.outback.iType;

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
	
	@RequestMapping("/typeadd") 
	public String doTypeAdd() {
		return "addType";
	}
	
	@RequestMapping("/addType") 
	public String doAddType(HttpServletRequest hsr) {
		int mtype_code=Integer.parseInt(hsr.getParameter("mtype_code"));
		String mtype_name=hsr.getParameter("mtype_name");
		
		iType type=sqlSession.getMapper(iType.class);
		type.addType(mtype_code,mtype_name);
		return "addType";
	}
	
	@RequestMapping("/menu")
	public String doMenuList(Model m) {
		iMenu menu=sqlSession.getMapper(iMenu.class);
		ArrayList<Menu> alMenu=menu.getMenu();
		System.out.println("size["+alMenu.size()+"]");
		m.addAttribute("alMenu",alMenu);
		return "menu";
	}
	
	@RequestMapping("/menuadd") 
	public String doMenuAdd(Model model) {

		return "addMenu";
	}
	
	@ResponseBody
	@RequestMapping(value="/menulist", produces = "apllication/json;charset=utf-8")
	   public String getMenuList() {
	      iMenu menu = sqlSession.getMapper(iMenu.class);
	      ArrayList<Menu> alMenu=menu.getMenu();
	      
	      JSONArray ja=new JSONArray();
	      for(int i=0; i < alMenu.size(); i++) {
	         JSONObject jo=new JSONObject();
	         jo.put("menu_code", alMenu.get(i).getMenu_code());
	         jo.put("menu_type", alMenu.get(i).getMenu_type());
	         jo.put("menu_name", alMenu.get(i).getMenu_name());
	         jo.put("menu_price", alMenu.get(i).getMenu_price());
	         ja.add(jo);
	      }
	      return ja.toString();
	   }
	
	@ResponseBody
	@RequestMapping(value="/typelist",method = RequestMethod.POST  ,produces = "apllication/json;charset=utf-8")
	   public String getTypeList() {
	      iMenu menu = sqlSession.getMapper(iMenu.class);
	      ArrayList<Menutype> alType=menu.getMenutype();
	      
	      JSONArray ja=new JSONArray();
	      for(int i=0; i < alType.size(); i++) {
	         JSONObject jo=new JSONObject();
	         jo.put("mtype_code", alType.get(i).getMtype_code());
	         jo.put("mtype_name", alType.get(i).getMtype_name());
	         ja.add(jo);
	      }
	      return ja.toString();
	   }
	
	@RequestMapping("/addMenu") // submit 버튼이 눌렸을 때
	public String doAddMenu(HttpServletRequest hsr) {
		String strMenu_code=hsr.getParameter("menu_code");
		int menu_type=Integer.parseInt(hsr.getParameter("menu_type"));
		String menu_name=hsr.getParameter("menu_name");
		int menu_price=Integer.parseInt(hsr.getParameter("menu_price"));
		
		iMenu menu=sqlSession.getMapper(iMenu.class);
		if(strMenu_code.equals("")) { // insert
			menu.insertMenu(menu_type,menu_name,menu_price);
		} else { // update
			int menu_code=Integer.parseInt(strMenu_code);
			menu.updateMenu(menu_code,menu_type,menu_name,menu_price);
		}
		return "redirect:/menuadd";
	}
	@RequestMapping("deleteMenu")
	public String doDeleteMenu(HttpServletRequest hsr) {
		int menu_code=Integer.parseInt(hsr.getParameter("menu_code"));
		
		iMenu menu = sqlSession.getMapper(iMenu.class);
		menu.deleteMenu(menu_code);
		return "redirect:/menuadd";
	}
	
	@RequestMapping("deleteType")
	public String doDeleteType(HttpServletRequest hsr) {
		int mtype_code=Integer.parseInt(hsr.getParameter("mtype_code"));
		
		iType type = sqlSession.getMapper(iType.class);
		type.deleteType(mtype_code);
		return "redirect:/typeadd";
	}
	

	
}
