package com.school.ssm.web.controller.onstage;

import com.school.ssm.po.PageBean;
import com.school.ssm.po.Receiver;
import com.school.ssm.po.Shop;
import com.school.ssm.po.User;
import com.school.ssm.service.IReceiverService;
import com.school.ssm.service.IShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller("myShop")
@RequestMapping("myShop")
public class MyShop {
    @Autowired
    private IShopService shopServiceImpl;
    @Autowired
    private IReceiverService receiverServiceImpl;
    @RequestMapping("addShop")
    public @ResponseBody
    String addShop(HttpSession session, int Fid) {
        User user = (User) session.getAttribute("user");
        shopServiceImpl.addShop(user, Fid);
        return "1";
    }
    @RequestMapping("intoShop")
    public ModelAndView intoShop(HttpSession session){

        User user= (User) session.getAttribute("user");
       PageBean<Shop> pageBean= shopServiceImpl.findAllByUUid(user.getUuid());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("pageBean",pageBean);
        modelAndView.setViewName("myshop");
        session.setAttribute("tid",13);
        session.setAttribute("tname","收藏夹");
        return modelAndView;
    }
    @RequestMapping("delShop")
    public  String delShop(HttpSession session, int Fid) {
        User user = (User) session.getAttribute("user");
        Shop shop = new Shop();
        shop.setUuid(user.getUuid());
        shop.setFid(Fid);
        shopServiceImpl.deleteByT(shop);
        return "redirect:intoShop?currentPage=1";
    }
    @RequestMapping("writeOrder")
    public  @ResponseBody String writeOrder(HttpSession session,@RequestBody String[] Fids) {
        User user = (User) session.getAttribute("user");
        Integer uuid = user.getUuid();
        List<Shop> shop=shopServiceImpl.findAllByUuid(uuid,Fids);
//        System.out.println(shop);
        session.setAttribute("shopList",shop);
        return "1";
    }
    @RequestMapping("intoWriteOrder")
    public  ModelAndView intoWriteOrder(HttpSession session) {
        List<Shop> shopList= (List<Shop>) session.getAttribute("shopList");
        User user=(User)session.getAttribute("user");
        List<Receiver> address =  receiverServiceImpl.findAll(user.getUuid());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("writeOrder");
        modelAndView.addObject("shopList",shopList);
        modelAndView.addObject("address",address);
        modelAndView.addObject("user",(User)session.getAttribute("user"));
        return modelAndView;
    }
}
