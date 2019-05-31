package com.demo.service;

import com.demo.dao.UserDao;
import com.demo.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("UserService")
public class UserService {
    @Autowired
    protected UserDao userDao;

    /*
    * 获取所有用户
    * */
    public List<User> getAllUsers(){
        return userDao.getAllUsers();
    }

    /*
    * 根据ID查找用户
    * */
    public User getUserById(User user){
        return userDao.getUserById(user);
    }

    /*
    * 修改用户
    * */
    public int updateUser(User user){
        return userDao.updateUser(user);
    }

    /*
     * 增加用户
     * */
    public int addUser(User user){
        return userDao.addUser(user);
    }

    /*
     * 用户登陆
     * */
    public User login(User user){
        return userDao.getUserByName(user).get(0);
    }
}
