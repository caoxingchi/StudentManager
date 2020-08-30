package com.stusys.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * 学生信息
 */
public class Student {
    //学生编号
    private Integer sId;

    //学生姓名
    private String sName;

    //学生性别
    private String sGender;

    //学生所在院系编号-->dId
    private Integer sDep;
    private Department department;


    //学生所在专业编号-->mId
    private Integer sMajor;
    private Major major;

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }

    public Classes getClasses() {
        return classes;
    }

    public void setClasses(Classes classes) {
        this.classes = classes;
    }

    //学生所在班级编号-->clId
    private Integer sClass;
    private Classes classes;


    //学生 生日
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date sBirthday;

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName == null ? null : sName.trim();
    }

    public String getsGender() {
        return sGender;
    }

    public void setsGender(String sGender) {
        this.sGender = sGender == null ? null : sGender.trim();
    }

    public Integer getsDep() {
        return sDep;
    }

    public void setsDep(Integer sDep) {
        this.sDep = sDep;
    }

    public Integer getsMajor() {
        return sMajor;
    }

    public void setsMajor(Integer sMajor) {
        this.sMajor = sMajor;
    }

    public Integer getsClass() {
        return sClass;
    }

    public void setsClass(Integer sClass) {
        this.sClass = sClass;
    }

    public Date getsBirthday() {
        return sBirthday;
    }

    public void setsBirthday(Date sBirthday) {
        this.sBirthday = sBirthday;
    }
}