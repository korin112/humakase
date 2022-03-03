package com.human.outback;

import java.util.ArrayList;

public interface iLogin {
	ArrayList<Member> getMember();
	ArrayList<Member3> getDig();
	ArrayList<Member3> getEdit();
	ArrayList<Member2> confirm_check();
	ArrayList<Member> memberList();
	ArrayList<Member> getLogin();
	void addLogin(String userid,String passcode,String name,String mobile,String gender);
	void upLogin(String userid);
}