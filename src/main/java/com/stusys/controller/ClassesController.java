package com.stusys.controller;

import com.stusys.entity.Classes;
import com.stusys.entity.Msg;
import com.stusys.service.ClassesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("classes")
public class ClassesController {
    @Autowired
    private ClassesService classesService;
    /**
     * 通过专业查询该专业有哪些班级并响应给前端
     * @param mId
     * @return
     */
    @ResponseBody
    @RequestMapping("getClassesByMajor")
    public List<Classes> getClassesByMajor(Integer mId){
        System.out.println("进入查询班级");
        List<Classes> list=null;
        try {
            list=classesService.getClassesByMajor(mId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     *@author -->> itcolors <<----
     *@time  14:51
     *@description 添加班级的操作
     */
    @ResponseBody
    @RequestMapping("addClasses")
    public Msg addClasses(Classes classes){
        System.out.println("添加班级操作");
        int addClasses = 0;
        try {
            addClasses = classesService.addClasses(classes);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(addClasses>0){
            return Msg.successMessage("添加班级成功");
        }
        return Msg.errorMessage("添加班级失败");

    }

    /**
     *@author -->> itcolors <<----
     *@time  14:51
     *@description 更新班级的操作
     */
    @ResponseBody
    @RequestMapping("updateClasses")
    public Msg updateClasses(Classes classes){
        int updateClasses = classesService.updateClasses(classes);
        if(updateClasses>0){
            return Msg.successMessage("更新班级成功");
        }
        return Msg.errorMessage("更新班级失败");
    }

    /**
     *@author -->> itcolors <<----
     *@time  14:51
     *@description 删除班级操作 传入班级的clId
     */
    @ResponseBody
    @RequestMapping("deleteClasses")
    public Msg deleteClasses(int clId){
        int deleteClasses = classesService.deleteClasses(clId);
        if(deleteClasses>0){
            return Msg.successMessage("删除班级成功");
        }
        return Msg.errorMessage("删除班级失败");
    }
}
