package com.stusys.dao;

import com.stusys.entity.Department;

import java.util.List;

public interface DepartmentMapper {
    int deleteByPrimaryKey(Integer dId);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(Integer dId);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);

    /**
     *@author -->> itcolors <<----
     *@time  21:34
     *@description 展示所有的院系
     */
    List<Department> selectAllDep();

    /**
     *  删除多行的操作
     * @param tIds 传入一个数组
     * @return
     */
    int delDepByIds(List<Integer> tIds);
}