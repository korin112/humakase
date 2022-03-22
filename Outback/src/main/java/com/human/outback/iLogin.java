package com.human.outback;

import java.util.ArrayList;

public interface iLogin {
	int loginChk2(String userid, String passcode);
	int getUserType(String userid);
	Member confirm_check(String userid);
	void upLogin(String userid);
	ArrayList<Member> getLogin1(int start);
	ArrayList<MemberType> digList();
	ArrayList<Member> getLogin();
	ArrayList<Member> getLogin2();
	ArrayList<Member> infomation();
	ArrayList<MemberType> getMembers();
	void addLogin(String userid,String passcode,String name,String mobile,String gender);
	void updateMember(String userid,int user_type);
	void updateLogout(String userid);
	void updateLogin(String userid);
	void delMember(String userid);
	void pwCheck(String userid,String passcode);
	void pwEdit(String userid,String passcode);
}