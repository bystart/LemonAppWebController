package com.demo.controller;

import com.demo.domain.User;
import com.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userServcie;
    /*
    * 进入首页
    * */
    @RequestMapping(value="/list")
    public String getAllUsers(User user, Model model, HttpServletRequest request, HttpServletResponse response){

        List<User>users = userServcie.getAllUsers();
        model.addAttribute("users",users);
        return "WEB-INF/views/user/index";
    }

    /*
    * 进入用户详细页
    * */
    @RequestMapping(value="/main")
    public String doUser(User user, Model model, String opt, HttpServletRequest request, HttpServletResponse response){
        if(opt.equals("update")){
            User user1 = userServcie.getUserById(user);
            model.addAttribute("user",user1);
        }
        model.addAttribute("opt",opt);

        return "WEB-INF/views/user/userAddForm";
    }

    /*
     * 用户修改
     * */
    @RequestMapping(value="/update")
    @ResponseBody
    public Map<String, String> updateUser(User user, Model model, HttpServletRequest request, HttpServletResponse response){

        int i = userServcie.updateUser(user);
        System.out.println(user.toString());
        System.out.println(i);
        Map<String,String> result = new HashMap<String,String>();
        if (i > 0){
            result.put("msg","修改成功");
        }else{
            result.put("msg","修改失败");
        }
        return result;
    }

    /*
     * 用户登陆
     * */
    @RequestMapping(value="/login")
    @ResponseBody
    public Map<String, String> login(User user, Model model){
        Map<String,String> result = new HashMap<String,String>();
        User login = userServcie.login(user);
        if (login.getPassword().equals(user.getPassword())){
            result.put("msg","登陆成功");
        }else{
            result.put("msg","密码错误");
        }
        return result;
    }

    /*
     * 增加用户
     * */
    @RequestMapping(value="/adduser")
    @ResponseBody
    public Map<String, String> addUser(User user, Model model, HttpServletRequest request, HttpServletResponse response){

        int i = userServcie.addUser(user);

        Map<String,String> result = new HashMap<String,String>();
        if (i > 0){
            result.put("msg","添加成功");
        }else{
            result.put("msg","添加失败");
        }
        return result;
    }
    /*
     * 进入导航首页
     * */
    @RequestMapping(value="/shouye")
    public String shouye(User user, Model model, HttpServletRequest request, HttpServletResponse response){

        return "WEB-INF/views/main/shouye.jsp";
    }

    /*
     * 用户登陆模板
     * */
    @RequestMapping(value="/inLoginForm")
    public String cinLoginForm(User user, Model model, HttpServletRequest request, HttpServletResponse response){

        return "WEB-INF/views/user/userLoginForm";
    }
}
