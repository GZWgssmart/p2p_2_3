package com.animo.controller;


import com.animo.common.CheckCodeUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.web.servlet.ShiroHttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;

@Controller
@RequestMapping("/code")
public class CheckCodeController {

    @RequestMapping("")
    public void code(HttpServletResponse response) {
        String code = CheckCodeUtils.randomCode();
        System.out.println(code);
//        session.setAttribute("code", code);
        Session session = SecurityUtils.getSubject().getSession();
        session.setAttribute("code", code);
        BufferedImage image = CheckCodeUtils.generateImage(code);
        try {
            OutputStream out = response.getOutputStream();
            ImageIO.write(image, "png", out);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
