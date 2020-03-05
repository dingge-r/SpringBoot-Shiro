package com.cn.demo1;

import com.cn.demo1.domain.User;
import com.cn.demo1.utils.JwtUtils;
import io.jsonwebtoken.Claims;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class Demo1ApplicationTests {

    @Test
    void contextLoads() {        //加密
        User user =new User();
        user.setId(999);
        user.setPassword("www");
        user.setName("xd");

        String token= JwtUtils.geneJsonWebToken(user);
        System.out.println(token);
    }

    @Test
    void testCheck(){
        String token="eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ4ZGNsYXNzIiwiaWQiOjk5OSwibmFtZSI6InhkIiwiaW1nIjoid3d3LnhkY2xhc3MubmV0IiwiaWF0IjoxNTgyOTQ5NTE4LCJleHAiOjE1ODM1NTQzMTh9.cyznuw0b0LXCVlgjApCP5B8eC43xsWSmkYMlaI0jEGU";
        Claims claims=JwtUtils.checkJWT(token);
        if(claims!=null){
            String name= (String)claims.get("name");
            String img= (String)claims.get("img");
            int id= (Integer) claims.get("id");
            System.out.println(name);
            System.out.println(img);
            System.out.println(id);
        }else{
            System.out.println("非法token");
        }
    }
}
