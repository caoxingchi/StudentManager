package com.stusys.service.impl;

import com.stusys.dao.StudentMapper;
import com.stusys.dao.UserMapper;
import com.stusys.entity.Student;
import com.stusys.entity.User;
import com.stusys.service.StudentService;
import com.stusys.utils.Md5Encipher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private UserMapper userMapper;


    @Override
    public int addStudent(Student student) {
        User user=new User();
        user.setUsername(student.getsId());
        try {
            user.setPassword(Md5Encipher.md5Encode("123456"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        studentMapper.insert(student);
        userMapper.insert(user);
        return 1;
    }

    @Override
    public List<Student> findAllStu() {
        return studentMapper.findAllStu();
    }

    @Override
    public int deleteStudent(List<Integer> ids) {
        studentMapper.deleteStudentById(ids);
        int flag=userMapper.deleteUserByUsername(ids);
        return flag;
    }

    @Override
    public int updateStudent(Student student) {
        return studentMapper.updateByPrimaryKey(student);
    }
}
