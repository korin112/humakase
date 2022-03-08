package com.human.outback;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class SHController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/covid_check")
	public String covid() {
		return "covid_check";
	}
	
	@RequestMapping("/sales")
	public String sales() {
		return "sales";
	}
	
	@ResponseBody			
	@RequestMapping(value="/covidcheck",produces="application/json;charset=utf-8",method=RequestMethod.GET)
	public String getCovid(HttpServletRequest hsr) {
		String coviddt=hsr.getParameter("coviddt");	
		System.out.println(coviddt);
		iCovid s = sqlSession.getMapper(iCovid.class);
		ArrayList<CovidDTO> selcovid=s.selCovid(coviddt);
		System.out.println(selcovid.size());
		JSONArray ja= new JSONArray();
		for(int i=0; i<selcovid.size(); i++) {
			JSONObject jo=new JSONObject();
			jo.put("creatdt",selcovid.get(i).getCreatdt());
			jo.put("deathcnt",selcovid.get(i).getDeathcnt());
			jo.put("gubun",selcovid.get(i).getGubun());
			jo.put("incdec",selcovid.get(i).getIncdec());
			jo.put("defcnt",selcovid.get(i).getDefcnt());
			jo.put("localocccnt",selcovid.get(i).getLocalocccnt());
			ja.add(jo);
		}
		return ja.toString();
	}
	
}
