package com.stusys.service;

import com.stusys.entity.Course;

import java.util.Date;
import java.util.List;

public interface CourseService {
    List<Course> findAllCourse();
    int addCourse(Course course);
    List<Course> findCourse(Date startTime,Date endTime, int cUnit);
    int updateCourse(Course course);
    int deleteByIdList(List<Integer> idList);
}
