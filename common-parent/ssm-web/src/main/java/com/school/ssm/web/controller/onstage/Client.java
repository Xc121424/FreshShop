package com.school.ssm.web.controller.onstage;

import com.alibaba.fastjson.JSON;
import com.school.ssm.po.*;
import com.school.ssm.service.*;
import com.school.ssm.web.controller.utils.RandomValidateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller("Frame")
@RequestMapping("frame")
public class Client {
    @Autowired
    private IUserService userServiceImpl;
    @Autowired
    private IFlowerTypeService flowerTypeServiceImpl;
    @Autowired
    private IFlowerService flowerServiceImpl;
    @Autowired
    private IShopService shopServiceImpl;
    @Autowired
    private IOrderDetailService orderDetailServiceImpl;

    @RequestMapping("/index")
    public ModelAndView index(HttpSession session) {
        session.setAttribute("tid",-1);
        session.setAttribute("tname","首页");
        List<FlowerDetail> favoriteTop = flowerServiceImpl.findFavoriteTop();
        List<Shop> shopTop = shopServiceImpl.findShopTop();
        List<OrderDetail> buyTop =orderDetailServiceImpl.findBuyTop() ;
        Map flowerTypeByTid = flowerTypeServiceImpl.findFlowerTypeByTid(5, 1, 6);
        FlowerType flowerType= (FlowerType) flowerTypeByTid.get("FlowerType");
        Map flowerTypeByTidInLove = flowerTypeServiceImpl.findFlowerTypeByTid(1, 1, 6);
        FlowerType flowerTypeInLove= (FlowerType) flowerTypeByTidInLove.get("FlowerType");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        modelAndView.addObject("favoriteTop",favoriteTop);
        modelAndView.addObject("shopTop",shopTop);
        modelAndView.addObject("buyTop",buyTop);
        modelAndView.addObject("flowerType",flowerType);
        modelAndView.addObject("loveFlower",flowerTypeInLove);
        return modelAndView;
    }

    @RequestMapping("/intologin")
    public String intoLogin(HttpSession session) {
        session.setAttribute("tid",10);
        session.setAttribute("tname","登录");
        return "login";
    }

    @RequestMapping("/intoregister")
    public String intoregister(HttpSession session) {
        session.setAttribute("tid",11);
        session.setAttribute("tname","注册");
        return "register";
    }
    @RequestMapping("Redirect")
    public @ResponseBody String  Redirect() {
        return "请先登录！！";
    }

    @RequestMapping("/checkCode")
    public void checkCode(HttpServletResponse response, HttpServletRequest request) throws IOException {

        response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
        response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//输出验证码图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 验证登录
     *
     * @param model
     * @param account
     * @param password
     * @param check
     * @param session
     * @return
     */
    @RequestMapping(value = "userlogin", method = RequestMethod.POST)
    public String login(Model model, String account, String password, String check, HttpSession session, String checkBox, HttpServletResponse response) {
        //从session中获取随机数
        String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
        if (checkBox == null) checkBox = "";
        if (random.equalsIgnoreCase(check)) {
            User user1 = userServiceImpl.findUser(account);
            if (user1 == null) {
                model.addAttribute("error", "账号错误！");
                return "login";
            } else if (!user1.getPassword().equals(password)) {
                model.addAttribute("error", "密码错误！");
                return "login";
            } else {
                if (checkBox.equals("on")) {
                    session.setAttribute("user", user1);
                    session.setAttribute("clientTag", "1");
                    session.setMaxInactiveInterval(60 * 60 * 24 * 30);
                    Cookie jsessionid = new Cookie("JSESSIONID", session.getId());
                    jsessionid.setMaxAge(60 * 60 * 24 * 30);
                    jsessionid.setPath("/");
                    response.addCookie(jsessionid);
                } else {
                    session.setAttribute("user", user1);
                    session.setAttribute("clientTag", "1");
                }
                return "redirect:index";
            }
        } else {
            model.addAttribute("error", "验证码错误");
            model.addAttribute("name",account);
            return "login";
        }

    }

    @RequestMapping(value = "register")
    public @ResponseBody
    User register(@RequestBody(required = false) User user, HttpSession session) {
        userServiceImpl.register(user);
        session.setAttribute("user",user);
        return user;
    }

    @RequestMapping(value = "tag")
    public @ResponseBody List<FlowerType> tag() throws Exception {
        List<FlowerType> typeList =  flowerTypeServiceImpl.findAll();
//        FlowerType flowerType = typeList.get(0)
        return typeList;
    }
    @RequestMapping(value = "exit")
    public String exit(HttpSession session) {
        session.removeAttribute("user");
        session.setAttribute("clientTag", "0");
        return "redirect:index";
    }
    @RequestMapping(value = "findAccount")
    public @ResponseBody String findAccount(String account) {
        User user = userServiceImpl.findUser(account);
        if(user==null)return "true";
        else return "false";
    }
    @RequestMapping(value = "findEmail")
    public @ResponseBody String findEmail(String email) {
        User user = userServiceImpl.findEmail(email);
        if(user==null)return "true";
        else return "false";
    }
    @RequestMapping(value = "findname")
    public @ResponseBody String findname(HttpSession session) {
        String flag;
      User user =(User)session.getAttribute("user");
        if(user==null){
            flag="false";
        } else if(user.getSex().equals("1")) {
            String substring = user.getUsername().substring(0,1)+"先生";
            flag =substring;
        } else {
            String substring = user.getUsername().substring(0,1)+"女士";
            flag =substring;
        }

        return JSON.toJSONString(flag);
    }
    @RequestMapping(value = "personInfo")
    public ModelAndView personInfo(HttpSession session) {
        ModelAndView mav = new ModelAndView();
       User user= (User) session.getAttribute("user");
       mav.addObject("user",user);
       mav.setViewName("personInfo");
        return mav;
    }
    @RequestMapping(value = "updatePersonInfo")
    public @ResponseBody
    User updatePersonInfo(@RequestBody(required = false) User user, HttpSession session) {
        userServiceImpl.update(user);
        session.setAttribute("user",user);
        return user;
    }
    @RequestMapping(value = "changePassword")
    public ModelAndView changePassword(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        User user= (User) session.getAttribute("user");
        mav.addObject("user",user);
        mav.setViewName("change_password");

        return mav;
    }
    @RequestMapping(value = "updatePassword")
    public @ResponseBody User updatePassword(@RequestBody String password, HttpSession session) {
        User user= (User) session.getAttribute("user");
        user.setPassword(password);
        userServiceImpl.update(user);
        session.removeAttribute("user");
        return user;
    }
}