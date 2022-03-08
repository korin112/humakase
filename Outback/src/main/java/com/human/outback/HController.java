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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class HController {
	@Autowired
	private SqlSession sqlSession;
	
	// 게시판 목록
	@RequestMapping(value = "/board_list")
	public String BoardList(Model m, Page page) {
		iBoard board=sqlSession.getMapper(iBoard.class);
		int skip=(page.getPageNum()-1)*page.getAmount();
		m.addAttribute("b_list",board.boardList(skip,page.getAmount()));
		
		int total = board.getTotal();
		//System.out.println(total);
        PageMaker p = new PageMaker(page, total);
        m.addAttribute("p",p);
        
		return "board_list";
	}
		
	// 게시판 조회
	@RequestMapping("/getBoard")
	public String Board(HttpSession session, Model m, int board_id) {
		iBoard board=sqlSession.getMapper(iBoard.class);	
		m.addAttribute("b",board.getBoard(board_id));
		
		// 댓글
		String userid=(String)session.getAttribute("userid");
		m.addAttribute("m",board.getSession(userid));
		m.addAttribute("reBoard",board.reBoard(board_id));
		
		System.out.println(board.getSession(userid));
		System.out.println(board.reBoard(board_id));
		return "board";
	}
	// 댓글
	/*
	 * @RequestMapping(value="/re_board") public String reBoard(int board_id, Model
	 * m, HttpServletRequest hsr, HttpSession session) { iBoard
	 * re=sqlSession.getMapper(iBoard.class);
	 * m.addAttribute("b",re.getBoard(board_id));
	 * 
	 * // member userid, usertype 받아오기 String
	 * userid=(String)session.getAttribute("userid");
	 * m.addAttribute("m",re.getSession(userid));
	 * 
	 * m.addAttribute("re",re.reBoard(board_id)); return "re_board"; }
	 */
	
	@ResponseBody
	@RequestMapping(value="/re_insert", method = RequestMethod.POST)
	public String reInsert(HttpServletRequest hsr, Model m) {
		int board_id=Integer.parseInt(hsr.getParameter("board_id"));
		String writer=hsr.getParameter("writer");
		String content=hsr.getParameter("content");
				
		System.out.println("board_id : "+board_id);
		System.out.println("writer : "+writer);
		System.out.println("content : "+content);
			
		
		String str="";
		iBoard re=sqlSession.getMapper(iBoard.class);
		try {
			re.reInsert(board_id,board_id,writer,content);
			str="ok";
		} catch(Exception e) {
			str="fail";
		}
		return str;
	}
	// 게시판 삭제
	@RequestMapping("/board_delete")
	public String BoardDelete(int board_id, RedirectAttributes rttr) {
		iBoard board=sqlSession.getMapper(iBoard.class);	
		board.deleteBoard(board_id);
		rttr.addFlashAttribute("result","delete");
		return "redirect:/board_list";
	}
	
	// 게시판 수정
	@RequestMapping("/board_update")
	public String BoardUpdate(Model m, int board_id) {
		iBoard board=sqlSession.getMapper(iBoard.class);	
		m.addAttribute("b",board.getBoard(board_id));
		
		return "board_update";
	}
	
	@ResponseBody
	@RequestMapping(value = "/board_update", method = RequestMethod.POST)
	public String BoardUpdate(HttpServletRequest hsr) {
		int board_id=Integer.parseInt(hsr.getParameter("board_id"));
		String title=hsr.getParameter("title");
		String content=hsr.getParameter("content");
		
		System.out.println("["+board_id+"]");
		System.out.println("["+title+"]");
		System.out.println("["+content+"]");
		
		String str="";
		iBoard board=sqlSession.getMapper(iBoard.class);
		try {
			board.updateBoard(board_id,title,content);
			str="ok";
		} catch(Exception e) {
			str="fail";
		}
		return str;
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/board_insert", method = RequestMethod.GET)
	public String BoardInsert() {
		// 작성자 = member table userid -> session 값 받아오기(기본값으로 들어가게)
		return "board_insert";
	}
	@ResponseBody
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
			
		String str="";
		iBoard board=sqlSession.getMapper(iBoard.class);
		try {
			board.insertBoard(title,content,writer,vdate,spot_code,menu_code);
			str="ok";
		} catch(Exception e) {
			str="fail";
		}
		return str;
	}
		
	@RequestMapping(value = "/dateList", method = RequestMethod.GET)
	public String Date() {
		// where 예약 날짜
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/spotList",  produces="application/json;charset=utf-8")
	public String Spot() {
		// where 예약 날짜
		// booking table -> spot
		
		// test : spot table에서 불러오기
		iBoard spot=sqlSession.getMapper(iBoard.class);
		ArrayList<Board> s=spot.spotList();
			
		JSONArray ja=new JSONArray();
		for(int i=0;i<s.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("spot_code", s.get(i).getSpot_code());
			jo.put("spot_name", s.get(i).getSpot_name());
			ja.add(jo);
		}
		return ja.toString();
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
