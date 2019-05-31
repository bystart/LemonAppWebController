package com.demo.sessionListener;


import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


public class WebListener implements HttpSessionListener {

    private static int count = 0; //统计数
    public static int getCount() {
        return count;
    }

    public void sessionCreated(HttpSessionEvent se) {
    }
     //在Session销毁时,统计数减1
    public void sessionDestroyed(HttpSessionEvent se){
        HttpSession session = se.getSession();
        session.removeAttribute("loginUser");
        if (WebListener.getCount() == 0){
            WebListener.count = 0;
        }else{
            WebListener.count--;
        }
    }
    //当浏览器销毁在线用户-1



    public static void seesionOut(){
        if (WebListener.getCount() == 0){
            WebListener.count = 0;
        }else{
            WebListener.count--;
        }
    }
    public static void addCount(){
        WebListener.count++;
    }
}