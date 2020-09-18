package com.school.ssm.service.impl;

import com.school.ssm.mapper.FlowerMapper;
import com.school.ssm.po.*;
import com.school.ssm.service.IFavoriteService;
import com.school.ssm.service.IShopService;
import com.school.ssm.service.base.BaseServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class ShopServiceImpl extends BaseServiceImpl<Shop> implements IShopService {
    @Override
    public void addShop(User user, int fid) {
        Shop shop = shopMapper.findById(user.getUuid(), fid);

        if (shop == null) {
            Shop shop1 = new Shop();
            shop1.setFid(fid);
            shop1.setNumber(1);
            shop1.setUuid(user.getUuid());
            insert(shop1);
        } else {
            shop.setNumber(shop.getNumber() + 1);
            update(shop);
        }
    }

    @Override
    public void deleteByT(Shop shop) {
        Shop byId = shopMapper.findById(shop.getUuid(), shop.getFid());
        if (byId != null) shopMapper.deleteByT(shop);
    }

    @Override
    public PageBean<Shop> findAllByUUid(int uuid) {
        List<Shop> list = shopMapper.findAllByUUid(uuid);

        for (int z = 0; z < list.size(); z++) {
            Double fprice = list.get(z).getFlowerDetail().getFprice();
            Double vipfprice = (double) Math.round(fprice * 0.8);
            list.get(z).getFlowerDetail().setVipFprice(vipfprice);
        }
        PageBean<Shop> PageBean = new PageBean<Shop>();
        PageBean.setList(list);
        return PageBean;
    }

    @Override
    public List<Shop> findShopTop() {
        List<Shop> shopTop = shopMapper.findShopTop();
        for (int z = 0; z < shopTop.size(); z++) {
            Double fprice = shopTop.get(z).getFlowerDetail().getFprice();
            Double vipfprice = (double) Math.round(fprice * 0.8);
            shopTop.get(z).getFlowerDetail().setVipFprice(vipfprice);
        }
        return shopTop;
    }

    @Override
    public List<Shop> findAllByUuid(Integer uuid, String[] fids) {
        List<Shop> shops = new ArrayList<Shop>();
        List<Shop> allByUUid = shopMapper.findAllByUUid(uuid);
        for (String fid : fids) {
            int i = Integer.parseInt(fid);
            for (Shop shop : allByUUid) {
                int fid1 = shop.getFid();
                if (fid1 == i) {
                    Double fprice = shop.getFlowerDetail().getFprice();
                    Double vipfprice = (double) Math.round(fprice * 0.8);
                    shop.getFlowerDetail().setVipFprice(vipfprice);
                    shops.add(shop);
                    break;
                }
            }
        }
        return shops;
    }

    @Override
    public List<Shop> getAndDelect(int uuid, String[] newString) {
        List<Shop> shopList = findAllByUuid(uuid, newString);
        System.out.println("1111111111111111132321" + shopList);
        if (shopList == null||shopList.size()==0) {
            String s = newString[0];
            int fid = Integer.parseInt(s);
//            FlowerDetail flowerDetailByFid = flowerMapper.findFlowerDetailByFid(fid);
            shopList = new ArrayList<Shop>();
            Shop shop = new Shop();
//            shop.setFlowerDetail(flowerDetailByFid);
//            shop.setUuid(uuid);
            shop.setNumber(1);
            shop.setFid(fid);
            shopList.add(shop);
        } else {
            for (int i = 0; i < shopList.size(); i++) {
                Shop shop = shopList.get(i);
                shopMapper.deleteByT(shop);
            }
        }

        return shopList;
    }


    @Override
    public List<Shop> findAll() {
        return shopMapper.findAll();
    }

    @Override
    public Shop findById(Integer id) {
        return null;
    }

    @Override
    public Shop findByUUID(int uuid) {
        return null;
    }

    @Override
    public void deleteByUUID(int uuid) {

    }

    @Override
    public void update(Shop shop) {
        shopMapper.update(shop);
    }

    @Override
    public void insert(Shop shop) {
        shopMapper.insert(shop);
    }
}
