package com.stusys.dao;

import com.stusys.entity.Course;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface CourseMapper {
    int deleteByPrimaryKey(Integer cId);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer cId);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);

    List<Course> findAllCourse();

    int deleteMoreById(List<Integer> idList);

    List<Course> findCourse(@Param("startTime") Date startTime,@Param("endTime") Date endTime,@Param("cUnit") int cUnit);
}