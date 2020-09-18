package com.school.ssm.po;

import lombok.Data;

import java.util.List;

@Data
public class PageBean<T> {
    //    当前页
    private int CurrentPage;
    //    总条数
    private int totalCount;
    //总页数
    private int totalPage;
    //    每页行数
    private int rows;

    private List<T> list;

}
