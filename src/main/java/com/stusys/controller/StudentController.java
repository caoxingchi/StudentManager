package com.stusys.controller;

import com.stusys.entity.Msg;
import com.stusys.entity.Student;
import com.stusys.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("student")
public class StudentController {
    @Autowired
    private StudentService studentService;

    /**
     * 调用学生类的服务类，添加学生
     * @param student springMVC自动获取前台的数据封装的学生对象
     * @return
     */
    @RequestMapping("addStudent")
    public String addStudent(Student student){
        int delStu = studentService.addStudent(student);
        return "redirect:/studentInfo";

    }

    /**
     * 查询所有学生信息并响应给前端
     * @return
     */
    @ResponseBody
    @RequestMapping("findAllStu")
    public List<Student> findAllStu(){
        return studentService.findAllStu();
    }

    /**
     * 删除学生，删除后响应给前端
     * @param ids 要删除的学生id集合
     * @return
     */
    @ResponseBody
    @RequestMapping("delStudent")
    public Msg deleteStudent(@RequestParam("ids") List<Integer> ids){
        System.out.println("进入是删除");
        if (ids!=null&&ids.size()>0){
            int flag= 0;
            try {
                flag = studentService.deleteStudent(ids);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (flag>0)
                return Msg.successMessage("删除成功") ;
        }
        return Msg.errorMessage("删除失败");
    }

    /**
     * 更新学生信息
     * @param student 具有新信息的学生对象
     * @return
     */
    @ResponseBody
    @RequestMapping("updateStudent")
    public Msg updateStudent(Student student){
        int flag=studentService.updateStudent(student);
        if (flag==1){
            return Msg.successMessage("更新成功");
        }else{
            return Msg.errorMessage("更新失败");
        }

    }
}
