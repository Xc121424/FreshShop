package com.school.ssm.service.impl;

import com.school.ssm.po.Category;
import com.school.ssm.po.User;
import com.school.ssm.service.IResourceBundle;
import com.school.ssm.service.IUserService;
import com.school.ssm.service.base.BaseServiceImpl;
import com.school.ssm.service.impl.tools.MailUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.Jedis;

import java.util.*;

@Service
@Transactional
public class UserServiceImpl extends BaseServiceImpl<User> implements IUserService,IResourceBundle{

    //读取properties文件，不能写入
    private static ResourceBundle bundle=ResourceBundle.getBundle("bean.poBean");//为包路径+类名
    private static Map<String,Object> beans=new HashMap<String, Object>();
    static {
        Enumeration<String> keys = bundle.getKeys();
        while(keys.hasMoreElements()){
            String key = keys.nextElement();
            String string = bundle.getString(key);
            try {
                Object o = Class.forName(string).newInstance();
                beans.put(key,o);
            } catch (Exception e) {
                throw new ExceptionInInitializerError("容器初始化失败！");
            }
        }
    }


    public Object getBean(String url) {
        Object o = beans.get(url);
        return o;
    }



    public Boolean register(User user) {
            userMapper.save(user);
            return true;
    }

    @Override
    public Boolean active(String code) {
        User user = userMapper.findUserByCode(code);
        if (user != null) {
            userMapper.updateStaus(user);
            return true;
        } else return false;
    }
    @Override
    public User findUser(String account) {
        User user = userMapper.findUser(account);
        return user;
    }

    @Override
    public User findEmail(String email) {
        User user = userMapper.findEmail(email);
        return user;
    }

    @Override
    public User findManager(String username) {
        return userMapper.findManager(username);
    }


    @Override
    public List<User> findAll() {
        return null;
    }

    @Override
    public User findById(Integer id) {
        return null;
    }

    @Override
    public User findByUUID(int uuid) {
        return null;
    }

    @Override
    public void deleteByT(User user) {

    }


    @Override
    public void deleteByUUID(int uuid) {

    }

    @Override
    public void update(User user) {
userMapper.update(user);
    }

    @Override
    public void insert(User user) {

    }
}