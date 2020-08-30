package com.stusys.service.impl;

import com.stusys.dao.MajorMapper;
import com.stusys.entity.Major;
import com.stusys.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MajorServiceImpl implements MajorService {

    @Autowired
    private MajorMapper majorMapper;

    /**
     * 查询专业
     * @param dId
     * @return
     */
    @Override
    public List<Major> findMajorByDep(int dId) {
        return majorMapper.findMajorsByDep(dId);
    }

    @Override
    public int addMajor(Major major) {
        return majorMapper.insert(major);
    }

    @Override
    public int updateMajor(Major major) {
        return majorMapper.updateByPrimaryKey(major);
    }

    @Override
    public int delMajorByIds(List<Integer> mIds) {
        return majorMapper.delMajorByIds(mIds);
    }

    @Override
    public Major findMajorById(int mId) {
        return majorMapper.selectByPrimaryKey(mId);
    }
}
