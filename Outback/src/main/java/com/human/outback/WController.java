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

import com.human.outback.Member;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class WController {
	
	@Autowired
	private SqlSession sqlSession;
	//로그인
	@RequestMapping("/spot")	
	public String login() {
		return "spot";
	}
	
}