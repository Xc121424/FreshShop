package com.school.ssm.service.impl.tools;

import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
@Service
public class RedisUtil {
    private static Jedis  jedis;
    private  RedisUtil(JedisPool jedisPool){
        jedis=jedisPool.getResource();
    }
    public static Jedis getJedis(JedisPool jedisPool){
        if(jedis==null){
            new RedisUtil(jedisPool);
        }
        return jedis;
    }
}
