package com.human.outback;

import java.util.ArrayList;
import java.util.Locale;

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

import com.human.outback.Member;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MController {
	
	@Autowired
	private SqlSession sqlSession;
	//로그인
	@RequestMapping("/login")	
	public String login(HttpSession session,Model model,RedirectAttributes rttr) {
		if(session.getAttribute("userid") != null) {
			System.out.println("로그아웃 후 로그인이 가능합니다.");
			rttr.addFlashAttribute("result","already_login");
			return "redirect:/home";
		} else {
		return "login";
		}
	}
	//회원가입
	@RequestMapping("/signon")
	public String signon() {
		return "signon";
	}
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpServletRequest hsr) {
		HttpSession session = hsr.getSession();
		iLogin member = sqlSession.getMapper(iLogin.class);
		
		String userid = (String)session.getAttribute("userid");
		member.updateLogout(userid);
		session.invalidate();
		return "redirect:/home";
	}
	//로그인아이디 체크
	@ResponseBody
	@RequestMapping(value="/confirm_check",method=RequestMethod.POST,
			produces="application/json;charset=utf-8")
	public String confirm_check(HttpServletRequest hsr) {
		iLogin login=sqlSession.getMapper(iLogin.class);
		Member user = login.confirm_check(hsr.getParameter("userid"));
		
		if (user != null) {
			return "fail";
		} else {
			return "ok";
		}
	}
	//회원가입 체크
	@ResponseBody
	@RequestMapping(value="/sign_check",method=RequestMethod.POST)
	public String sign_check(HttpServletRequest hsr,Model model) {
		String retval="";
		String userid=hsr.getParameter("userids");
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
	//로그인 시간 체크 및 탈퇴회원 체크
	@ResponseBody
	@RequestMapping(value="/login_check",method=RequestMethod.POST,
	         produces="application/json; charset=utf-8")
	   public String login_check(HttpServletRequest hsr, Model model) {
	      iLogin id=sqlSession.getMapper(iLogin.class);
	      ArrayList<Member> ml = id.getLogin();
	      JSONArray ja=new JSONArray();
	      for(int i=0; i<ml.size(); i++) {
	         JSONObject jo = new JSONObject();
	         jo.put("userid",ml.get(i).getUserid());
	         jo.put("passcode",ml.get(i).getPasscode());
	         ja.add(jo);
	         }
	      return ja.toString();
	   }
	@ResponseBody
	@RequestMapping(value="/upLogin",method=RequestMethod.POST,
			produces = "application/json;charset=UTF-8")
	public String upLogin(HttpServletRequest hsr, Model model) {
		String retval="";
		try {
		iLogin member = sqlSession.getMapper(iLogin.class);
		String userid=hsr.getParameter("userid");
		Member update=member.upLogin(userid);
		
		HttpSession session = hsr.getSession();
		
		session.setAttribute("userid", userid);
		session.setAttribute("user_type",update.getUser_type());
		model.addAttribute("userid",userid);
		System.out.println(update.getUserid());
		retval="ok";
		} catch(Exception e) {
		retval="fail";
		}
		return retval;
	}
//	@RequestMapping(value="/login_check", method = RequestMethod.POST)
//	public String login_check(HttpServletRequest hsr,Model model) {
//		HttpSession session = hsr.getSession();
//		
//		String str="";
//		String userid = hsr.getParameter("userid");
//		String passcode = hsr.getParameter("passcode");
//		int type=0;
//		iLogin login = sqlSession.getMapper(iLogin.class);
//		ArrayList<Member> m=login.getLogin();
//		
//		for(int i=0; i < m.size(); i++) {
////			System.out.println(m.get(i).getUser_type().getClass().getName());
//			if(m.get(i).getPasscode().equals(passcode) && m.get(i).getUserid().equals(userid)) {
//				type=m.get(i).getUser_type();
//			}
//		}
//		System.out.println(userid);
//		System.out.println(passcode);
//		System.out.println(type);
//		if(type == 1) {
//				login.upLogin(userid);
//				session.setAttribute("userid",userid);
//				session.setAttribute("user_type",type);
//				return "redirect:/home";
//		} else if (type == 2) {
//				str="test";
//				model.addAttribute("error",str);
//				return "login";
//		} else if (type == 0) {
//				login.upLogin(userid);
//				session.setAttribute("userid",userid);
//				session.setAttribute("user_type",type);
//				return "redirect:/home";
//		} else {
//			str="fail";
//			model.addAttribute("fail_user",str);
//			return "login";
//		}
//	}
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
			jo.put("logout_time",m.get(i).getLogout_time());
			ja.add(jo);
		}
		return ja.toString();
	}
	@ResponseBody
	@RequestMapping(value = "/getDig",produces="application/json;charset=utf-8")
	public String getDig(HttpServletRequest hsr) {
		iLogin log = sqlSession.getMapper(iLogin.class);
		ArrayList<MemberType> m = log.digList();
		JSONArray ja = new JSONArray();
		for(int i=0; i < m.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("_type_code2",m.get(i).getType_code());
			jo.put("_type_name2",m.get(i).getType_name());
			ja.add(jo);
		}
		return ja.toString();
	}
	@ResponseBody
	@RequestMapping(value = "/digEdit", produces="application/json;charset=utf-8")
	public String dlgEdit(HttpServletRequest hsr) {
		iLogin edit = sqlSession.getMapper(iLogin.class);
		ArrayList<MemberType> m = edit.digList();
		
		JSONArray ja = new JSONArray();

		for(int i=0; i < m.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("userid",m.get(i).getUserid());
			jo.put("_type_code2",m.get(i).getType_code());
			jo.put("_type_name2",m.get(i).getType_name());
			ja.add(jo);
		}
		return ja.toString();
	}
	@ResponseBody
	@RequestMapping(value = "/updateMember", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	public String updateLogin(HttpServletRequest hsr) {
		String retval="";
		System.out.println("["+hsr.getParameter("userid")+"]");
		System.out.println("["+hsr.getParameter("user_type")+"]");
		String userid=hsr.getParameter("userid");
		int code=Integer.parseInt(hsr.getParameter("user_type"));
		try {
			iLogin log = sqlSession.getMapper(iLogin.class);
			log.updateMember(userid,code);
			retval="ok";
		} catch(Exception e) {
			retval="fail";
		}
		return retval;
	}
	@ResponseBody
	@RequestMapping(value = "/delMember", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	public String delMember(HttpServletRequest hsr) {
		System.out.println("["+hsr.getParameter("box")+"]");
		String select=hsr.getParameter("box");
		String[] user=select.split(",");
		
		String str="";
		try {
			iLogin mem=sqlSession.getMapper(iLogin.class);
			
			for(int i=0; i < user.length; i++) {
				mem.delMember(user[i]);
			}
			str="ok";
		} catch(Exception e) {
			str="fail";
		}
		return str;
	}
	@RequestMapping("/mypage")
	public String mypage() {
		return "mypage";
	}
	@ResponseBody
	@RequestMapping(value = "/infomation", method=RequestMethod.GET,produces="application/json;charset=utf-8")
	public String infomation() {
		iLogin login=sqlSession.getMapper(iLogin.class);
		ArrayList<Member> m = login.infomation();
		JSONArray ja = new JSONArray();
		for(int i=0; i < m.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("userid",m.get(i).getUserid());
			jo.put("passcode",m.get(i).getPasscode());
			jo.put("name",m.get(i).getName());
			jo.put("mobile",m.get(i).getMobile());
			ja.add(jo);
		}
		return ja.toString();
	}
	@ResponseBody
	@RequestMapping(value="/pwCheck",method = RequestMethod.POST)
	public String pwCheck(HttpServletRequest hsr,Model model) {
		HttpSession session = hsr.getSession();
		
		String retval="";
		String userid=hsr.getParameter("userid");
		String passcode=hsr.getParameter("passcode");
//		int usertype=Integer.parseInt(hsr.getParameter("user_type"));
		
		iLogin pw=sqlSession.getMapper(iLogin.class);
		ArrayList<Member> a=pw.getLogin();
		
		for(int i=0; i < a.size(); i++) {
			if(a.get(i).getPasscode().equals(passcode) && a.get(i).getUserid().equals(userid)) {
				session.setAttribute("userid", userid);
				retval="ok";
				break;
			} 
			else {
				retval="fail";
			}
		}
		if(retval.equals("ok")) {
//			session.setAttribute("userid",userid);
//			session.setAttribute("passcode",passcode);
//			session.setAttribute("user_type",usertype);
			pw.pwCheck(userid,passcode);
			session.invalidate();
			return "ok";
		} else {
			model.addAttribute("fail_user",retval);
			return "fail";
		}
	}
	@RequestMapping(value = "/passEdit")
	public String passEdit() {
		return "passEdit";
	}
	@ResponseBody
	@RequestMapping(value="/pwEdit",method=RequestMethod.POST, produces="application/json;charset=utf-8")
	public String pwEdit(HttpServletRequest hsr) {
		String retval="";
		try {
			iLogin member = sqlSession.getMapper(iLogin.class);
			String userid=hsr.getParameter("userid");
			String passcode=hsr.getParameter("passcode");
			member.pwEdit(userid,passcode);
			
			retval="ok";
		} catch(Exception e) {
			retval="fail";
		}
			return retval;
	}
}