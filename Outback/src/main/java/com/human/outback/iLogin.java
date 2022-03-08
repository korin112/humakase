package com.human.outback;

import java.util.ArrayList;

public interface iLogin {
	ArrayList<MemberType> digList();
	ArrayList<Member2> confirm_check();
	ArrayList<Member> getLogin();
	ArrayList<Member> infomation();
	ArrayList<MemberType> getMembers();
	void addLogin(String userid,String passcode,String name,String mobile,String gender);
	void upLogin(String userid);
	void updateMember(String userid,String user_type);
	void updateLogout(String userid);
	void updateLogin(String userid);
	void delMember(String userid);
	void pwCheck(String userid,String passcode);
}