package com.school.ssm.po;

import lombok.Data;

import java.util.List;

@Data
public class FlowerType {
    private Integer tid;

    private String tname;

    private List<FlowerDetailType> flowerDetailTypeList;

}