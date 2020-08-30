package com.stusys.service;



import com.stusys.entity.Teacher;

import java.util.List;

public interface TeacherService {

   /**
    *@author -->> itcolors <<----
    *@time  10:49
    *@description 添加教师信息
    */
   public int addTeacher(Teacher teacher);

   public List<Teacher> findAllTeacher();

   public int deleteByIds(List<Integer> tIds);

   public int deleteById(Integer tId);

   public int updateTeacher(Teacher teacher);

   public Teacher findById(Integer tId);

   List<Teacher> findTeacherByDep(Integer dId);

}
