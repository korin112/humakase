package com.human.outback;

import java.util.ArrayList;

public interface iLogin {
	Member confirm_check(String userid);
	Member upLogin(String userid);
	ArrayList<MemberType> digList();
	ArrayList<Member> getLogin();
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