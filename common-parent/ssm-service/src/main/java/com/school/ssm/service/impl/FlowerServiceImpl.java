package com.school.ssm.service.impl;

import com.school.ssm.po.FlowerDetail;
import com.school.ssm.po.FlowerDetailType;
import com.school.ssm.po.PageBean;
import com.school.ssm.service.IFlowerService;
import com.school.ssm.service.base.BaseServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class FlowerServiceImpl extends BaseServiceImpl<FlowerDetail> implements IFlowerService {


    @Override
    public List<FlowerDetail> findAll() {
        return flowerMapper.findAll();
    }
    @Override
    public FlowerDetail findFlowerDetailByFid(int Fid) {
        FlowerDetail flowerDetailByFid = flowerMapper.findFlowerDetailByFid(Fid);
        Double fprice = flowerDetailByFid.getFprice();
        Double  vipfprice = (double) Math.round(fprice *0.8);
        flowerDetailByFid.setVipFprice(vipfprice);
        return flowerDetailByFid;
    }
    @Override
    public PageBean<FlowerDetail> flowerDetailListByinfos(String infos, int currIndex, int pageSize) {
        List<FlowerDetail> flowerDetails;
        if(infos==null||infos.equals("")){
            flowerDetails=flowerMapper.findAll();
        }else{
            flowerDetails = flowerMapper.flowerDetailListByinfos(infos);
        }

        int size1 = flowerDetails.size();
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
        List<FlowerDetail> flowerDetailType;
        if (currIndex * pageSize > flowerDetails.size()) {
            flowerDetailType = flowerDetails.subList((currIndex - 1) * pageSize, flowerDetails.size());
        } else {
            flowerDetailType = flowerDetails.subList((currIndex - 1) * pageSize, currIndex * pageSize);
        }
        for(int z=0;z<flowerDetailType.size();z++){
            Double fprice = flowerDetailType.get(z).getFprice();
            Double  vipfprice = (double) Math.round(fprice *0.8);
            flowerDetailType.get(z).setVipFprice(vipfprice);
        }
        PageBean<FlowerDetail> PageBean = new PageBean<FlowerDetail>();
        PageBean.setList(flowerDetailType);
        PageBean.setCurrentPage(currIndex);
        PageBean.setTotalPage(listSize);
        PageBean.setRows(pageSize);
        PageBean.setTotalCount(size1);
        return  PageBean;
    }

    @Override
    public int findFlowerNumber(int fid) {
        return flowerMapper.findFlowerNumber(fid);
    }

    @Override
    public List<FlowerDetail> findFavoriteTop() {
        List<FlowerDetail> favoriteTop = flowerMapper.findFavoriteTop();
        for(int z=0;z<favoriteTop.size();z++){
            Double fprice = favoriteTop.get(z).getFprice();
            Double  vipfprice = (double) Math.round(fprice *0.8);
            favoriteTop.get(z).setVipFprice(vipfprice);
        }
        return favoriteTop;
    }

    @Override
    public void dropFlower(int fid) {
        flowerMapper.dropFlower(fid);
    }
    @Override
    public void uppFlower(int fid) {
flowerMapper.uppFlower(fid);
    }
    @Override
    public PageBean<FlowerDetail> dropFlowerDetailListByinfos(String infos, int currIndex, int pageSize) {
        List<FlowerDetail> flowerDetails;
        if(infos==null||infos.equals("")){
            flowerDetails=flowerMapper.findDropAll();
        }else{
            flowerDetails = flowerMapper.dropFlowerDetailListByinfos(infos);
        }

        int size1 = flowerDetails.size();
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
        List<FlowerDetail> flowerDetailType;
        if (currIndex * pageSize > flowerDetails.size()) {
            flowerDetailType = flowerDetails.subList((currIndex - 1) * pageSize, flowerDetails.size());
        } else {
            flowerDetailType = flowerDetails.subList((currIndex - 1) * pageSize, currIndex * pageSize);
        }
        for(int z=0;z<flowerDetailType.size();z++){
            Double fprice = flowerDetailType.get(z).getFprice();
            Double  vipfprice = (double) Math.round(fprice *0.8);
            flowerDetailType.get(z).setVipFprice(vipfprice);
        }
        PageBean<FlowerDetail> PageBean = new PageBean<FlowerDetail>();
        PageBean.setList(flowerDetailType);
        PageBean.setCurrentPage(currIndex);
        PageBean.setTotalPage(listSize);
        PageBean.setRows(pageSize);
        PageBean.setTotalCount(size1);
        return  PageBean;
    }



    @Override
    public FlowerDetail findById(Integer id) {
        return null;
    }

    @Override
    public FlowerDetail findByUUID(int uuid) {
        return null;
    }

    @Override
    public void deleteByT(FlowerDetail flowerDetail) {

    }


    @Override
    public void deleteByUUID(int uuid) {

    }

    @Override
    public void update(FlowerDetail flowerDetail) {

    }

    @Override
    public void insert(FlowerDetail flowerDetail) {

    }
}
