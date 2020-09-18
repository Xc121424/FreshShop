package com.school.ssm.mapper;

import com.school.ssm.mapper.base.BaseMapper;
import com.school.ssm.po.Favorities;
import com.school.ssm.po.FlowerDetail;
import com.school.ssm.po.FlowerImage;

import java.util.List;
import java.util.Map;

public interface FavoriteMapper extends BaseMapper<Favorities> {
    public List<Favorities> findAllByUuid(int uuid);

    void saveFavorite(Favorities favorities);

    void deleteByFavorities(Favorities favorities);
}
