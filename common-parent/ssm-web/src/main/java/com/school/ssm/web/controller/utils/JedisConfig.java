package com.school.ssm.web.controller.utils;



import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.*;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
@Service(value ="jedisConfig")
@Configuration //表明当前类是spring的配置类EnableAutoConfiguration
@ComponentScan("com.school.ssm")//表明创建容器时需要扫描的包
@EnableAspectJAutoProxy//开启spring对注解aop的支持ConfigurationProperties(prefix = "redis")
public class JedisConfig {
    /**
     * LOGGER
     */
    private static final Logger LOGGER = (Logger) LoggerFactory.getLogger(JedisConfig.class);
//    @Value("${redis.host}")
    private String host="127.0.0.1";
//    @Value("${redis.port}")
    private int port=6379;
//    @Value("${redis.password}")
    private String password="root";
//    @Value("${redis.timeout}")
    private int timeout=100000;
//    @Value("${redis.maxTotal}")
    private int maxActive=300;

//    @Value("${redis.maxWait}")
    private int maxWait=10000;
//    @Value("${redis.maxIdle}")
    private int maxIdle=200;
//    @Value("${redis.minIdle}")
    private int minIdle=10;
    @Bean
    @Scope
    public  JedisPool redisPoolFactory() {
        try {
            JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
            jedisPoolConfig.setMaxIdle(200);
            jedisPoolConfig.setMaxWaitMillis(10000);
            jedisPoolConfig.setMaxTotal(300);
            jedisPoolConfig.setMinIdle(10);
            // JedisPool jedisPool = new JedisPool(jedisPoolConfig, host, port, timeout, password);
            JedisPool jedisPool = new JedisPool(jedisPoolConfig, "127.0.0.1", 6379, 100000, null);
            LOGGER.info("初始化Redis连接池JedisPool成功!地址: " +"127.0.0.1" + ":" + 6379+":"+jedisPool);
            return jedisPool;
        } catch (Exception e) {
            LOGGER.error("初始化Redis连接池JedisPool异常:" + e.getMessage());
        }
        return null;
    }
    public String getHost() {
        return host;
    }
    public void setHost(String host) {
        this.host = host;
    }
    public int getPort() {
        return port;
    }
    public void setPort(int port) {
        this.port = port;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public int getTimeout() {
        return timeout;
    }
    public void setTimeout(int timeout) {
        this.timeout = timeout;
    }
    public int getMaxActive() {
        return maxActive;
    }
    public void setMaxActive(int maxActive) {
        this.maxActive = maxActive;
    }
    public int getMaxWait() {
        return maxWait;
    }
    public void setMaxWait(int maxWait) {
        this.maxWait = maxWait;
    }
    public int getMaxIdle() {
        return maxIdle;
    }
    public void setMaxIdle(int maxIdle) {
        this.maxIdle = maxIdle;
    }
    public int getMinIdle() {
        return minIdle;
    }
    public void setMinIdle(int minIdle) {
        this.minIdle = minIdle;
    }
}
