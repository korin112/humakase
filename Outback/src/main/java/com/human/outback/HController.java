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

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class HController {
	@Autowired
	private SqlSession sqlSession;
	
	// 게시판 목록
	@RequestMapping(value = "/board_list")
	public String BoardList(Model m) {
		iBoard board=sqlSession.getMapper(iBoard.class);	
		m.addAttribute("b_list",board.boardList());
		return "board_list";
	}
	
	// 게시판 조회
	@RequestMapping("/getBoard")
	public String Board(Model m,int board_id) {
		iBoard board=sqlSession.getMapper(iBoard.class);	
		m.addAttribute("b",board.getBoard(board_id));
		return "board";
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/board_insert", method = RequestMethod.GET)
	public String BoardInsert() {
		// 작성자 = member table userid -> session 값 받아오기(기본값으로 들어가게)
		return "board_insert";
	}
	@RequestMapping(value = "/board_insert", method = RequestMethod.POST)
	public String BoardInsert(HttpServletRequest hsr) {
		// 작성자 = member table userid -> session 값 받아오기(기본값으로 들어가게)
		
		// test : input으로 값 넣었을 때 들어가게
		String title=hsr.getParameter("title");
		String content=hsr.getParameter("content");
		String writer=hsr.getParameter("writer");
		String vdate=hsr.getParameter("vdate");
		int spot_code=Integer.parseInt(hsr.getParameter("spot"));
		int menu_code=Integer.parseInt(hsr.getParameter("menu"));
		
		System.out.println("title : "+title);
		System.out.println("content : "+content);
		System.out.println("writer : "+writer);
		System.out.println("spot_code : "+spot_code);
		System.out.println("vdate : "+vdate);
		System.out.println("menu_code : "+menu_code);
		
		iBoard b=sqlSession.getMapper(iBoard.class);
		b.insertBoard(title,content,writer,vdate,spot_code,menu_code);
		
//		rttr.addFlashAttribute("result","ok");
		return "redirect:/board_insert";
	}
	
	@RequestMapping(value = "/dateList", method = RequestMethod.GET)
	public String Date() {
		// where 예약 날짜
		return "";
	}
	
	@RequestMapping(value = "/spotList", method = RequestMethod.GET)
	public String Spot() {
		// where 예약 날짜
		// booking table -> spot
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/menuList", produces="application/json;charset=utf-8")
	public String Menu() {		
		// where 예약 날짜
		// booking table -> menu
		
		// test : menu table에서 불러오기
		iBoard menu=sqlSession.getMapper(iBoard.class);
		ArrayList<Board> m=menu.menuList();
		
		JSONArray ja=new JSONArray();
		for(int i=0;i<m.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("menu_code", m.get(i).getMenu_code());
			jo.put("menu_name", m.get(i).getMenu_name());
			ja.add(jo);
		}
		return ja.toString();
	}
}
