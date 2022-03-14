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
	public String BoardList(Model m, Page page, HttpSession session) {
		iBoard board=sqlSession.getMapper(iBoard.class);
		int skip=(page.getPageNum()-1)*page.getAmount();
		m.addAttribute("b_list",board.boardList(skip,page.getAmount()));
		
		int total = board.getTotal();
        PageMaker p = new PageMaker(page, total);
        m.addAttribute("p",p);
        
        String userid=(String)session.getAttribute("userid");
		m.addAttribute("m",board.getSession(userid));
        
		return "board_list";
	}
		
	// 게시판 조회
	@RequestMapping("/getBoard")
	public String Board(HttpSession session, Model m, int board_id) {
		iBoard board=sqlSession.getMapper(iBoard.class);	
		m.addAttribute("b",board.getBoard(board_id));
		
		String userid=(String)session.getAttribute("userid");
		m.addAttribute("m",board.getSession(userid));
		
		return "board";
	}
	
	// 댓글
	@ResponseBody
	@RequestMapping(value = "/reList", produces="application/json;charset=utf-8")
	public String reBoard(int board_id) {		
		iBoard reBoard=sqlSession.getMapper(iBoard.class);
		System.out.println("board_id : "+board_id);
		ArrayList<ReBoard> re=reBoard.reBoard(board_id);
		
		JSONArray ja=new JSONArray();
		for(int i=0;i<re.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("re_id", re.get(i).getRe_id());
			jo.put("writer", re.get(i).getWriter());
			jo.put("content", re.get(i).getContent());
			jo.put("re_date", re.get(i).getRe_date());
			ja.add(jo);
		}
		return ja.toString();
	}
	
	// 댓글 작성	
	@ResponseBody
	@RequestMapping(value="/re_insert", method = RequestMethod.POST)
	public String reInsert(HttpServletRequest hsr, Model m) {
		int board_id=Integer.parseInt(hsr.getParameter("board_id"));
		String writer=hsr.getParameter("writer");
		String content=hsr.getParameter("content");
				
		//System.out.println("board_id : "+board_id);
		//System.out.println("writer : "+writer);
		//System.out.println("content : "+content);
			
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
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value="/re_delete", method = RequestMethod.POST)
	public String reDelete(HttpServletRequest hsr) {		
		int re_id=Integer.parseInt(hsr.getParameter("re_id"));

		//System.out.println("re_id : "+re_id);
		
		String str="";
		iBoard re=sqlSession.getMapper(iBoard.class);
		try {
			re.reDelete(re_id);
			str="ok";
		} catch(Exception e) {
			str="fail";
		}
		return str;
	}
	
	// 댓글 수정
	@ResponseBody
	@RequestMapping(value="/re_update", method = RequestMethod.POST)
	public String reUpdate(HttpServletRequest hsr) {		
		int re_id=Integer.parseInt(hsr.getParameter("re_id"));
		String content=hsr.getParameter("content");
		
		String str="";
		iBoard re=sqlSession.getMapper(iBoard.class);
		try {
			re.reUpdate(re_id,content);
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
	public String BoardInsert(HttpSession session, Model m) {
		String userid=(String)session.getAttribute("userid");
		m.addAttribute("userid",userid);
		
		iBoard date=sqlSession.getMapper(iBoard.class);
		m.addAttribute("date",date.dateList(userid));
		
		return "board_insert";
	}
	
	@ResponseBody
	@RequestMapping(value = "/board_insert", method = RequestMethod.POST)
	public String BoardInsert(HttpServletRequest hsr) {
		String title=hsr.getParameter("title");
		String content=hsr.getParameter("content");
		String writer=hsr.getParameter("writer");
		String vdate=hsr.getParameter("vdate");
		
		String m_code=hsr.getParameter("menu_code");
		String[] ar=m_code.split(",");
		
		int spot_code=Integer.parseInt(hsr.getParameter("spot"));
			
		System.out.println("title : "+title);
		System.out.println("content : "+content);
		System.out.println("writer : "+writer);
		System.out.println("spot_code : "+spot_code);
		System.out.println("vdate : "+vdate);
			
		String str="";
		iBoard board=sqlSession.getMapper(iBoard.class);
		try {
			board.insertBoard(title,content,writer,vdate,spot_code);
			for(int i=0;i<ar.length;i++) {
				int menu_code=Integer.parseInt(ar[i]);
				System.out.println("menu_code : "+menu_code);
				board.insertBoardMenu(menu_code);
			}
			str="ok";
		} catch(Exception e) {
			str="fail";
		}
		return str;
	}
	
	@ResponseBody
	@RequestMapping(value = "/spotList",  produces="application/json;charset=utf-8")
	public String Spot(HttpServletRequest hsr) {
		String booker=hsr.getParameter("booker");
		String vdate=hsr.getParameter("vdate");
		
		iBoard spot=sqlSession.getMapper(iBoard.class);
		ArrayList<Board> s=spot.spotList(booker,vdate);
		JSONArray ja=new JSONArray();
		for(int i=0;i<s.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("book_id", s.get(i).getBook_id());
			jo.put("spot_code", s.get(i).getSpot_code());
			jo.put("spot_name", s.get(i).getSpot_name());
			ja.add(jo);
		}
		return ja.toString();
	}
		
	@ResponseBody
	@RequestMapping(value = "/menuList", produces="application/json;charset=utf-8")
	public String Menu(HttpServletRequest hsr) {		
		String booker=hsr.getParameter("booker");
		int spot_code=Integer.parseInt(hsr.getParameter("spot_code"));
		int book_id=Integer.parseInt(hsr.getParameter("book_id"));
		
		iBoard menu=sqlSession.getMapper(iBoard.class);
		ArrayList<Board> m=menu.menuList(booker,spot_code,book_id);
			
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
