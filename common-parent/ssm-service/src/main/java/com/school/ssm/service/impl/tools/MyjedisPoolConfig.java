package com.school.ssm.service.impl.tools;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.stereotype.Component;
import redis.clients.jedis.JedisPoolConfig;

@Configuration
@PropertySource("classpath:redis.properties")
public class MyjedisPoolConfig extends JedisPoolConfig {


    @Value("${redis.maxIdle}")
    private int maxIdle;
    @Value("${redis.maxTotal}")
    private int maxTotal;

    @Value("${redis.testOnBorrow}")
    private boolean testOnBorrow;

//    或者是使用以下写死的
//  private int maxIdle=300;
//    private int maxTotal=600;
//    private boolean testOnBorrow=true;

    public MyjedisPoolConfig(){}

    public MyjedisPoolConfig(int maxIdle, int maxTotal,   boolean testOnBorrow) {
        this.maxIdle = maxIdle;
        this.maxTotal = maxTotal;
        this.testOnBorrow = testOnBorrow;
    }

    @Override
    public int getMaxIdle() {
        return maxIdle;
    }

    @Override
    public void setMaxIdle(int maxIdle) {
        this.maxIdle = maxIdle;
    }

    @Override
    public int getMaxTotal() {
        return maxTotal;
    }

    @Override
    public void setMaxTotal(int maxTotal) {
        this.maxTotal = maxTotal;
    }
    @Override
    public boolean getTestOnBorrow() {
        return testOnBorrow;
    }

    public void setTestOnBorrow(boolean testOnBorrow) {
        this.testOnBorrow = testOnBorrow;
    }
}