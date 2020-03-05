package com.cn.demo1.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

    //测试thymeleaf
    @RequestMapping("/test1")
    public String thymeleaf(Model model){
        //把数据存入model
        model.addAttribute("name","黑马程序员");
        //返回 test.html
        return "test";
    }

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/add")
    public String add(){
        return "/user/add";
    }

    @RequestMapping("/update")
    public String update(){
        return "/user/update";
    }

    @RequestMapping("/noAuth")
    public String noAuth(){
        return "/noAuth";
    }

    //登录
    @RequestMapping("/login")
    public String login(String name,String password ,Model model) {
        System.out.println("name="+name);
        /**
         * 使用shiro编写认证操作
         */
        //1.获取subject
        Subject subject = SecurityUtils.getSubject();
        //封装用户信息
        UsernamePasswordToken token = new UsernamePasswordToken(name, password);
        //执行登录方法
        try {
            subject.login(token);
            //登录成功
            return "redirect:/test1";
        } catch (UnknownAccountException e) {
            model.addAttribute("msg", "用户名不存在");
            return "login";

        } catch (IncorrectCredentialsException e) {
            model.addAttribute("msg", "密码错误");
            return "login";
        }

    }
}
