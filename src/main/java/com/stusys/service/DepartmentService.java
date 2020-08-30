package com.stusys.service;

import com.stusys.entity.Department;

import java.util.List;

public interface DepartmentService {
    public List<Department> listAllDep();
    public int addDep(Department department);
    public int updateDep(Department department);
    public Department findDepById(int dId);

    public int delDepByIds(List<Integer> dIds);
}
