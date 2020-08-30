package com.stusys.entity;

import java.util.List;

/**
 * 院系
 */
public class Department {
    //院系编号
    private Integer dId;
    //院系名称
    private String dName;

    private List<Major> majorList;

    public List<Major> getMajorList() {
        return majorList;
    }

    public void setMajorList(List<Major> majorList) {
        this.majorList = majorList;
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }

    public String getdName() {
        return dName;
    }

    public void setdName(String dName) {
        this.dName = dName == null ? null : dName.trim();
    }
}