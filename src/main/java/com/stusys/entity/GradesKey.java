package com.stusys.entity;

/**
 * 课程所需主键
 * cId 课程编号
 * sId 学生编号
 * 添加  查询  修改 操作需根据两个主键进行操作
 */
public class GradesKey {
    private Integer cId;

    private Integer sId;

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }
}