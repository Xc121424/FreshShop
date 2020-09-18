package com.school.ssm.service;

import com.school.ssm.po.Favorities;
import com.school.ssm.po.PageBean;
import com.school.ssm.service.base.IBaseService;

import java.util.Map;

public interface IFavoriteService extends IBaseService<Favorities> {
    public PageBean<Favorities> findAllByUuid(Integer userUuid, int currIndex, int pageSize);

    public int saveFavorite(Favorities favorities);

    Boolean qryIsFavorited(Favorities favorities);

    int cancelFavorite(Favorities favorities);
}
