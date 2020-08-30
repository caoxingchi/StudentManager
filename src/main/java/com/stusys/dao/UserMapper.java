package com.stusys.dao;

import com.stusys.entity.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer username);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer username);

    int updateByPrimaryKeySelective(User record);

    int deleteUserByUsername(List<Integer> ids);

    int updateByPrimaryKey(User record);

    @Select("select * from user where username=#{username} and password =#{password}")
    User login(User user);
}