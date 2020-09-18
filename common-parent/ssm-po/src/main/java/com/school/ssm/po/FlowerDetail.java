package com.school.ssm.po;

import lombok.Data;

import java.util.List;

@Data
public class FlowerDetail {
    private Integer fid;

    private Double fprice;

    private Double vipFprice;

    private Integer number;

    private Integer tid;


    private String remark;

    private Integer favoriteNumber;

    private String materials;

    private String packaging;

    private String flowerLanguage;

    private String state;

    private FlowerImage flowerImage;
}