package com.demo.commom;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class IsLogin {
    public static  boolean isLogin(HttpServletResponse response, HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("loginUser")!=null){
            return true;
        }else{
            return false;
        }
    }
}
