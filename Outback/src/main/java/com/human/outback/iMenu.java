package com.human.outback;

import java.util.ArrayList;

public interface iMenu {
	ArrayList<Menu> getMenu();
	void insertMenu(int menu_type,String img,String menu_name,int menu_price,String comment);
	void deleteMenu(int menu_code);
	ArrayList<Menutype> getMenutype();
	void updateMenu(int menu_code, int menu_type, String img,String menu_name, int menu_price,String comment);
}
