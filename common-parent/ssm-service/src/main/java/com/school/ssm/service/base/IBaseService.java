package com.school.ssm.service.base;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.school.ssm.po.Category;

import java.util.List;

public interface IBaseService<T> {
    public List<T> findAll() ;

    public T findById(Integer id);

    public T findByUUID(int uuid);

    public void deleteByT(T t);

    public void deleteByUUID(int uuid);

    public void update(T t);

    public void insert(T t);
}