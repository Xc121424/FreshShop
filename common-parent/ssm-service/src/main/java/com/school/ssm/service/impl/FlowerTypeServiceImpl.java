package com.school.ssm.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.school.ssm.po.Favorities;
import com.school.ssm.po.FlowerDetailType;
import com.school.ssm.po.FlowerType;
import com.school.ssm.service.IFlowerTypeService;
import com.school.ssm.service.base.BaseServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
@Transactional
public class FlowerTypeServiceImpl extends BaseServiceImpl<FlowerType> implements IFlowerTypeService {
    @Override
    public List<FlowerType> findAll()  {
        List<FlowerType> category;
////        SqlSession sqlSession = factory.openSession();
//        FlowerTypeMapper mapper = sqlSession.getMapper(FlowerTypeMapper.class);
        String favoriteType1 = redisSaveManageService.get("favoriteTypes2");
        if (favoriteType1 == null) {
            category = flowerTypeMapper.findAll();
            // //将FlowerType转换为json字符串
            String s = JSONObject.toJSONString(category);
            //吧FlowerType这个数组存放到redis中
            boolean favoriteType = redisSaveManageService.add("favoriteTypes2", s);
        } else {
       category = JSONObject.parseArray(favoriteType1, FlowerType.class);
        }

        return category;

    }

    @Override
    public FlowerType findById(Integer id) {
        return null;
    }

    @Override
    public FlowerType findByUUID(int uuid) {
        return null;
    }

    @Override
    public void deleteByT(FlowerType flowerType) {

    }


    @Override
    public void deleteByUUID(int uuid) {

    }

    @Override
    public void update(FlowerType flowerType) {

    }

    @Override
    public void insert(FlowerType flowerType) {

    }

    @Override
    public Map findFlowerTypeByTid(int tid, int currIndex, int pageSize) {
        FlowerType byId = flowerTypeMapper.findAllByTid(tid);
        List<FlowerDetailType> flowerDetailTypeList = byId.getFlowerDetailTypeList();
        int size1 = flowerDetailTypeList.size();
        int size =size1 / pageSize;
        int i =size1 % pageSize;
        int listSize;
        if (size1 == 0||size == 0) {
            listSize = 1;
        } else if (i == 0) {
            listSize = size;
        } else {
            listSize = size + 1;
        }

        List<FlowerDetailType> flowerDetailType;
        if (currIndex * pageSize > flowerDetailTypeList.size()) {
            flowerDetailType = flowerDetailTypeList.subList((currIndex - 1) * pageSize, flowerDetailTypeList.size());
        } else {
            flowerDetailType = flowerDetailTypeList.subList((currIndex - 1) * pageSize, currIndex * pageSize);
        }
        for(int z=0;z<flowerDetailType.size();z++){
            Double fprice = flowerDetailType.get(z).getFlowerDetail().getFprice();
            Double  vipfprice = (double) Math.round(fprice *0.8);
            flowerDetailType.get(z).getFlowerDetail().setVipFprice(vipfprice);
        }
        byId.setFlowerDetailTypeList(flowerDetailType);
        Map map=new HashMap();
        map.put("listSize",listSize);
        map.put("FlowerType",byId);
        map.put("tname",byId.getTname());
        return map;

    }

    @Override
    public List<FlowerDetailType> findAllByFid(int fid) {
        List<FlowerDetailType> flowerDetailType = flowerTypeMapper.findAllByFid(fid);

            Double fprice = flowerDetailType.get(0).getFlowerDetail().getFprice();
            Double  vipfprice = (double) Math.round(fprice *0.8);
            flowerDetailType.get(0).getFlowerDetail().setVipFprice(vipfprice);

        return flowerDetailType;
    }
}
