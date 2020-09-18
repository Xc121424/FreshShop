package com.school.ssm.mapper;

import com.school.ssm.mapper.base.BaseMapper;
import com.school.ssm.po.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper extends BaseMapper<Order> {

    Order findOrderByORId(String orderId);

    void update(String out_trade_no, String total_amount);

    List<Order> findAllByUUid(Integer uuid, String status);

    void OrderOper(String orderId);
}