package com.school.ssm.service;

import com.school.ssm.po.User;
import com.school.ssm.service.base.IBaseService;

public interface IUserService extends IBaseService<User>{
    public Boolean register(User user);
    public Boolean active(String code);
    public User findUser(String username);

    User findEmail(String email);

    User findManager(String username);
}