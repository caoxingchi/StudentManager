package com.stusys.dao;

import com.stusys.entity.Major;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MajorMapper {
    int deleteByPrimaryKey(Integer mId);

    int insert(Major record);

    int insertSelective(Major record);

    Major selectByPrimaryKey(Integer mId);

    int updateByPrimaryKeySelective(Major record);

    int updateByPrimaryKey(Major record);

    /*@Select("select * from major where m_dep=#{dId}")*/
    List<Major> findMajorsByDep(int dId);

    int delMajorByIds(List<Integer> mIds);
}