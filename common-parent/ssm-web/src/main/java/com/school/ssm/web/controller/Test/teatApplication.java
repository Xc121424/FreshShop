package com.school.ssm.web.controller.Test;

import com.school.ssm.po.Order;
import com.sun.tools.internal.xjc.reader.xmlschema.bindinfo.BIConversion;
import javafx.application.Application;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class teatApplication {
   static int i=0;
    public static void main(String[] args) {
        //读取完配置文件就创建对象（适合单例对象）
//        ApplicationContext app = new ClassPathXmlApplicationContext("applicationContext.xml");
//        Order order = app.getBean("order", Order.class);
//        System.out.println(order);
        //延迟加载，当getBean走完后在创建对象（适合多例）
//    Resource Resource = new ClassPathResource("applicationContext.xml");
//     BeanFactory BeanFactory = new XmlBeanFactory(Resource);
//        Order order = BeanFactory.getBean("order", Order.class);
////        System.out.println("dsf"+order);
//      StringBuffer sb=new StringBuffer();
//      int value=18;
//      do{
//          int temp=value&0x07;
//          System.out.println(temp);
//          sb.append(temp);
//      }while((value>>>=3)!=0);
//
//        System.out.println(sb.reverse());


    }
}
