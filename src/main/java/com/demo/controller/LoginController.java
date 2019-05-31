package com.demo.controller;

import com.demo.domain.User;
import com.demo.service.UserService;
import com.demo.sessionListener.WebListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/index")
public class LoginController {
    @Autowired
    private UserService userServcie;
    /*
     * 进入登陆页
     * */
    @RequestMapping(value="/login")
    public String login(Model model, HttpServletRequest request, HttpServletResponse response){

        return "WEB-INF/views/main/login";
    }

    /*
     * 用户登陆
     * */
    @RequestMapping(value="/doLogin")
    @ResponseBody
    public Map<String, String> doLogin(User user, Model model, HttpServletResponse response, HttpServletRequest request){
        Map<String,String> result = new HashMap<String,String>();
        User login = userServcie.login(user);
        if (login.getPassword().equals(user.getPassword())){
            result.put("msg","登陆成功");
            request.getSession().setAttribute("loginUser",login);
            WebListener.addCount();
        }else{
            result.put("msg","密码错误");
        }
        return result;
    }

    /*
     * 进入导航首页
     * */
    @RequestMapping(value="/main")
    public String shouye(Model model, HttpServletRequest request, HttpServletResponse response){

        model.addAttribute("loginNum", WebListener.getCount());
        return "WEB-INF/views/main/shouye";
    }

    /*
     * 获取当前在线人数
     * */
    @RequestMapping(value="/humans")
    @ResponseBody
    public Map<String, String> humans(Model model, HttpServletResponse response, HttpServletRequest request){
        Map<String,String> result = new HashMap<String,String>();
        String muns = String.valueOf(WebListener.getCount());
        result.put("humans",muns);
        return result;
    }

    /*
     * 销毁在线人数
     * */
    @RequestMapping(value="/humanOut")
    @ResponseBody
    public void humanOut(Model model){
        WebListener.seesionOut();
    }

    /*
     * 用户退出
     * */
    @RequestMapping(value="/loginOut")
    public String loginOut(Model model, HttpServletResponse response, HttpServletRequest request){
        request.getSession().removeAttribute("loginUser");
        WebListener.seesionOut();
        return "/WEB-INF/views/main/login";
    }

}
