package com.stusys.service;

import com.stusys.entity.Student;

import java.util.List;

public interface StudentService {
    int addStudent(Student student);
    List<Student> findAllStu();
    int deleteStudent(List<Integer> ids);
    int updateStudent(Student student);
}
