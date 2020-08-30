package com.stusys.controller;

import com.stusys.entity.Department;
import com.stusys.entity.Msg;
import com.stusys.entity.Teacher;
import com.stusys.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class TeacherController {

    @Autowired
    private TeacherService teacherServiceImpl;
    /**
     *@author -->> itcolors <<----
     *@time  9:36
     *@description 添加教师信息 (value = "addTeacher",method = RequestMethod.POST, produces = "application/json; charset=utf-8")
     */
    @ResponseBody
    @RequestMapping("addTeacher")
    public Msg addTeacher(Teacher teacher){
        Teacher t=teacherServiceImpl.findById(teacher.gettId());
        if(t!=null){
           return Msg.errorMessage("已存在该用户");
        }
        int addTeacher= 0;
        try {
            addTeacher = teacherServiceImpl.addTeacher(teacher);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(teacher.toString());
        if(addTeacher==1){
           return Msg.successMessage("添加成功");
        }else{
           return Msg.errorMessage("添加失败");
        }
    }

    /**
     *@author -->> itcolors <<----
     *@time  10:54
     *@description 查询所有数据，仅测试，为进行分页操作
     */
    @PostMapping("findAllTeacher")
    @ResponseBody
    public List<Teacher> findAllTeacher(){
        return teacherServiceImpl.findAllTeacher();
    }


    /**
     *@author -->> itcolors <<----
     *@time  23:30
     *@description 修改教师信息
     */
    @ResponseBody
    @RequestMapping("updateTeacher")
    public Msg updateTeacherInfo(Teacher teacher){
        Teacher t=teacherServiceImpl.findById(teacher.gettId());
        if(t==null){
            return Msg.errorMessage("工号不可修改!");
        }
        int updateTeacher = teacherServiceImpl.updateTeacher(teacher);

        if(updateTeacher==1){
            return Msg.successMessage("更新成功");
        }
        return Msg.errorMessage("更新失败");
    }
    /**
     * 删除教师的请求
     * @param tIds
     * @return
     */
    @ResponseBody
    @RequestMapping("delTeachers")
    public Msg deleteTeachers(@RequestParam("tIds") List<Integer> tIds){
        System.out.println("进入删除方法 多");
        System.out.println(tIds.toString());
        int del = 0;
        try {
            del = teacherServiceImpl.deleteByIds(tIds);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(del>0){
            return Msg.successMessage("删除成功");
        }else{
            return Msg.errorMessage("删除失败");
        }
    }

    /**
     *@author -->> itcolors <<----
     *@time  15:21
     *@description 通过院系编号来查询该院内的所有教师
     */
    @ResponseBody
    @RequestMapping("findTeacherByDep")
    public List<Teacher> findTeacherByDep(Integer dId){
        return teacherServiceImpl.findTeacherByDep(dId);
    }



}
