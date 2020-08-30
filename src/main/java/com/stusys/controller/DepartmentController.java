package com.stusys.controller;

import com.stusys.entity.Department;
import com.stusys.entity.Msg;
import com.stusys.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("department")
public class DepartmentController {
    @Autowired
    private DepartmentService departmentServiceImpl;

    /**
     *@author -->> itcolors <<----
     *@time  23:28
     *@description 获得所有的院系
     */
    @ResponseBody
    @GetMapping("getAllDep")
    public List<Department> listAllDep(){
        return departmentServiceImpl.listAllDep();
    }

    /**
     *@author -->> itcolors <<----
     *@time  23:32
     *@description 添加学院操作
     */
    @ResponseBody
    @RequestMapping("addDep")
    public Msg addDep(Department department){
        System.out.println("进入添加院系");
        int did=0;
        if(department.getdId()==null){
            did=0;
        }else{
            did=department.getdId();
        }
        Department dep = departmentServiceImpl.findDepById(did);
        if(dep!=null){
            return Msg.errorMessage("院系编号重复");
        }
        int addDep = 0;
        try {
            addDep = departmentServiceImpl.addDep(department);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(addDep>0){
            return Msg.successMessage("添加院系成功");
        }else{
            return Msg.errorMessage("添加院系失败");
        }
    }

    @ResponseBody
    @RequestMapping("updateDep")
    public Msg updateDep(Department department){
        int updateDep = departmentServiceImpl.updateDep(department);
        if(updateDep>0){
            return Msg.successMessage("更新院系成功");
        }
        return Msg.errorMessage("更新院系失败");
    }

    /**
     *@author -->> itcolors <<----
     *@time  23:44
     *@description
     */
    @ResponseBody
    @RequestMapping("delDeps")
    public Msg delDeps(@RequestParam("dIds") List<Integer> dIds){
        int delDeps = 0;
        try {
            delDeps = departmentServiceImpl.delDepByIds(dIds);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(delDeps>0){
            return Msg.successMessage("删除院系成功");
        }
        return Msg.errorMessage("删除院系失败");
    }
}
