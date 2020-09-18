package com.school.ssm.service;

import com.school.ssm.po.Order;
import com.school.ssm.po.Shop;
import com.school.ssm.service.base.IBaseService;

import java.util.List;

public interface IOrderService extends IBaseService<Order> {

    void saveOrder(Order order, List<Shop> shopList);

    Order findOrderByORId(String orderId);

    void updateOrderStatus(String out_trade_no, String total_amount);

    List<Order> findAllByUUid(Integer uuid, String status);

    void OrderOper(String orderId);
}
