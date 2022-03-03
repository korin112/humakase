package com.human.outback;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HController {
	// 게시판 목록
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String BoardList() {
		// 게시판 목록
		return "board_list";
	}
	
	// 글쓰기
	@RequestMapping(value = "/board_insert", method = RequestMethod.GET)
	public String Board() {
		// 작성자 = member table userid -> session 값 받아오기(기본값으로 들어가게)
		return "board_insert";
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
	
	@RequestMapping(value = "/menuList", method = RequestMethod.GET)
	public String Menu() {		
		// where 예약 날짜
		// booking table -> menu
		return "";
	}
}
