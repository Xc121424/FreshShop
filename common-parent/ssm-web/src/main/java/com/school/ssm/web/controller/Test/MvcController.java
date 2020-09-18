package com.school.ssm.web.controller.Test;

import com.school.ssm.po.Order;
import com.school.ssm.po.User;
import com.school.ssm.web.controller.Test.CustomerException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller("springMvc")
@RequestMapping("springmvc")
public class MvcController {

    @RequestMapping("/login")
    public String login() {
//        System.out.println("Hello");
        return "springmvc/springmvc";
    }

    @RequestMapping("/login1")
    public String login1() {
        return "springmvc/fileUpload";
    }
    @RequestMapping("/intoCustomerException")
    public String customerException() {
        return "springmvc/customerException";
    }
    //    void为返回值，会跳转至与注解值相同的jsp页面
    @RequestMapping("returnvoid")
    public void testReturnVoid() {
        System.out.println("return Void...");
    }

    @RequestMapping("testModelAndView")
    public ModelAndView testModelAndView() {
        ModelAndView mav = new ModelAndView();
        List<String> strings = new ArrayList<>();
        strings.add("1111");
        strings.add("2222");
        strings.add("3333");
        mav.addObject("list", strings);
        mav.setViewName("springmvc/ModelAndView");
        return mav;
    }

    @RequestMapping("testForward")
    public String testForward() {
        return "forward:/WEB-INF/Modules/user/success.jsp";
    }

    @RequestMapping("testRedirect")
    public String testRedirect() {
        return "redirect:testForward";
    }

    @RequestMapping("/testAjax")
    public void testAjax(HttpServletResponse response) throws Exception {

        StringBuffer stringBuffer = new StringBuffer();
        User order = new User();
//        order.setUid(222);
        Field[] df = User.class.getDeclaredFields();

        for(Field filed:df){
            filed.setAccessible(true);
            stringBuffer.append(filed.getName()).append("=").append(filed.get(order));
        }
        stringBuffer.delete(2,stringBuffer.length());

        System.out.println(stringBuffer.toString());
        response.setContentType("text/json;charset=utf-8");
        response.getWriter().write(stringBuffer.toString());
    }
    @RequestMapping("/testAjax2")
    public @ResponseBody Order testAjax2() {
//        System.out.println("2222222222222222222222");
        Order user = new Order();
        user.setUuid(1111);
       return user;
    }
    @RequestMapping(value = "/fileUpload")
    public  String fileUpload(String image,MultipartFile fileUpload,HttpServletRequest request) throws Exception {
        String realPath = request.getServletContext().getRealPath("/WEB-INF/fileUpload");
        String format = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        File file = new File(realPath, format);
        if(!file.exists()) file.mkdir();
        String name = fileUpload.getOriginalFilename();
        String replace = UUID.randomUUID().toString().replace("-", "");
        String newFileName=replace+"_"+name;
        fileUpload.transferTo(new File(file,newFileName));
//        System.out.println(newFileName);
        return "user/success";
    }
    @RequestMapping(value = "/customerException")
    public  String customerException(String customerException) throws CustomerException {
//        System.out.println(customerException);
        String yyyyMM = new SimpleDateFormat("yyyyMM").format(new Date());
//        System.out.println(yyyyMM);
        if(customerException.isEmpty())
            throw new CustomerException("文字不能为空！");
        return "user/success";
    }
}
