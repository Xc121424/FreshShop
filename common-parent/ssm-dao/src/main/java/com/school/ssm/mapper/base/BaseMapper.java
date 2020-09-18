package com.school.ssm.mapper.base;

import com.school.ssm.po.Category;
import com.school.ssm.po.Shop;

import java.util.List;

public interface BaseMapper<T> {
    public List<T> findAll();

    public T findById(Integer id);

    public T findByUUID(int uuid);

    public void deleteByT(T t);

    public void deleteByUUID(int uuid);

    public void update(T t);

    public void insert(T t);
}
