package com.cn.demo1.domain;


import lombok.Data;

import java.io.Serializable;

/**
 * 集实体类
 */

@Data
public class Episode  implements Serializable {

  private Integer id;
  private String title;
  private Integer num;
  private String duration;
  private String coverImg;
  private Integer videoId;
  private String summary;
  private java.sql.Timestamp createTime;
  private Integer chapterId;

}
