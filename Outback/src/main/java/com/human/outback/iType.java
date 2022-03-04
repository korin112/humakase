package com.human.outback;

import java.util.ArrayList;

public interface iType {
	void insertType(String mtype_name );
	ArrayList<Menutype> getMenutype();
	void deleteType(int mtype_code);
	void updateType(int mtype_code, String mtype_name);
}
