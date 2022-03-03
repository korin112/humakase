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
public class MController {
	
	@Autowired
	private SqlSession sqlSession;
	//로그인
	@RequestMapping("/login")	
	public String login() {
		return "login";
	}
	
	//회원가입
	@RequestMapping("/signon")
	public String signon() {
		return "signon";
	}
	//로그인아이디 체크
	@ResponseBody
	@RequestMapping(value="/confirm_check",method=RequestMethod.POST,
			produces="application/json;charset=utf-8")
	public String confirm_check(HttpServletRequest hsr) {
		String retval="";
		String userid=hsr.getParameter("userid");
		iLogin login=sqlSession.getMapper(iLogin.class);
		ArrayList<Member2> user = login.confirm_check();
		
		for(int i=0; i < user.size(); i++) {
			if(user.get(i).userid.equals(userid)) {
				System.out.println(user.get(i).userid);
				retval="fail";
				break;
			} else {
				retval="ok";
			}
		}
		return retval;
	}
	//회원가입 체크
	@ResponseBody
	@RequestMapping(value="/sign_check",method=RequestMethod.POST)
	public String sign_check(HttpServletRequest hsr,Model model) {
		String retval="";
		String userid=hsr.getParameter("userid");
		String passcode=hsr.getParameter("passcode");
		String name=hsr.getParameter("name");
		String mobile=hsr.getParameter("mobile");
		String gender=hsr.getParameter("gender");
			
		iLogin member=sqlSession.getMapper(iLogin.class);
		ArrayList<Member> m=member.getLogin();
		System.out.println("member count:"+m.size());
		for(int i=0; i<m.size(); i++) {
			System.out.println("등록된 ID:"+m.get(i).getUserid());
			System.out.println("signon ID:"+userid);
			if(m.get(i).getUserid().equals(userid)) {
				retval="overlap";
			} 
		}

		if(!retval.equals("overlap")) {
			member.addLogin(userid,passcode,name,mobile,gender);
			retval="ok";
		}
		System.out.println("retval="+retval);
		return retval;
	}
	//로그인 시간 체크
	@RequestMapping("/login_check")
	public String login_check(HttpServletRequest hsr,Model model) {
		String userid=hsr.getParameter("userid");
		String passcode=hsr.getParameter("passcode");
		iLogin login=sqlSession.getMapper(iLogin.class);
		ArrayList<Member> m = login.getLogin();
		String retval="";
		for(int i=0; i < m.size(); i++) {
			if(m.get(i).getUserid().equals(userid) && m.get(i).getPasscode().equals(passcode)) {
				retval="ok";
				break;
			}
			retval="fail";
			model.addAttribute("retval",retval);
		}
		if(retval.equals("fail")) {
			return "login";
		}
		login.upLogin(userid);
		model.addAttribute("userid",userid);
		return "home";
	}
	//마이페이지 관리
	@RequestMapping("/member")
	public String member() {
		return "member";
	}
	@ResponseBody
	@RequestMapping(value = "/memberList", produces="application/json;charset=utf-8")
	public String memberList() {
		iLogin login=sqlSession.getMapper(iLogin.class);
		ArrayList<Member> m = login.getLogin();
		JSONArray ja = new JSONArray();
		for(int i=0; i < m.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("userid",m.get(i).getUserid());
			jo.put("passcode",m.get(i).getPasscode());
			jo.put("name",m.get(i).getName());
			jo.put("mobile",m.get(i).getMobile());
			jo.put("gender",m.get(i).getGender());
			jo.put("user_type",m.get(i).getUser_type());
			jo.put("login_time",m.get(i).getLogin_time());
			ja.add(jo);
		}
		return ja.toString();
	}
	@ResponseBody
	@RequestMapping(value = "/getDig",produces="application/json;charset=utf-8")
	public String getDig(HttpServletRequest hsr) {
		iLogin log = sqlSession.getMapper(iLogin.class);
		ArrayList<Member3> m = log.getDig();
		JSONArray ja = new JSONArray();
		for(int i=0; i < m.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("userid",m.get(i).getUserid());
			jo.put("m_user_type",m.get(i).getUser_type());
			ja.add(jo);
		}
		return ja.toString();
	}
	@ResponseBody
	@RequestMapping(value = "/dlgEdit", produces="application/json;charset=utf-8")
	public String dlgEdit(HttpServletRequest hsr) {
		iLogin edit = sqlSession.getMapper(iLogin.class);
		ArrayList<Member3> m = edit.getEdit();
		
		JSONArray ja = new JSONArray();
		for(int i=0; i < m.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("m_user_type",m.get(i).getUser_type());
			ja.add(jo);
		}
		return ja.toString();
	}
}