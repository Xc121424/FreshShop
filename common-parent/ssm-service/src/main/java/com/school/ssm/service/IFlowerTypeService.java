package com.school.ssm.service;

import com.school.ssm.po.FlowerDetailType;
import com.school.ssm.po.FlowerType;
import com.school.ssm.service.base.IBaseService;

import java.util.List;
import java.util.Map;

public interface IFlowerTypeService extends IBaseService<FlowerType> {
//    public List<FlowerType> findAll(String flowerType);
    public Map findFlowerTypeByTid(int tid, int currIndex, int pageSize);

    List<FlowerDetailType> findAllByFid(int fid);
}
