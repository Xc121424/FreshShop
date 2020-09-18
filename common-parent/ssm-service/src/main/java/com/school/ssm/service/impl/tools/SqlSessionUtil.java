package com.school.ssm.service.impl.tools;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Configuration //表明当前类是spring的配置类
@ComponentScan("com.school.ssm")//表明创建容器时需要扫描的包
@EnableAspectJAutoProxy//开启spring对注解aop的支持
public class SqlSessionUtil {
    @Resource
    private SqlSessionFactory factory;
    @Bean("sqlSessionUtils")
    public SqlSession createSqlSessionUtils(){
return factory.openSession();
    }
}
