package com.cn.demo1.domain;


import lombok.Data;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * 用户实体类
 */
@Data
@Table(name = "user")
public class User implements Serializable {
  @Id
  @KeySql(useGeneratedKeys = true)
  private Integer id;
  private String name;
  private String password;
  private String perms;
//  private String openid;
//  private String headImg;
//  private String phone;
//  private String sign;
//  private Integer sex;
//  private String city;
//  private java.sql.Timestamp createTime;

}
