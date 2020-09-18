package com.school.ssm.service.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;

import javax.annotation.Resource;

public abstract class AbstractBaseRedis<K,V> {

    public AbstractBaseRedis(){

    }
@Resource
    protected RedisTemplate<K, V> redisTemplate;

    /**
     * 设置redisTemplate
     * @param redisTemplate the redisTemplate to set
     */
//    public void setRedisTemplate(RedisTemplate<K, V> redisTemplate){
//        System.out.println("312321312321312");
//        this.redisTemplate=redisTemplate;
//    }

    /**
     * 获取 RedisSerializer
     * <br>------------------------------<br>
     */
    protected RedisSerializer<String> getRedisSerializer() {
        return redisTemplate.getStringSerializer();
    }

}
