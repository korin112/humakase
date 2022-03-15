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
		model.addAttribute("userid", userid);
		
		return "adm/admin";
	}
	
	@RequestMapping("/adm/adm_book")
	public String adm_book(HttpServletRequest hsr, Pagination pagination, Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range) {
		HttpSession session = hsr.getSession();
		String userid = (String) session.getAttribute("userid");
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
	}
	
	@ResponseBody
	@RequestMapping(value="/getbookingdetail", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
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
		System.out.println(ja);
		return ja.toString();
	}
}
