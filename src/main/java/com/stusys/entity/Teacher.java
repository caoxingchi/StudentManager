package com.stusys.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Teacher {
    //工号
    private Integer tId;
    //姓名
    private String tName;
    //性别
    private String tGender;
    //院系编号
    private Integer tDep;
    //联系方式
    private String tTel;
    //生日
    /**
     *@author -->> itcolors <<----
     *@time  11:20
     *@description json日期转换
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date tBirthday;

    //多表查询 对应的department显示出来
    private Department department;

    public Integer gettId() {
        return tId;
    }

    public void settId(Integer tId) {
        this.tId = tId;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName == null ? null : tName.trim();
    }

    public String gettGender() {
        return tGender;
    }

    public void settGender(String tGender) {
        this.tGender = tGender == null ? null : tGender.trim();
    }

    public Integer gettDep() {
        return tDep;
    }

    public void settDep(Integer tDep) {
        this.tDep = tDep;
    }

    public String gettTel() {
        return tTel;
    }

    public void settTel(String tTel) {
        this.tTel = tTel == null ? null : tTel.trim();
    }

    public Date gettBirthday() {
        return tBirthday;
    }

    public void settBirthday(Date tBirthday) {
        this.tBirthday = tBirthday;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "tId=" + tId +
                ", tName='" + tName + '\'' +
                ", tGender='" + tGender + '\'' +
                ", tDep=" + tDep +
                ", tTel='" + tTel + '\'' +
                ", tBirthday=" + tBirthday +
                '}';
    }
}