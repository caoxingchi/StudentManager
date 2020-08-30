package com.stusys.controller;

import com.stusys.entity.Department;
import com.stusys.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class TestController {

    @Autowired
    private TestService testServiceImpl;

    @RequestMapping("test")
    public String test(HttpServletRequest request){
        List<Department> departmentList=testServiceImpl.getAllDep();
        request.setAttribute("depList",departmentList);
        return "index";
    }

    @RequestMapping("error")
    public String errorTest() throws Exception {
        throw new Exception();
    }

}
