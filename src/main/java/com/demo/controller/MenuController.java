package com.demo.controller;

import com.demo.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
@RequestMapping("/menu")
public class MenuController {
    @Autowired
    private MenuService menuService;
    /*
     * 进入左侧菜单
     * */
    @RequestMapping(value="/menu")
    public String getAllUsers(Model model, HttpServletRequest request, HttpServletResponse response){
        return "WEB-INF/views/menu/left";
    }
}
