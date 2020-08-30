package com.stusys.controller;


import com.stusys.utils.IdentifyCode;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

/**
 *@author -->> itcolors <<----
 *@time  19:47
 *@description 工具类控制器，验证码的生成，文件上传等操作
 */
@Controller
public class UtilsController {

    private final int width=120;
    private final int height=40;

    /**
     *@author -->> itcolors <<----
     *@time  19:45
     *@description 创建验证码操作，生成图片
     */
    @RequestMapping("validCode")
    public ModelAndView createCode(HttpServletRequest request,
                                   HttpServletResponse response) throws Exception {
        // 设置响应的类型格式为图片格式
        response.setContentType("image/jpeg");
        // 禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        // 自定义宽、高、字数和干扰线的条数
        IdentifyCode code = new IdentifyCode(width, height, 5, 10);
        // 存入session
        HttpSession session = request.getSession();
        session.setAttribute("validCode", code.getCode());
        // 响应图片
        ServletOutputStream out = response.getOutputStream();
        code.write(out);
        try {
            out.flush();
        } finally {
            out.close();
        }
        return null;
    }

    /*
    * 文件上传操作
    * */
    @RequestMapping("downLoadExcelModel/{fileName:.+}")
    public void downLoadExcelModel(@PathVariable String fileName, HttpServletRequest req, HttpServletResponse resp)throws IOException {
        //设置响应流中文件下载
        resp.setHeader("Content-Disposition","attachment;filename="+fileName);
        //把二进制流放到响应体中
        ServletOutputStream os=resp.getOutputStream();
        String path = req.getServletContext().getRealPath("files");
        System.out.println(path);
        File file=new File(path,fileName);
        byte[] bytes = FileUtils.readFileToByteArray(file);
        os.write(bytes);
        os.flush();
        os.close();

    }

/*    public void uploadExcelFile(){

    }*/

}
