package com.school.ssm.service;

import com.school.ssm.po.Order;
import com.school.ssm.po.OrderDetail;
import com.school.ssm.po.Shop;
import com.school.ssm.service.base.IBaseService;

import java.util.List;

public interface IOrderDetailService extends IBaseService<OrderDetail> {

    List<OrderDetail> findAllByORid(String orid);

    List<OrderDetail> findBuyTop();

}
