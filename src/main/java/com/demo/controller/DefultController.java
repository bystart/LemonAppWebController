package com.demo.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/")
public class DefultController {
    /*
     * 进入默认首页
     * */
    @RequestMapping(value="/")
    public String shouye(HttpServletRequest request, HttpServletResponse response){
        if (request.getSession().getAttribute("loginUser") == null){
            return "WEB-INF/views/main/login";
        }
        return "WEB-INF/views/main/shouye";
    }
}
