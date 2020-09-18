package com.school.ssm.service;

import com.school.ssm.po.FlowerDetail;
import com.school.ssm.po.PageBean;
import com.school.ssm.service.base.IBaseService;

import javax.jnlp.BasicService;
import java.util.List;

public interface IFlowerService extends IBaseService<FlowerDetail> {
    public FlowerDetail findFlowerDetailByFid(int Fid);
    public PageBean<FlowerDetail> flowerDetailListByinfos(String infos, int currIndex, int pageSize);
    int findFlowerNumber(int fid);
    public List<FlowerDetail> findFavoriteTop();

    void dropFlower(int fid);

    PageBean<FlowerDetail> dropFlowerDetailListByinfos(String infos, int currentPage, int rows);

    void uppFlower(int fid);
}
