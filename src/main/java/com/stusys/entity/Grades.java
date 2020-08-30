package com.stusys.entity;

/**
 * 单科成绩 继承两个主键
 */
public class Grades extends GradesKey {

    private double grade;

    public double getGrade() {
        return grade;
    }

    public void setGrade(double grade) {
        this.grade = grade;
    }
}