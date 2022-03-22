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
      Member user = login.confirm_check(hsr.getParameter("userids"));
      
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
	//로그인 유효성 검사
	@RequestMapping(value="/loginChk2", method = RequestMethod.POST)
	public String loginChk2(HttpServletRequest hsr, Model model, RedirectAttributes rttr) {
		iLogin iLogin = sqlSession.getMapper(iLogin.class);
		HttpSession session = hsr.getSession();
		
		String userid = hsr.getParameter("userid");
		String passcode = hsr.getParameter("passcode");
		
		int n = iLogin.loginChk2(userid, passcode);
		System.out.println(userid + passcode);
		if(n == 1) {
			int i = iLogin.getUserType(userid);
			if(i == 0 || i == 1) {
				session.setAttribute("userid", userid);
				session.setAttribute("user_type", i);
				iLogin.upLogin(userid);
				System.out.println("로그인 성공");
				System.out.println("user_type " + i);
				
				return "redirect:/home";
			} else {
				rttr.addFlashAttribute("result", i);
				System.out.println("로그인 실패");
				System.out.println("usertype" + i);
				
				return "redirect:/login";
			}
		} else {
			Member member = iLogin.confirm_check(userid);
			System.out.println(userid);
			if(member != null) {
				rttr.addFlashAttribute("result", "idchk");
				System.out.println("비밀번호 틀림");
			} else {
				rttr.addFlashAttribute("result", "none");
				System.out.println("회원가입Go");
			}
			return "redirect:/login";
		}
	}
	//관리자 회원관리
	@RequestMapping("/member")
	public String member() {
		return "member";
	}
	//관리자 회원관리 로그인 정보 select
	@ResponseBody
	@RequestMapping(value = "/memberList", produces="application/json;charset=utf-8")
	public String memberList(HttpServletRequest hsr) {
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
	   @RequestMapping(value="/paging" ,method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	   public String getLines(HttpServletRequest hsr, Model model) {
	      iLogin login=sqlSession.getMapper(iLogin.class);
	      int lines=10;
	      int pageno=Integer.parseInt(hsr.getParameter("pageno"));
	      int start=lines*pageno+1;
	      System.out.println("start:"+start);
	      ArrayList<Member> m = login.getLogin1(start);
	      System.out.println("msize:"+m.size());
	      JSONArray ja = new JSONArray();
	     for(int i=0; i<m.size(); i++) { 
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
//	     System.out.println(ja.toString());
	     return ja.toString(); 
	   }
	   
	   @ResponseBody 
	   @RequestMapping(value="/pagecheck", method=RequestMethod.GET,produces="application/json;charset=UTF-8")
	   public String pagecheck(HttpServletRequest hsr) {
	      iLogin login=sqlSession.getMapper(iLogin.class);
	      int lines=10;
	      int pageno=Integer.parseInt(hsr.getParameter("pageno"));
	      System.out.println("pageno:"+pageno);
	      int start=lines*pageno+1;
	      ArrayList<Member> m = login.getLogin1(start);
	      System.out.println("페이지넘어갈때마다 보내는 데이터양:"+m.size());
	      JSONArray ja=new JSONArray();
	      for(int i=0; i<m.size(); i++) {
	        JSONObject jo=new JSONObject();
	        jo.put("userid",m.get(i).getUserid());
	        ja.add(jo);
	     }
	     return ja.toString();
	   }

	//관리자 회원관리의 수정버튼 클릭 시 dialog select
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
	//관리자 회원관리의 수정버튼 dialog
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
	//관리자 권한으로 등급수정 변경
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
	//관리자 권한으로 로그인정보 삭제
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
	//마이페이지 이동
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
	//로그인 정보의 비밀번호 확인 및 탈퇴
	@ResponseBody
	@RequestMapping(value="/pwCheck",method = RequestMethod.POST)
	public String pwCheck(HttpServletRequest hsr,Model model) {
		HttpSession session = hsr.getSession();
		String retval="";
		String userid=hsr.getParameter("userid");
		String passcode=hsr.getParameter("passcode");
		System.out.println(userid);
		System.out.println(passcode);
		iLogin pw=sqlSession.getMapper(iLogin.class);
		ArrayList<Member> a=pw.getLogin2();
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
		System.out.println(retval);
		if(retval.equals("ok")) {
			
			pw.pwCheck(userid,passcode);
			session.invalidate();
			return "ok";
		} else {
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