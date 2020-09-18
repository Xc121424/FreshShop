package com.school.ssm.mapper;

import com.school.ssm.mapper.base.BaseMapper;
import com.school.ssm.po.User;


public interface UserMapper extends BaseMapper<User> {
    public User findUser(String username);
    public void save(User user);
    public User findUserByCode(String code);
    public void updateStaus(User user);
    User findEmail(String email);

    User findManager(String username);
}