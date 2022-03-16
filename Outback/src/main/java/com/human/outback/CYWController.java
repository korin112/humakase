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

<<<<<<< HEAD
	@RequestMapping("drink")
	public String Drink() {
		
		return "drink";
	}
	
	@RequestMapping("/typeadd") 
	public String doTypeAdd() {
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
	public String doMenuAdd(Model m) {
		iMenu menu = sqlSession.getMapper(iMenu.class);
	    ArrayList<Menu> alMenu=menu.getMenu();
	    m.addAttribute("alMenu",alMenu);
	    ArrayList<Menutype> alType=menu.getMenutype();
	    m.addAttribute("alType",alType);
		return "addMenu";
	}
=======
   @RequestMapping("drink")
   public String Drink() {
      
      return "drink";
   }
   
   @RequestMapping("/typeadd") 
   public String doTypeAdd() {
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
   public String doMenuAdd(Model m) {
      iMenu menu = sqlSession.getMapper(iMenu.class);
       ArrayList<Menu> alMenu=menu.getMenu();
       m.addAttribute("alMenu",alMenu);
       ArrayList<Menutype> alType=menu.getMenutype();
       m.addAttribute("alType",alType);
      return "addMenu";
   }

   
   
   @ResponseBody
   @RequestMapping(value="/menulist", method = RequestMethod.POST  ,produces = "apllication/json;charset=utf-8")
      public String getMenuList(HttpServletRequest hsr) {
         iMenu menu = sqlSession.getMapper(iMenu.class);
         int menu_code=Integer.parseInt(hsr.getParameter("img"));
         ArrayList<Menu> alMenu=menu.getImg(menu_code);
         System.out.println(alMenu.size());
         JSONArray ja=new JSONArray();
         for(int i=0; i < alMenu.size(); i++) {
            JSONObject jo=new JSONObject();
            jo.put("img", alMenu.get(i).getImg());
            jo.put("comment", alMenu.get(i).getComment());
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
   
   @RequestMapping(value ="/addMenu", method = RequestMethod.GET  ,produces = "apllication/json;charset=utf-8")
   public String doAddMenu(HttpServletRequest hsr) {
      String strMenu_code=hsr.getParameter("menu_code");
      int menu_type=Integer.parseInt(hsr.getParameter("menu_type"));
      String img=hsr.getParameter("img");
      String menu_name=hsr.getParameter("menu_name");
      int menu_price=Integer.parseInt(hsr.getParameter("menu_price"));
      String comment=hsr.getParameter("comment");
      
      iMenu menu=sqlSession.getMapper(iMenu.class);
      ArrayList<Menu> alMenu=menu.getMenu();
      System.out.println(alMenu);
      System.out.println("comment "+hsr.getParameter("comment"));
      if(strMenu_code.equals("")) { // insert
         menu.insertMenu(menu_type,img,menu_name,menu_price,comment);
      } else { // update
         int menu_code=Integer.parseInt(strMenu_code);
         menu.updateMenu(menu_code,menu_type,img,menu_name,menu_price,comment);
      }
      return "redirect:/menuadd";
   }
   
   @RequestMapping("/addType") 
   public String doAddType(HttpServletRequest hsr) {
      String strMtype_code=hsr.getParameter("mtype_code");
      String mtype_name=hsr.getParameter("mtype_name");
      
      
      iType type=sqlSession.getMapper(iType.class);
      if(strMtype_code.equals("")) { // insert
         type.insertType(mtype_name);
      } else { // update
         int mtype_code=Integer.parseInt(strMtype_code);
         type.updateType(mtype_code, mtype_name);
      }
      return "redirect:/typeadd";
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
   
>>>>>>> branch 'main' of https://github.com/korin112/humakase.git

<<<<<<< HEAD
	
	
	@ResponseBody
	@RequestMapping(value="/menulist", method = RequestMethod.POST  ,produces = "apllication/json;charset=utf-8")
	   public String getMenuList(HttpServletRequest hsr) {
	      iMenu menu = sqlSession.getMapper(iMenu.class);
	      int menu_code=Integer.parseInt(hsr.getParameter("img"));
	      ArrayList<Menu> alMenu=menu.getImg(menu_code);
	      System.out.println(alMenu.size());
	      JSONArray ja=new JSONArray();
	      for(int i=0; i < alMenu.size(); i++) {
	         JSONObject jo=new JSONObject();
	         jo.put("img", alMenu.get(i).getImg());
	         jo.put("comment", alMenu.get(i).getComment());
	         ja.add(jo);
	      }
	      return ja.toString();
	   }
	
//	@ResponseBody
//	@RequestMapping(value="/typelist",method = RequestMethod.POST  ,produces = "apllication/json;charset=utf-8")
//	   public String getTypeList() {
//	      iMenu menu = sqlSession.getMapper(iMenu.class);
//	      ArrayList<Menutype> alType=menu.getMenutype();
//	      
//	      JSONArray ja=new JSONArray();
//	      for(int i=0; i < alType.size(); i++) {
//	         JSONObject jo=new JSONObject();
//	         jo.put("mtype_code", alType.get(i).getMtype_code());
//	         jo.put("mtype_name", alType.get(i).getMtype_name());
//	         ja.add(jo);
//	      }
//	      return ja.toString();
//	   }
	
	@RequestMapping(value ="/addMenu", method = RequestMethod.GET  ,produces = "apllication/json;charset=utf-8")
	public String doAddMenu(HttpServletRequest hsr) {
		String strMenu_code=hsr.getParameter("menu_code");
		int menu_type=Integer.parseInt(hsr.getParameter("menu_type"));
		String img=hsr.getParameter("img");
		String menu_name=hsr.getParameter("menu_name");
		int menu_price=Integer.parseInt(hsr.getParameter("menu_price"));
		String comment=hsr.getParameter("comment");
		
		iMenu menu=sqlSession.getMapper(iMenu.class);
		if(strMenu_code.equals("")) { // insert
			menu.insertMenu(menu_type,img,menu_name,menu_price,comment);
		} else { // update
			int menu_code=Integer.parseInt(strMenu_code);
			menu.updateMenu(menu_code,menu_type,img,menu_name,menu_price,comment);
		}
		return "redirect:/menuadd";
	}
	
	@RequestMapping("/addType") 
	public String doAddType(HttpServletRequest hsr) {
		String strMtype_code=hsr.getParameter("mtype_code");
		String mtype_name=hsr.getParameter("mtype_name");
		
		
		iType type=sqlSession.getMapper(iType.class);
		if(strMtype_code.equals("")) { // insert
			type.insertType(mtype_name);
		} else { // update
			int mtype_code=Integer.parseInt(strMtype_code);
			type.updateType(mtype_code, mtype_name);
		}
		return "redirect:/typeadd";
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
=======
   
}
>>>>>>> branch 'main' of https://github.com/korin112/humakase.git
