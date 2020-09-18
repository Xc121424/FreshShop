package com.school.ssm.service.impl;

import com.school.ssm.po.Order;
import com.school.ssm.po.OrderDetail;
import com.school.ssm.po.Shop;
import com.school.ssm.service.IOrderDetailService;
import com.school.ssm.service.IOrderService;
import com.school.ssm.service.base.BaseServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class OrderDetailServiceImpl extends BaseServiceImpl<OrderDetail> implements IOrderDetailService {


    @Override
    public List<OrderDetail> findAllByORid(String orid) {
        List<OrderDetail> orderDetailList = orderDetailMapper.findAllByORid(orid);
        for(OrderDetail orderDetail:orderDetailList){
            Double fprice = orderDetail.getFlowerDetail().getFprice();
            Double vipfprice = (double) Math.round(fprice * 0.8);
            orderDetail.getFlowerDetail().setVipFprice(vipfprice);
        }
        return orderDetailList;
    }

    @Override
    public List<OrderDetail> findBuyTop() {
        List<OrderDetail> buyTop = orderDetailMapper.findBuyTop();
        for(int z=0;z<buyTop.size();z++){
            Double fprice = buyTop.get(z).getFlowerDetail().getFprice();
            Double  vipfprice = (double) Math.round(fprice *0.8);
            buyTop.get(z).getFlowerDetail().setVipFprice(vipfprice);
        }
        return buyTop;
    }



    @Override
    public List<OrderDetail> findAll() {
        return null;
    }

    @Override
    public OrderDetail findById(Integer id) {
        return null;
    }

    @Override
    public OrderDetail findByUUID(int uuid) {
        return null;
    }

    @Override
    public void deleteByT(OrderDetail orderDetail) {

    }

    @Override
    public void deleteByUUID(int uuid) {

    }

    @Override
    public void update(OrderDetail orderDetail) {

    }

    @Override
    public void insert(OrderDetail orderDetail) {

    }
}
