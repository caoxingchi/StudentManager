package com.stusys.service.impl;

import com.stusys.dao.UserMapper;
import com.stusys.entity.User;
import com.stusys.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private UserMapper userMapper;

    /**
     *@author -->> itcolors <<----
     *@time  20:26
     *@description 登录操作
     */
    @Override
    public User login(User user) {
        return userMapper.login(user);
    }
}
