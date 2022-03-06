package com.human.outback;

import java.util.ArrayList;

public interface iLogin {
	ArrayList<Member3> getMember();
	ArrayList<Member3> getDig();
	ArrayList<MemberType> digList();
	ArrayList<Member2> confirm_check();
	ArrayList<Member> memberList();
	ArrayList<Member> getLogin();
	ArrayList<MemberType> getMembers();
	void addLogin(String userid,String passcode,String name,String mobile,String gender);
	void upLogin(String userid);
	void updateLogin(String userid,String user_type);
}