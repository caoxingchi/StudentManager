package com.stusys.controller;

import com.stusys.entity.User;
import com.stusys.service.ManagerService;
import com.stusys.utils.Md5Encipher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
public class ManagerController {
    @Autowired
    private ManagerService managerServiceImpl;

    /**
     *@author -->> itcolors <<----
     *@time  19:43
     *@description 用户登录操作，由用户名，密码验证，加上验证，验证码存储在session中保存
     */
    @RequestMapping("managerLogin")
    public ModelAndView ManagerLogin(int username, String password, String validCode, HttpSession session){
        ModelAndView mav_success=new ModelAndView("managerMain");
        ModelAndView mav_fail=new ModelAndView("forward:/index.jsp");

        String getValidCode = session.getAttribute("validCode").toString();
        if(getValidCode.equalsIgnoreCase(validCode)){
            User user=new User();
            user.setUsername(username);

            try {
                user.setPassword(Md5Encipher.md5Encode(password));
            } catch (Exception e) {
                e.printStackTrace();
            }

            User login = managerServiceImpl.login(user);
            if(login!=null){
                session.setAttribute("login",login);
                return mav_success;
            }else{
                mav_fail.addObject("error","用户名密码错误！");
                return mav_fail;
            }
        }else{
            mav_fail.addObject("error","验证码错误！");
            return mav_fail;
        }
    }

    /**
     *@author -->> itcolors <<----
     *@time  20:06
     *@description 页面跳转
     */
    @RequestMapping("{page}")
    public String ManageView(@PathVariable String page){
        return page;
    }
}
