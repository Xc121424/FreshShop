package com.school.ssm.po;

import lombok.Data;

@Data
public class Receiver {
    private Integer rid;

    private Integer uuid;

    private String addr;

    private String rphone;

    private String rname;

  private String provinces;

  private String city;

  private String county;

  private String state;
}