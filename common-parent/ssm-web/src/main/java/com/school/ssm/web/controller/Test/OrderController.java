package com.school.ssm.web.controller.Test;

import com.school.ssm.po.User;
import com.school.ssm.service.IResourceBundle;
import com.school.ssm.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    private IUserService userService;
    @Autowired
    private IResourceBundle ResourceBundle;
    @RequestMapping("/login")
    public String login(){
//        System.out.println("Hello");
        return "user/login";
    }

    /**
     * @RequestParam
     *    作用：
     *      解决jsp传入参数名与方法形参名不一致
     *     参数：
     *       value：jsp传入参数名
     *       required:是否一定需要jsp参数名传入；true为一定要有，false则反；
     * @param id
     * @return
     */
    @RequestMapping(value = "/find")
    public String find(@RequestParam(value = "user_id",required = false) Integer id){

        User user = userService.findById(id);
//        System.out.println(user.toString());
        return "user/success";
    }

    /**
     * @RequestBody 查看表单数据
     * @param body
     * @return
     */
    @RequestMapping(value = "/requestBody",method = RequestMethod.POST)
    public String requestBody(@RequestBody String body){
//        System.out.println(body);
        return "user/success";
    }
    @RequestMapping(value = "/save")
    public String save(User user){
//        System.out.println(user.toString());
        return "user/success";
    }
    @RequestMapping(value = "/pathVariable/{id}")
    public String pathVariable(@PathVariable(value = "id") Integer id){
//        System.out.println(id);
        return "user/success";
    }
}