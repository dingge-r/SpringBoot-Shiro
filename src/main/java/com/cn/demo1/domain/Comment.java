package com.cn.demo1.domain;


import lombok.Data;

import java.io.Serializable;

/**
 * 评论实体类
 */
@Data
public class Comment implements Serializable {

  private Integer id;
  private String content;
  private Integer userId;
  private String headImg;
  private String name;
  private double point;
  private Integer up;
  private java.sql.Timestamp createTime;
  private Integer orderId;
  private Integer videoId;

}
