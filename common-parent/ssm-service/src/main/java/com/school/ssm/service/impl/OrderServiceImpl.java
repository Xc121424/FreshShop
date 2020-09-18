package com.school.ssm.service.impl;

import com.school.ssm.po.Order;
import com.school.ssm.po.OrderDetail;
import com.school.ssm.po.Shop;
import com.school.ssm.service.IOrderService;
import com.school.ssm.service.base.BaseServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class OrderServiceImpl extends BaseServiceImpl<Order> implements IOrderService {

    @Override
    public List<Order> findAll() {
        return null;
    }

    @Override
    public Order findById(Integer id) {
        return null;
    }

    @Override
    public Order findByUUID(int uuid) {
        return null;
    }

    @Override
    public void deleteByT(Order order) {

    }

    @Override
    public void deleteByUUID(int uuid) {

    }

    @Override
    public void update(Order order) {

    }

    @Override
    public void insert(Order order) {
        orderMapper.insert(order);
    }

    @Override
    public void saveOrder(Order order, List<Shop> shopList) {
        List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
        insert(order);
        System.out.println("1211111111111"+shopList);
      for(int i=0;i<shopList.size();i++){
          OrderDetail orderDetail = new OrderDetail();
          orderDetail.setFid(shopList.get(i).getFid());
          orderDetail.setOrid(order.getOrid());
          orderDetail.setFamount(shopList.get(i).getNumber());
          orderDetailMapper.insert(orderDetail);
      }
    }

    @Override
    public Order findOrderByORId(String orderId) {
        return orderMapper.findOrderByORId(orderId);
    }

    @Override
    public void updateOrderStatus(String out_trade_no, String total_amount) {
        orderMapper.update(out_trade_no,total_amount);
    }

    @Override
    public List<Order> findAllByUUid(Integer uuid, String status) {
        return orderMapper.findAllByUUid(uuid,status);
    }

    @Override
    public void OrderOper(String orderId) {
        orderMapper.OrderOper(orderId);
    }
}
