package com.stusys.service;

import com.stusys.entity.Major;

import java.util.List;

public interface MajorService {
    public List<Major> findMajorByDep(int dId);
    public int addMajor(Major major);
    public int updateMajor(Major major);
    public int delMajorByIds(List<Integer> mIds);
    Major findMajorById(int mId);
}
