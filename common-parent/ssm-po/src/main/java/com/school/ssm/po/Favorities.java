package com.school.ssm.po;

import lombok.Data;

@Data
public class Favorities {
    private Integer favid;

    private Integer uuid;

    private Integer fid;

    public FlowerDetail flowerDetail;
}