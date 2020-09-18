package com.school.ssm.po;

import lombok.Data;

@Data
public class FlowerDetailType {
    private int fdtid;
    private int tid;
    private int fid;
    private  FlowerDetail  flowerDetail;
}
