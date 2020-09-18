package com.school.ssm.mapper;

import com.school.ssm.mapper.base.BaseMapper;
import com.school.ssm.po.OrderDetail;
import com.school.ssm.po.Shop;

import java.util.List;

public interface OrderDetailMapper  extends BaseMapper<OrderDetail> {
    public List<OrderDetail> findAllByORid(String orid);
    List<OrderDetail> findBuyTop();
}