package com.cn.demo1.controller;

import com.cn.demo1.config.WeChatConfig;
import com.cn.demo1.mapper.VideoMapper;
import com.cn.demo1.service.demoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @RequestMapping("test")
    public  String test() {
        return "hello,demo8888";
    }

    @Autowired
    private WeChatConfig weChatConfig;

    @RequestMapping("test_config")
    public  String testConfig() {
        System.out.println(weChatConfig.getAppId());
        return "hello xdclass.net";
    }

    @Autowired
    private demoService demoService;

    @RequestMapping("test_db")
    public ResponseEntity testDB() {
//        return demoService.findAll();
        return ResponseEntity.status(HttpStatus.CREATED).body(demoService.findAll());
    }
}
