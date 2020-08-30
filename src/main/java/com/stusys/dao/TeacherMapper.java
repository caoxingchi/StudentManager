package com.stusys.dao;

import com.stusys.entity.Teacher;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TeacherMapper {
    int deleteByPrimaryKey(Integer tId);

    int insert(Teacher record);

    int insertSelective(Teacher record);

    Teacher selectByPrimaryKey(Integer tId);

    int updateByPrimaryKeySelective(Teacher record);

    int updateByPrimaryKey(Teacher record);

    //测试查询所有教师信息
    /*@Select("select * from teacher")*/
    List<Teacher> findAll();

    /**
     *  删除多行的操作
     * @param tIds 传入一个数组
     * @return
     */
    int deleteByIds(List<Integer> tIds);

    @Select("select t_id,t_name from teacher where t_dep=#{dId}")
    List<Teacher> findTeacherByDep(Integer dId);
}