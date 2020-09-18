package com.school.ssm.mapper;

import com.school.ssm.mapper.base.BaseMapper;
import com.school.ssm.po.FlowerDetailType;
import com.school.ssm.po.FlowerType;

import java.util.List;

public interface FlowerTypeMapper extends BaseMapper<FlowerType> {
    FlowerType findAllByTid(int tid);

    List<FlowerDetailType> findAllByFid(int fid);
}
