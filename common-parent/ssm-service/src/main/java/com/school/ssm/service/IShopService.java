package com.school.ssm.service;

import com.school.ssm.po.Favorities;
import com.school.ssm.po.PageBean;
import com.school.ssm.po.Shop;
import com.school.ssm.po.User;
import com.school.ssm.service.base.IBaseService;

import java.util.List;

public interface IShopService extends IBaseService<Shop> {

    void addShop(User user, int fid);

    PageBean<Shop> findAllByUUid(int uuid);

    List<Shop> findShopTop();

    List<Shop> findAllByUuid(Integer uuid, String[] fids);

    List<Shop> getAndDelect(int uuid, String[] newString);
}
