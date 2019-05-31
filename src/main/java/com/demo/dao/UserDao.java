package com.demo.dao;

import com.demo.domain.User;

import java.util.List;

/*
* @Author: 陶东升
* @Date: 2019-04-23 21:16
* @Version: 1.0
* */
public interface UserDao {
    public List<User> getAllUsers();
    public User getUserById(User user);
    public int updateUser(User user);
    public int addUser(User user);
    public List<User> getUserByName(User user);
}
