package com.stusys.controller;

import com.stusys.entity.Course;
import com.stusys.entity.Msg;
import com.stusys.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("course")
public class CourseController {
    @Autowired
    private CourseService courseService;

    /**
     * 查询所有的课程信息并返回给前端响应
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("findAllCourse")
    public List<Course> findAllCourse() {
        return courseService.findAllCourse();
    }

    @ResponseBody
    @RequestMapping("findCourse")
    public List<Course> findCourse(@RequestParam(value = "startTime",required = false) Date startTime,
                                   @RequestParam(value = "endTime" ,required = false) Date endTime,
                                   @RequestParam("cUnit") int cUnit){
        System.out.println("进入findCourse");
        return courseService.findCourse(startTime, endTime, cUnit);
    }

    /**
     * 添加课程信息
     *
     * @param course
     * @return
     */
    @ResponseBody
    @RequestMapping("addCourse")
    public Msg addCourse(Course course) {
        int addCourse = courseService.addCourse(course);
        if (addCourse > 0) {
            return Msg.successMessage("添加课程成功");
        } else {
            return Msg.errorMessage("添加课程失败");
        }
    }

    /**
     * 修改课程信息
     * @param course 修改后的课程对象
     * @return
     */
    @ResponseBody
    @RequestMapping("updateCourse")
    public Msg updateCourse(Course course){
        int flag=courseService.updateCourse(course);
        if (flag>0)
            return Msg.successMessage("更新课程成功");
        return Msg.errorMessage("更新课程失败");
    }

    /**
     * 删除课程，删除后响应给前端
     * @param cIds 要删除的学生id集合
     * @return
     */
    @ResponseBody
    @RequestMapping("delCourse")
    public Msg delCourse(@RequestParam("cIds") List<Integer> cIds){
        if (cIds!=null&&cIds.size()>0){
            int flag=courseService.deleteByIdList(cIds);
            if (flag>0)
                return Msg.successMessage("删除成功");
        }
        return Msg.errorMessage("删除失败");
    }

}
