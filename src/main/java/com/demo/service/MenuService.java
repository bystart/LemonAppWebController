package com.demo.service;

import com.demo.dao.MenuDao;
import com.demo.domain.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("MenuService")
public class MenuService {
    @Autowired
    protected MenuDao menuDao;

    /*
    * 获取所有菜单
    *
    * */
    public List<Menu> getAllmenus(){
        return menuDao.getAllMenus();
    }
    /*
    * 根据菜单ID获取
    * */
    public Menu getmenuById(Menu menu){
        return menuDao.getMenuById(menu);
    }
    /*
    * 根据菜单名获取
    * */
    public Menu getmenuByName(Menu menu){
        return menuDao.getMenuByName(menu);
    }
    /*
    * 更新菜单
    * */
    public int updateMenu(Menu menu){
        return menuDao.updateMenu(menu);
    }
    /*
    * 添加菜单
    * */
    public int addMenu(Menu menu){
        return menuDao.addMenu(menu);
    }
}
