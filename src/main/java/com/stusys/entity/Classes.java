package com.stusys.entity;

import java.util.List;

/**
 * 专业下面的班级
 */
public class Classes {
    //班级ID
    private Integer clId;
    //班级名称
    private String clName;
    //班级老师编号-->tId教师工号
    private Integer clTeacher;
    private Teacher teacher;

    //专业编号-->mId
    private Integer clMajor;

    private List<Classes> classesList;

    public List<Classes> getClassesList() {
        return classesList;
    }

    public void setClassesList(List<Classes> classesList) {
        this.classesList = classesList;
    }

    public Integer getClId() {
        return clId;
    }

    public void setClId(Integer clId) {
        this.clId = clId;
    }

    public String getClName() {
        return clName;
    }

    public void setClName(String clName) {
        this.clName = clName == null ? null : clName.trim();
    }

    public Integer getClTeacher() {
        return clTeacher;
    }

    public void setClTeacher(Integer clTeacher) {
        this.clTeacher = clTeacher;
    }

    public Integer getClMajor() {
        return clMajor;
    }

    public void setClMajor(Integer clMajor) {
        this.clMajor = clMajor;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }
}