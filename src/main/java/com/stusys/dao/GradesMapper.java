package com.stusys.dao;

import com.stusys.entity.Grades;
import com.stusys.entity.GradesKey;

/**
 * 分数处理层
 */
public interface GradesMapper {

    int deleteByPrimaryKey(GradesKey key);

    int insert(Grades record);

    //只注入不为空的数据
    int insertSelective(Grades record);

    Grades selectByPrimaryKey(GradesKey key);

    //值更新不为空的数据 主键
    int updateByPrimaryKeySelective(Grades record);

    int updateByPrimaryKey(Grades record);
}