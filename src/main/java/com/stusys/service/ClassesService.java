package com.stusys.service;

import com.stusys.entity.Classes;

import java.util.List;

public interface ClassesService {
    List<Classes> getClassesByMajor(Integer mId);

    int addClasses(Classes classes);

    int updateClasses(Classes classes);

    int deleteClasses(int clId);
}
