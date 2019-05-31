package com.demo.dao;

import com.demo.domain.Menu;

import java.util.List;

public interface MenuDao {
    public List<Menu> getAllMenus();
    public Menu getMenuById(Menu menu);
    public Menu getMenuByName(Menu menu);
    public int updateMenu(Menu menu);
    public int addMenu(Menu menu);
}
