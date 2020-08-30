package com.stusys.dao;

import com.stusys.entity.Classes;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ClassesMapper {
    int deleteByPrimaryKey(Integer clId);

    int insert(Classes record);

    int insertSelective(Classes record);

    Classes selectByPrimaryKey(Integer clId);

    int updateByPrimaryKeySelective(Classes record);

    int updateByPrimaryKey(Classes record);

    /*@Select("select * from classes where cl_major=#{mId}")*/
    List<Classes> selectClassesByMajor(Integer mId);
}