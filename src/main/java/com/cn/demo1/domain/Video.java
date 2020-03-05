package com.cn.demo1.domain;


import lombok.Data;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * 视频表
 */
@Data
@Table(name = "video")
public class Video implements Serializable {

  @Id
  private Integer id;
  private String title;
  private String summary;
  private String coverImg;
  private Integer viewNum;
  private Integer price;
  private java.sql.Timestamp createTime;
  private Integer online;
  private Double point;

}
