package com.school.ssm.web.controller.Test;


import com.school.ssm.service.IResourceBundle;
import com.school.ssm.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private IUserService userService;
    @Autowired
    private IResourceBundle ResourceBundle;
    @RequestMapping("/login")
    public String login(){
//        System.out.println("Hello,boy");
        return "user/login";
    }

    @RequestMapping(value = "/find")
    public String find(Integer id){
//        System.out.println("HHH"+id);
//        onstage user = userService.findById(id);
//        System.out.println(user.toString());
        return "user/success";
    }
    @RequestMapping(value = "/bean",method = RequestMethod.POST)
    public String getBean(){
//        Object user = ResourceBundle.getBean("USER");
//        System.out.println(user.toString());
        return "user/success";
    }


}