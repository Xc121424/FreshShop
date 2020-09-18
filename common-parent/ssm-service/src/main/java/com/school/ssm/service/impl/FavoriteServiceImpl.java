package com.school.ssm.service.impl;

import com.school.ssm.po.Favorities;
import com.school.ssm.po.FlowerDetail;
import com.school.ssm.po.PageBean;
import com.school.ssm.service.IFavoriteService;
import com.school.ssm.service.base.BaseServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class FavoriteServiceImpl extends BaseServiceImpl<Favorities> implements IFavoriteService {

    @Override
    public  PageBean<Favorities> findAllByUuid(Integer userUuid, int currIndex, int pageSize) {
        List<Favorities> allByUuid = favoriteMapper.findAllByUuid(userUuid);
        int size1 = allByUuid.size();
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

        List<Favorities> pageFavorities;
        if (currIndex * pageSize > allByUuid.size()) {
            pageFavorities = allByUuid.subList((currIndex - 1) * pageSize, allByUuid.size());
        } else {
            pageFavorities = allByUuid.subList((currIndex - 1) * pageSize, currIndex * pageSize);
        }
        for(int z=0;z<pageFavorities.size();z++){
            Double fprice = pageFavorities.get(z).getFlowerDetail().getFprice();
            Double  vipfprice = (double) Math.round(fprice *0.8);
            pageFavorities.get(z).getFlowerDetail().setVipFprice(vipfprice);
        }
        PageBean<Favorities> PageBean = new PageBean<Favorities>();
        PageBean.setList(pageFavorities);
        PageBean.setCurrentPage(currIndex);
        PageBean.setTotalPage(listSize);
        PageBean.setRows(pageSize);
        PageBean.setTotalCount(size1);
        return  PageBean;
    }



    @Override
    public int saveFavorite(Favorities favorities) {
        favoriteMapper.saveFavorite(favorities);
        flowerMapper.updateByFid(favorities.getFid(),1);
        int favoriteNumber = flowerMapper.findFlowerDetailByFid(favorities.getFid()).getFavoriteNumber();
        return  favoriteNumber;
    }

    @Override
    public Boolean qryIsFavorited(Favorities favorities) {
        List<Favorities> allByUuid = favoriteMapper.findAllByUuid(favorities.getUuid());
        Boolean flag=false;
        for(Favorities f:allByUuid){
            if(f.getFid().equals(favorities.getFid())){
                flag=true;
                break;
            }
        }
        return flag;
    }

    @Override
    public int cancelFavorite(Favorities favorities) {
        favoriteMapper.deleteByFavorities(favorities);
        flowerMapper.updateByFid(favorities.getFid(),-1);
        int favoriteNumber = flowerMapper.findFlowerDetailByFid(favorities.getFid()).getFavoriteNumber();
        return  favoriteNumber;
    }

    @Override
    public List<Favorities> findAll() {
        return null;
    }

    @Override
    public Favorities findById(Integer id) {
        return null;
    }

    @Override
    public Favorities findByUUID(int uuid) {
        return null;
    }

    @Override
    public void deleteByT(Favorities favorities) {}

    @Override
    public void deleteByUUID(int uuid) { }

    @Override
    public void update(Favorities favorities) { }

    @Override
    public void insert(Favorities favorities) { }
}
