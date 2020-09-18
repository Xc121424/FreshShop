package com.school.ssm.po;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class Order {
    private String orid;

    private Integer uuid;

    private Integer rid;

    private Receiver receiver;

    private Date deltime;

    private Date rectime;

    private Double orprice;

    private String status;

    private List<OrderDetail> orderDetailList;
}