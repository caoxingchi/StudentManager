package com.stusys.service.impl;

import com.stusys.dao.CourseMapper;
import com.stusys.entity.Course;
import com.stusys.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;

    @Override
    public List<Course> findAllCourse() {
        return courseMapper.findAllCourse();
    }

    @Override
    public int addCourse(Course course) {
        return courseMapper.insert(course);
    }

    @Override
    public List<Course> findCourse(Date startTime, Date endTime, int  cUnit) {
        return courseMapper.findCourse(startTime,endTime,cUnit);
    }

    @Override
    public int updateCourse(Course course) {
        return courseMapper.updateByPrimaryKey(course);
    }

    @Override
    public int deleteByIdList(List<Integer> idList) {
        return courseMapper.deleteMoreById(idList);
    }


}
