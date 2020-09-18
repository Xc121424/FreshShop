package com.school.ssm.po;

import lombok.Data;

@Data
public class OrderDetail {
    private Integer itemid;

    private String orid;

    private Integer famount;

    private Integer fid;

     private FlowerDetail flowerDetail;


}