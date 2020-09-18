package com.school.ssm.mapper;

import com.school.ssm.mapper.base.BaseMapper;
import com.school.ssm.po.Favorities;
import com.school.ssm.po.Shop;

import java.util.List;

public interface ShopMapper extends BaseMapper<Shop> {

    Shop findById(Integer uuid, int fid);

    List<Shop> findAllByUUid(Integer uuid);

    List<Shop> findShopTop();

}
