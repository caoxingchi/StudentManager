package com.stusys.service.impl;

import com.stusys.dao.ClassesMapper;
import com.stusys.entity.Classes;
import com.stusys.service.ClassesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassesServiceImpl implements ClassesService {

    @Autowired
    private ClassesMapper classesMapper;

    @Override
    public List<Classes> getClassesByMajor(Integer mId) {
        return classesMapper.selectClassesByMajor(mId);
    }

    @Override
    public int addClasses(Classes classes) {
        return classesMapper.insert(classes);
    }

    @Override
    public int updateClasses(Classes classes) {
        return classesMapper.updateByPrimaryKey(classes);
    }

    @Override
    public int deleteClasses(int clId) {
        return classesMapper.deleteByPrimaryKey(clId);
    }
}
