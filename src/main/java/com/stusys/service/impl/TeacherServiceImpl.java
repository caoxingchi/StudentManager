package com.stusys.service.impl;

import com.stusys.dao.TeacherMapper;
import com.stusys.entity.Teacher;
import com.stusys.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private TeacherMapper teacherMapper;

    /**
     *@author -->> itcolors <<----
     *@time  9:39
     *@description 添加教师操作
     */
    @Override
    public int addTeacher(Teacher teacher) {
        return teacherMapper.insert(teacher);
    }

    /**
     *@author -->> itcolors <<----
     *@time  10:52
     *@description 暂时测试使用，还未进行分页操作
     */
    @Override
    public List<Teacher> findAllTeacher() {
        return teacherMapper.findAll();
    }

    @Override
    public int deleteByIds(List<Integer> tIds) {
        return teacherMapper.deleteByIds(tIds);
    }

    @Override
    public int deleteById(Integer tId) {
        return teacherMapper.deleteByPrimaryKey(tId);
    }

    @Override
    public int updateTeacher(Teacher teacher) {
        return teacherMapper.updateByPrimaryKey(teacher);
    }

    @Override
    public Teacher findById(Integer tId) {
        return teacherMapper.selectByPrimaryKey(tId);
    }

    @Override
    public List<Teacher> findTeacherByDep(Integer dId) {
        return teacherMapper.findTeacherByDep(dId);
    }
}
