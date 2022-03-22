package com.human.outback;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.outback.DTO.BookingDetail;
import com.human.outback.DTO.Menu;
import com.human.outback.DTO.Menutype;
import com.human.outback.DTO.Pagination;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

//import com.human.outback.DTO.Book;

@Controller
public class AdminController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/adm")
	public String admin(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		String userid = (String) session.getAttribute("userid");
		int user_type = (int) session.getAttribute("user_type");
		if(user_type == 1) {
			model.addAttribute("userid", userid);
			return "adm/admin";
		} else {
			return "redirect:/home";
		}
		
	}
	
	@RequestMapping("/adm/adm_book")
	public String adm_book(HttpServletRequest hsr, Pagination pagination, Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		HttpSession session = hsr.getSession();
		String userid = (String) session.getAttribute("userid");
		int user_type = (int) session.getAttribute("user_type");
		if(user_type == 1) {
			model.addAttribute("userid", userid);
			iAdmin iAdmin = sqlSession.getMapper(iAdmin.class);
			// 전체 게시글 개수
			int listCnt = iAdmin.getCntBooking();
			// Pagination
			pagination.pageInfo(page, range, listCnt);
			model.addAttribute("pagination", pagination);
			model.addAttribute("admBook", iAdmin.getAdminBook(pagination));
	
	//		model.addAttribute("admBook", iAdmin.getAdminBook(skip, page.getAmount()));
			
			return "adm/adm_book";
		} else {
			return "redirect:/home";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/adm/getbookingdetail", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String getbookingdetail(HttpServletRequest hsr) {
		int book_id = Integer.parseInt(hsr.getParameter("book_id"));
		iAdmin iAdmin = sqlSession.getMapper(iAdmin.class);
		ArrayList<BookingDetail> adm_bd = iAdmin.getAdmBookingDetail(book_id);
		JSONArray ja = new JSONArray();
		for(int i = 0; i < adm_bd.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("menu_code", adm_bd.get(i).getMenu_code());
			jo.put("menu_name", adm_bd.get(i).getMenu_name());
			jo.put("m_qty", adm_bd.get(i).getM_qty());
			jo.put("price", adm_bd.get(i).getPrice());
			jo.put("total", adm_bd.get(i).getTotal());
			ja.add(jo);
		}
		return ja.toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/adm/deleteAdmBook", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String deleteAdmBook(HttpServletRequest hsr) {
		String check = hsr.getParameter("check");
		String[] book_id = check.split(",");
		
		String str="";
		try {
			iAdmin iAdmin = sqlSession.getMapper(iAdmin.class);
			for(int i = 0; i < book_id.length; i++) {
				iAdmin.deleteAdmBook(book_id[i]);
			}
			str="ok";
		} catch(Exception e) {
			str="fail";
		}
		System.out.println(str);
		return str;
	}
	

	@RequestMapping("/adm/adm_member")
	public String adm_Member(HttpServletRequest hsr) {
		HttpSession session = hsr.getSession();
		int user_type = (int) session.getAttribute("user_type");
		if(user_type == 1) {
			return "adm/adm_member";
		} else {
			return "redirect:/home";
		}
	}

	@RequestMapping("/adm/menuadd") 
	public String doMenuAdd(HttpServletRequest hsr, Model m) {
		HttpSession session = hsr.getSession();
		int user_type = (int) session.getAttribute("user_type");
		if(user_type == 1) {
			iAdmin menu = sqlSession.getMapper(iAdmin.class);
			ArrayList<Menu> alMenu=menu.getMenu();
			m.addAttribute("alMenu",alMenu);
			ArrayList<Menutype> alType=menu.getMenutype();
			m.addAttribute("alType",alType);
			return "adm/adm_menu";
		} else {
			return "redirect:/home";
		}
	}
	// 메뉴 관리 페이지
	@RequestMapping(value ="/adm/adm_menu", method = RequestMethod.GET  ,produces = "apllication/json;charset=utf-8")
	public String doAddMenu(HttpServletRequest hsr) {
		String strMenu_code=hsr.getParameter("menu_code");
		int menu_type=Integer.parseInt(hsr.getParameter("menu_type"));
		System.out.println("menu_type "+hsr.getParameter("menu_type"));
		String img=hsr.getParameter("img");
		String menu_name=hsr.getParameter("menu_name");
		int menu_price=Integer.parseInt(hsr.getParameter("menu_price"));
		System.out.println("menu_price "+hsr.getParameter("menu_price"));
		String comment=hsr.getParameter("comment");
		iAdmin menu=sqlSession.getMapper(iAdmin.class);
		ArrayList<Menu> alMenu=menu.getMenu();
		System.out.println(alMenu);
		System.out.println("comment "+hsr.getParameter("comment"));
		if(strMenu_code.equals("")) { // insert
			menu.insertMenu(menu_type,img,menu_name,menu_price,comment);
		} else { // update
			int menu_code=Integer.parseInt(strMenu_code);
			menu.updateMenu(menu_code,menu_type,img,menu_name,menu_price,comment);
		}
		return "redirect:/adm/menuadd";
	}
	// 메뉴 리스트
	@ResponseBody
	   @RequestMapping(value="/adm/menulist", method = RequestMethod.POST  ,produces = "apllication/json;charset=utf-8")
	      public String getMenuList(HttpServletRequest hsr) {
	         iAdmin menu = sqlSession.getMapper(iAdmin.class);
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
	// 메뉴 타입추가
	@RequestMapping("/adm/typeadd") 
	public String doTypeAdd(HttpServletRequest hsr) {
		HttpSession session = hsr.getSession();
		int user_type = (int) session.getAttribute("user_type");
		if(user_type == 1) {
			return "adm/adm_menutype";
		} else {
			return "redirect:/home";
		}
	}
	// 메뉴 타입 리스트
	@ResponseBody
	@RequestMapping(value="/adm/typelist",method = RequestMethod.POST  ,produces = "apllication/json;charset=utf-8")
	public String getTypeList() {
	         iAdmin menu = sqlSession.getMapper(iAdmin.class);
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
	   // 메뉴 타입 추가
	   @RequestMapping("/adm/adm_menutype") 
	   public String doAddType(HttpServletRequest hsr) {
	      String strMtype_code=hsr.getParameter("mtype_code");
	      String mtype_name=hsr.getParameter("mtype_name");
	      
	      
	      iAdmin type=sqlSession.getMapper(iAdmin.class);
	      if(strMtype_code.equals("")) { // insert
	         type.insertType(mtype_name);
	      } else { // update
	         int mtype_code=Integer.parseInt(strMtype_code);
	         type.updateType(mtype_code, mtype_name);
	      }
	      return "redirect:/adm/typeadd";
	   }
	   // 메뉴삭제
	   @RequestMapping("/adm/deleteMenu")
	   public String doDeleteMenu(HttpServletRequest hsr) {
	      int menu_code=Integer.parseInt(hsr.getParameter("menu_code"));
	      
	      iAdmin menu = sqlSession.getMapper(iAdmin.class);
	      menu.deleteMenu(menu_code);
	      return "redirect:/adm/menuadd";
	   }
	   // 메뉴타입 삭제
	   @RequestMapping("/adm/deleteType")
	   public String doDeleteType(HttpServletRequest hsr) {
	      int mtype_code=Integer.parseInt(hsr.getParameter("mtype_code"));
	      
	      iAdmin type = sqlSession.getMapper(iAdmin.class);
	      type.deleteType(mtype_code);
	      return "redirect:/adm/typeadd";
	   }

	   
	   @RequestMapping("/adm/member_adm")
	   public String adm_member() {
		   return "/adm/adm_member";
	   }


	// 리뷰 게시판
	@RequestMapping("/adm/adm_board")
	public String adminBoard(Page page, Model m, HttpServletRequest hsr) {
		HttpSession session = hsr.getSession();
		int user_type = (int) session.getAttribute("user_type");
		if(user_type == 1) {
			iBoard board = sqlSession.getMapper(iBoard.class);
			int skip = (page.getPageNum() - 1) * page.getAmount();
			String keyword=hsr.getParameter("keyword");
			if(keyword==null) {
				m.addAttribute("b_list", board.boardList(skip, page.getAmount()));
	
				int total = board.getTotal();
				PageMaker p = new PageMaker(page, total);
				m.addAttribute("p", p);
			} else {
				m.addAttribute("b_list", board.findKeyword(keyword, skip, page.getAmount()));
				int total = board.getKeyTotal(keyword);
				PageMaker p = new PageMaker(page,total);
				m.addAttribute("p",p);
			}
			return "/adm/adm_board";
		} else {
			return "redirect:/home";
		}
	}
	   
	   @ResponseBody
	   @RequestMapping(value="/adm/adm_board_delete", method = RequestMethod.POST)
	   public String deleteMyBoard(HttpServletRequest hsr) {
			String check=hsr.getParameter("check");
			String[] id=check.split(",");

			System.out.println(check);
			System.out.println(id);
			
			String str="";
			iBoard board = sqlSession.getMapper(iBoard.class);
			
			try {
				for(int i=0; i<id.length; i++) {
					int board_id=Integer.parseInt(id[i]);
					board.deleteBoard(board_id);
				}
				str="ok";
			} catch(Exception e) {
				str="fail";
			}
			System.out.println(str);
			return str;
	   }
}
