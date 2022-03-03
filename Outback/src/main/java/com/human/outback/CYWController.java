package com.human.outback;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
}
