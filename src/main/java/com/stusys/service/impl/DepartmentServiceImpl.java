package com.stusys.service.impl;

import com.stusys.dao.DepartmentMapper;
import com.stusys.entity.Department;
import com.stusys.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *@author  xingchi -->> itcolors <<----
 *@date  2020/8/21 20:27
 *@version 1.0
 *@description 院系操作
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    /**
     *@author -->> itcolors <<----
     *@time  20:26
     *@description 列出所有的院系
     */
    @Override
    public List<Department> listAllDep() {
        return departmentMapper.selectAllDep();
    }

    /**
     *@author -->> itcolors <<----
     *@time  23:28
     *@description 添加院系操作
     */
    @Override
    public int addDep(Department department) {
        return departmentMapper.insertSelective(department);
    }

    /**
     *@author -->> itcolors <<----
     *@time  23:31
     *@description 更新操作
     */
    @Override
    public int updateDep(Department department) {
        return departmentMapper.updateByPrimaryKey(department);
    }

    @Override
    public Department findDepById(int dId) {
        return departmentMapper.selectByPrimaryKey(dId);
    }

    @Override
    public int delDepByIds(List<Integer> dIds) {
        return departmentMapper.delDepByIds(dIds);
    }
}
