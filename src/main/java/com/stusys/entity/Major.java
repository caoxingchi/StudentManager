package com.stusys.entity;

/**
 * 院系里面的专业
 */
public class Major {
    //专业编号
    private Integer mId;

    //专业名称
    private String mName;

    //专业负责人老师编号--->tId
    private Integer mTeacher;
    private Teacher teacher;

    //院系编号-->department->dId
    private Integer mDep;

    public Integer getmId() {
        return mId;
    }

    public void setmId(Integer mId) {
        this.mId = mId;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName == null ? null : mName.trim();
    }

    public Integer getmTeacher() {
        return mTeacher;
    }

    public void setmTeacher(Integer mTeacher) {
        this.mTeacher = mTeacher;
    }

    public Integer getmDep() {
        return mDep;
    }

    public void setmDep(Integer mDep) {
        this.mDep = mDep;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }
}