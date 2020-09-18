package com.school.ssm.mapper;

import com.school.ssm.mapper.base.BaseMapper;
import com.school.ssm.po.FlowerDetail;
import com.school.ssm.po.FlowerImage;

import java.util.List;

public interface FlowerMapper extends BaseMapper<FlowerDetail> {
    public FlowerDetail findFlowerDetailByFid(int Fid);

    public List<FlowerDetail> flowerDetailListByinfos(String infos);

    public List<FlowerDetail> findFavoriteTop();

    public FlowerImage findFlowerImageByFid(int Fid);

    void updateByFid(Integer fid, Integer data);

    int findFlowerNumber(int fid);

    void dropFlower(int fid);

    List<FlowerDetail> findDropAll();

    List<FlowerDetail> dropFlowerDetailListByinfos(String infos);

    void uppFlower(int fid);
}
