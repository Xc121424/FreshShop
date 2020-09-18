package com.school.ssm.service.base;

import com.school.ssm.mapper.*;
import com.school.ssm.service.RedisSaveManageService;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class BaseServiceImpl<T> implements IBaseService<T> {
    @Autowired
    protected UserMapper userMapper;
    @Autowired
    protected RouteMapper routeMapper;
    @Autowired
    protected FlowerTypeMapper flowerTypeMapper;
    @Autowired
    protected FavoriteMapper favoriteMapper;
    @Autowired
    protected FlowerMapper flowerMapper;
    @Autowired
    protected RedisSaveManageService redisSaveManageService;
    @Autowired
    protected ShopMapper shopMapper;
    @Autowired
    protected ReceiverMapper receiverMapper;
    @Autowired
    protected OrderMapper orderMapper;
    @Autowired
    protected OrderDetailMapper orderDetailMapper;
//    @Autowired
//    @Qualifier("sqlSessionUtils")
//    protected SqlSession sqlSession;
}