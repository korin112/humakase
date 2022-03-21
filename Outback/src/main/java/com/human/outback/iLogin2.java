package com.human.outback;



public interface iLogin2 {
	int loginChk2(String userid, String passcode);
	int getUserType(String userid);
	Member confirm_check(String userid);
	void upLogin(String userid);
}