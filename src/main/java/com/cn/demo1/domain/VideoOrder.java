package com.cn.demo1.domain;


import lombok.Data;

import java.io.Serializable;

/**
 * 订单表
 */
@Data
public class VideoOrder implements Serializable {

  private Integer id;
  private String openid;
  private String outTradeNo;
  /**
   * 0未支付，1支付
   */
  private Integer state;
  private java.sql.Timestamp createTime;
  private java.sql.Timestamp notifyTime;
  /**
   * 分为单位
   */
  private Integer totalFee;
  private String nickname;
  private String headImg;
  private Integer videoId;
  private String videoTitle;
  private String videoImg;
  private Integer userId;
  private String ip;
  private Integer del;

}
