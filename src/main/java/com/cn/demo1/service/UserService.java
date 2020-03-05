package com.cn.demo1.service;

import com.cn.demo1.domain.User;
import com.cn.demo1.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

@Service
@Transactional
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public User findByName(String name){
        Example example=new Example(User.class);
        Example.Criteria criteria=example.createCriteria();
        criteria.andEqualTo("name",name);
        return userMapper.selectOneByExample(example);
    }


    public User findById(Integer id){
        Example example=new Example(User.class);
        Example.Criteria criteria=example.createCriteria();
        criteria.andEqualTo("id",id);
        return userMapper.selectOneByExample(example);
    }
}
