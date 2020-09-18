package com.school.ssm.po;

import lombok.Data;

@Data
public class Shop {
    private Integer sid;

    private Integer uuid;

    private Integer number;

    private Integer fid;

    private FlowerDetail flowerDetail;
}