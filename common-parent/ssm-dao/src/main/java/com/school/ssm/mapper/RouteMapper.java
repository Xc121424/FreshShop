package com.school.ssm.mapper;

import com.school.ssm.mapper.base.BaseMapper;
import com.school.ssm.po.Route;

import java.util.List;

public interface RouteMapper extends BaseMapper<Route> {
    public List<Route> findList(int cid, int start, int rows) ;
    public int findAllCount(int cid) ;
}
