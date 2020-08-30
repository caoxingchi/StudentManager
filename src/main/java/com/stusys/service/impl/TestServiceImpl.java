package com.stusys.service.impl;

import com.stusys.dao.DepartmentMapper;
import com.stusys.entity.Department;
import com.stusys.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestServiceImpl implements TestService {
    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getAllDep(){
        return departmentMapper.selectAllDep();
    }
}
