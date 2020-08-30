package com.stusys.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * 课程实体类
 */
public class Course {
    //课程编号
    private Integer cId;
    //课程名称
    private String cName;
    //授课教师编号
    private Integer tId;
    private Teacher teacher;
    //课程类型
    private String cType;
    //课程学分
    private Integer cCredit;
    //课程学时
    private Integer cPeriod;
    //开课时间
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date cTime;
    //开课单位(院系编号)-->department-->dId
    private Integer cUnit;
    private Department department;

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName == null ? null : cName.trim();
    }

    public Integer gettId() {
        return tId;
    }

    public void settId(Integer tId) {
        this.tId = tId;
    }

    public String getcType() {
        return cType;
    }

    public void setcType(String cType) {
        this.cType = cType == null ? null : cType.trim();
    }

    public Integer getcCredit() {
        return cCredit;
    }

    public void setcCredit(Integer cCredit) {
        this.cCredit = cCredit;
    }

    public Integer getcPeriod() {
        return cPeriod;
    }

    public void setcPeriod(Integer cPeriod) {
        this.cPeriod = cPeriod;
    }

    public Date getcTime() {
        return cTime;
    }

    public void setcTime(Date cTime) {
        this.cTime = cTime;
    }

    public Integer getcUnit() {
        return cUnit;
    }

    public void setcUnit(Integer cUnit) {
        this.cUnit = cUnit;
    }
}