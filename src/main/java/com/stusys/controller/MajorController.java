package com.stusys.controller;

import com.stusys.entity.Department;
import com.stusys.entity.Major;
import com.stusys.entity.Msg;
import com.stusys.entity.Teacher;
import com.stusys.service.MajorService;
import com.stusys.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import java.util.List;

@Controller
@RequestMapping("major")
public class MajorController {
    @Autowired
    private MajorService majorServiceImpl;
    private TeacherService teacherServiceImpl;

    /**
     *@author -->> itcolors <<----
     *@time  0:50
     *@description 根据院系ID来查询专业
     */
    @ResponseBody
    @RequestMapping("findMajorByDep")
    public List<Major> findMajors(int dId){
        System.out.println("进入");
        return majorServiceImpl.findMajorByDep(dId);
    }

    /**
     *@author -->> itcolors <<----
     *@time  9:28
     *@description 添加专业
     */
    @ResponseBody
    @RequestMapping("addMajor")
    public Msg addMajor(Major major){
        System.out.println("进入添加专业");
        int addMajor = 0;
        try {
            addMajor = majorServiceImpl.addMajor(major);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(addMajor>0){
            return Msg.successMessage("添加专业成功");
        }
        return Msg.errorMessage("添加专业失败");
    }

    /**
     *@author -->> itcolors <<----
     *@time  9:28
     *@description 修改专业操作
     */
    @ResponseBody
    @RequestMapping("updateMajor")
    public Msg updateMajor(Major major){
        System.out.println("修改主页");
        int updateMajor = majorServiceImpl.updateMajor(major);
        if(updateMajor>0){
            return Msg.successMessage("修改专业成功");
        }
        return Msg.errorMessage("修改专业失败");
    }

    @ResponseBody
    @RequestMapping("delMajors")
    public Msg delMajors(@RequestParam("mIds") List<Integer> mIds){
        int delMajorByIds = 0;
        try {
            delMajorByIds = majorServiceImpl.delMajorByIds(mIds);
        } catch (Exception e) {
            return Msg.errorMessage("删除专业成功");
        }
        if(delMajorByIds>0){
            return Msg.successMessage("删除专业成功");
        }else{
            return Msg.errorMessage("删除专业失败");
        }
    }
    @ResponseBody
    @RequestMapping("findTeacherByMajor")
    public List<Teacher> findTeacherByMajor(int clMajor){
        System.out.println("进入通过专业查询教师");
        Major major = majorServiceImpl.findMajorById(clMajor);
        int dId=major.getmDep();
        return teacherServiceImpl.findTeacherByDep(dId);
    }
}
